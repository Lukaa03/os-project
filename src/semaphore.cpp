//
// Created by os on 7/20/26.
//

#include "../h/semaphore.hpp"
#include "../h/scheduler.hpp"

KSemaphore* KSemaphore::createKSemaphore(unsigned init) {
    return new KSemaphore(init);
}

int KSemaphore::wait() {
    value--;
    if (value < 0) {
        TCB::running->setBlocked(true);
        blockedQueue.addLast(TCB::running);
        TCB::dispatch();
    }
    return value;
}

int KSemaphore::signal() {
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

int KSemaphore::close() {
    while (TCB* t = blockedQueue.removeFirst()) {
        t->setBlocked(false);
        Scheduler::put(t);
    }
    return 0;
}

