//
// Created by os on 7/19/26.
//

#include "../h/riscv.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/semaphore.hpp"
#include "../h/tcb.hpp"
#include "../lib/console.h"
#include "../h/print.hpp"

void Riscv::popSppSpie() {
    mc_sstatus(SSTATUS_SPP); // spp=0, sret ide u kor. rezim
    __asm__ volatile("csrw sepc, ra"); // sepc povratna vrednost
    __asm__ volatile("sret"); // vrati se na sepc, ali u kor. rezimu
}

void Riscv::handleSupervisorTrap(uint64* regs) {

    uint64 scause = r_scause();

    if (scause == ecallU || scause == ecallS) {

        uint64 sepc = r_sepc() + 4;
        uint64 sstatus = r_sstatus();

        uint64 code = regs[10]; // a0 = kod

        switch (code) {
            case 0x01: { // mem_alloc
                regs[10] = (uint64) MemoryAllocator::mem_alloc((size_t) regs[11]);
                break;
            }
            case 0x02: { // mem_free
                regs[10] = (uint64) MemoryAllocator::mem_free((void*) regs[11]);
                break;
            }
            case 0x03: {

                break;
            }
            case 0x04: {

                break;
            }
            case 0x11: { // thread_create
                TCB** handle = (TCB**) regs[11];
                TCB::Body body = (TCB::Body) regs[12];
                void* arg = (void*) regs[13];
                uint64* stack = (uint64*) regs[14];
                *handle = TCB::createThread(body, arg, stack);
                regs[10] = 0; // uradio dobro
                break;
            }
            case 0x12: { // thread_exit
                TCB::exit();
                break;
            }
            case 0x13: { // thread_dispatch
                TCB::dispatch();
                break;
            }
            case 0x21: { // sem_open
                KSemaphore** h = (KSemaphore**) regs[11];
                *h = KSemaphore::createSemaphore((unsigned) regs[12]);
                regs[10] = (*h != nullptr) ? 0 : -1;
                break;
            }
            case 0x22: { // sem_close
                KSemaphore* sem = (KSemaphore*) regs[11];
                regs[10] = (sem == nullptr) ? -1 : sem->close();
                break;
            }
            case 0x23: { // sem_wait
                regs[10] = ((KSemaphore*) regs[11])->wait();
                break;
            }
            case 0x24: { // sem_signal
                regs[10] = ((KSemaphore*) regs[11])->signal();
                break;
            }
            case 0x31: {

                break;
            }
            case 0x41: { // getc
                regs[10] = (uint64) __getc();      // rezultat u a0
                break;
            }
            case 0x42: { // putc
                __putc((char) regs[11]);           // a1 = znak
                break;
            }
        }
        w_sstatus(sstatus);
        w_sepc(sepc);

    } else if (scause == timer) {
        mc_sip(Riscv::SIP_SSIE);
    } else if (scause == console) {
        uint64 sepc = r_sepc();
        uint64 sstatuc = r_sstatus();
        console_handler();
        w_sstatus(sstatuc);
        w_sepc(sepc);
    } else {
        printString("Neocekivan scause\n");
        *(volatile uint32*)0x100000 = 0x5555;
    }

}
// 1,2,3,4,7