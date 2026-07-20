//
// Created by os on 6/22/26.
//

#ifndef PROJECT_BASE_SCHEDULER_HPP
#define PROJECT_BASE_SCHEDULER_HPP

#include "list.hpp"

class TCB;

class Scheduler {
private:
    static List<TCB> readyQueue;
public:
    static TCB *get();
    static void put(TCB *ccb);
};

#endif //PROJECT_BASE_SCHEDULER_HPP
