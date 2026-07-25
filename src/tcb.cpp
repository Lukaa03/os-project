//
// Created by os on 6/22/26.
//

#include "../h/tcb.hpp"
#include "../h/riscv.hpp"
#include "../h/scheduler.hpp"

TCB *TCB::running = nullptr;

void TCB::initialize() {
    if (running == nullptr) {
        running = createThread(nullptr, nullptr,nullptr);
    }
}

TCB::TCB(Body body, void *arg, uint64 *stackSpace)
    : body(body),
    arg(arg),
    stack(stackSpace),
    context({ (uint64) &threadWrapper, (uint64) stackSpace }),
    finished(false),
    blocked(false){

    if (body != nullptr) { Scheduler::put(this); }

}

TCB* TCB::createThread(Body body, void *arg, uint64 *stackSpace) {
    return new TCB(body, arg, stackSpace);
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

void TCB::threadWrapper() {
    running->body(running->arg);
    TCB::exit();
}
