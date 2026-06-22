//
// Created by os on 6/22/26.
//

#ifndef PROJECT_BASE_SCHEDULER_HPP
#define PROJECT_BASE_SCHEDULER_HPP

#include "list.hpp"

class CCB;

class Scheduler {
private:
    static List<CCB*> readyCoroutineQueue;

public:
    static CCB *get();

    static void put(CCB *ccb);
};

#endif //PROJECT_BASE_SCHEDULER_HPP
