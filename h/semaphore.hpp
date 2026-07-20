//
// Created by os on 7/20/26.
//

#ifndef PROJECT_BASE_SEMAPHORE_HPP
#define PROJECT_BASE_SEMAPHORE_HPP
#include "list.hpp"
#include "tcb.hpp"


class Semaphore {
public:
    static Semaphore* createSemapthore(unsigned init);
    int wait();
    int signal();
    int close();
private:
    Semaphore(unsigned init) : value(init) {}
    int value;
    List<TCB> blockedQueue;
};


#endif //PROJECT_BASE_SEMAPHORE_HPP
