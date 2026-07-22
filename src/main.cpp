//
// Created by os on 6/21/26.
//


// threads proba
/*
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

*/
// semaphore test
/*
#include "../h/MemoryAllocator.hpp"
#include "../h/print.hpp"
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/tcb.hpp"

sem_t sem;

void radnikB(void*) {
    printString("B: cekam na semaforu...\n");
    sem_wait(sem);
    printString("B: nastavio posle signala\n");
}

void radnikA(void*) {
    for (int i=0;i<3;i++) { printString("A: radim\n"); thread_dispatch(); }
    printString("A: saljem signal\n");
    sem_signal(sem);
}

int main() {
    MemoryAllocator::initialize();
    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);

    TCB* mainThread = TCB::createThread(nullptr, nullptr, nullptr);
    TCB::running = mainThread;

    sem_open(&sem, 0);

    thread_t a,b;
    thread_create(&b, radnikB, nullptr);
    thread_create(&a, radnikA, nullptr);

    for (int i=0;i<20;i++) thread_dispatch();

    printString("Kraj\n");
    *(volatile uint32*) 0x100000 = 0x5555;
    return 0;
}
*/

// syscall_cpp

#include "../h/syscall_cpp.hpp"
#include "../h/print.hpp"
#include "../h/riscv.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/tcb.hpp"

Semaphore* gotovo;

void radnik(void* a) {
    for (int i=0;i<3;i++) {
        printString((char*)a);
        Thread::dispatch();
    }
    gotovo->signal();
}

class MojaNit : public Thread {
protected:
    void run() override {
        for (int i=0;i<3;i++) {
            printString("C\n");
            Thread::dispatch();
        }
        gotovo->signal();
    }
};

int main() {
    MemoryAllocator::initialize();
    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    TCB* mainThread = TCB::createThread(nullptr, nullptr, nullptr);
    TCB::running = mainThread;

    gotovo = new Semaphore(0);

    Thread tA(radnik, (void*)"A\n");
    Thread tB(radnik, (void*)"B\n");
    MojaNit tC;

    tA.start();
    tB.start();
    tC.start();

    gotovo->wait();
    gotovo->wait();
    gotovo->wait();

    printString("Kraj\n");
    *(volatile uint32*)0x100000 = 0x5555;
    return 0;
}