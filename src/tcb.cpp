//
// Created by os on 6/22/26.
//

#include "../h/tcb.hpp"
#include "../h/riscv.hpp"
#include "../h/scheduler.hpp"

TCB *TCB::running = nullptr;

TCB::TCB(Body body, void *arg, uint64 *stackSpace)
    : body(body), arg(arg),
    stack(stackSpace),
    context({ body != nullptr ? (uint64) body : 0, stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0 }),
    finished(false),
    blocked(false){

    if (body != nullptr) { Scheduler::put(this); }

}

TCB TCB::*createThread(Body body, void *arg, uint64 *stackSpace) {
    return new TCB(body, arg, stackSpace);
}

void TCB::yield() {
    Riscv::pushRegisters();  // cuvamo kontekst

    //promena konteksta
    TCB::dispatch();

    Riscv::popRegisters();  // restauiramo kontekst
}

void TCB::dispatch() {
    Riscv::pushRegisters();
    TCB *old = running;
    if (!old->finished && !old->blocked) { Scheduler::put(old); }
    running = Scheduler::get();
    TCB::contextSwitch(&old->context, &running->context);
    Riscv::popRegisters();
}

void TCB::exit() {
    running->finished = true;
    dispatch();
}
