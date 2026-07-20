//
// Created by os on 7/20/26.
//

#include "../h/semaphore.hpp"
#include "../h/scheduler.hpp"

Semaphore* Semaphore::createSemaphore(unsigned init) {
    return new Semaphore(init);
}

int Semaphore::wait() {
    value--;
    if (value < 0) {
        TCB::running->setBlocked(true);
        blockedQueue.addLast(TCB::running);
        TCB::dispatch();
    }
    return value;
}

int Semaphore::signal() {
    value++;
    if (value <= 0) {
        TCB* t = blockedQueue.removeFirst();
        if (t) {
            t->setBlocked(false);
            Scheduler::put(t);
        }
    }
    return 0;
}

int Semaphore::close() {
    while (TCB* t = blockedQueue.removeFirst()) {
        t->setBlocked(false);
        Scheduler::put(t);
    }
    return 0;
}

