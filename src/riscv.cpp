//
// Created by os on 7/19/26.
//

#include "../h/riscv.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/semaphore.hpp"
#include "../h/tcb.hpp"

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
                regs[10] = 0;
                break;
            }
            case 0x22: { // sem_close
                regs[10] = ((KSemaphore*) regs[11])->close();
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
            case 0x41: {

                break;
            }
            case 0x42: {

                break;
            }
        }
        w_sstatus(sstatus);
        w_sepc(sepc);

    } else if (scause == timer) {

    } else if (scause == console) {

    } else {

    }

}
