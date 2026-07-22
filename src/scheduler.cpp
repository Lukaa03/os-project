//
// Created by os on 6/22/26.
//

#include "../h/scheduler.hpp"

List<TCB> Scheduler::readyQueue;

TCB *Scheduler::get() {
    return readyQueue.removeFirst();
}

void Scheduler::put(TCB *tcb) {
    readyQueue.addLast(tcb);
}