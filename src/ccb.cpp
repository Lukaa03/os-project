//
// Created by os on 6/22/26.
//

#include "../h/ccb.hpp"
#include "../h/riscv.hpp"
#include "../h/scheduler.hpp"

CCB *CCB::createCoroutine(Body body) {
    return new CCB(body);
}



void CCB::yield() {
    Riscv::pushRegisters();  // cuvamo kontekst

    //promena konteksta

    Riscv::popRegisters();  // restauiramo kontekst
}

void CCB::dispatch() {
    CCB *old = running;
    if (old->isFinished()) { Scheduler::put(old); }
    running = Scheduler::get();

    CCB::contextSwitch(&old->context, &running->context);
}