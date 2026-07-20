//
// Created by os on 6/22/26.
//

#include "../h/scheduler.hpp"

List<tcb> Scheduler::readyQueue;

tcb *Scheduler::get() {
    return readyQueue.removeFirst();
}

void Scheduler::put(tcb *tcb) {
    readyQueue.addLast(tcb);
}