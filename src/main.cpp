//
// Created by os on 6/21/26.
//

#include "../h/riscv.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/tcb.hpp"
#include "../h/syscall_c.hpp"
#include "../h/print.hpp"

void radnikA(void*) { for (int i=0;i<5;i++) { printString("A\n"); thread_dispatch(); }}
void radnikB(void*) { for (int i=0;i<5;i++) { printString("B\n"); thread_dispatch(); }}

int main() {

    MemoryAllocator::initialize();
    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);

    TCB* mainThread = TCB::createThread(nullptr, nullptr, nullptr);
    TCB::running = mainThread;

    thread_t a,b;
    thread_create(&a, radnikA, nullptr);
    thread_create(&b, radnikB, nullptr);

    for (int i=0;i<20;i++)
        thread_dispatch();

    printString("Kraj\n");
    *(volatile uint32*) 0x100000 = 0x5555;
    return 0;


}