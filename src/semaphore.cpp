//
// Created by os on 7/20/26.
//

#include "../h/semaphore.hpp"
#include "../h/scheduler.hpp"

Semaphore* Semaphore::createSemapthore(unsigned init) {
    return new Semaphore(init);
}

int Semaphore::wait() {
    value--;
    if (value < 0) {
        TCB::running->blocked = true;
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
            t->blocked = false;
            Scheduler::put(t);
        }
    }
    return 0;
}

int Semaphore::close() {
    while (TCB* t = blockedQueue.removeFirst()) {
        t->blocked = false;
        Scheduler::put(t);
    }
    return 0;
}

