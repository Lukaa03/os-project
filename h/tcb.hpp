//
// Created by os on 6/22/26.
//

#ifndef PROJECT_BASE_TCB_HPP
#define PROJECT_BASE_TCB_HPP

#include "../lib/hw.h"
#include "../h/scheduler.hpp"

// CCB - Coroutine Control Block
// TCB - Thread Control Block

class TCB {
public:

    using Body = void (*)(void*);


    ~TCB() { delete[] stack; }

    static TCB* createThread(Body body, void* arg, uint64 stastSpace);
    static void dispatch();
    static void exit();
    bool isFinished() const { return finished; }
    static TCB* running;



    void setFinished(bool finished) { TCB::finished = finished; }
    static void yield();  // metoda koju poziva korutina za predaju procesa, u strukturu context smo samo stavili ova 2 registra, tako da ostatak moramo na stack


private:
    TCB(Body body, void* arg, uint64* stackSpace);

    struct Context {
        uint64 ra;  // adresa gde se vracamo iz corutine
        uint64 sp;  // do koje adrese u steku smo dosli u corutini na steku stack
    };

    Body body;
    void* arg;
    uint64 *stack; // svaka korutina ima svoj stack, tu stavljamo sve registre koje koristi
    Context context;
    bool finished;
    bool blocked;

    static void threadWrapper();
    static void contextSwitch(Context *oldContext, Context *newContext);


    static uint64 constexpr STACK_SIZE = DEFAULT_STACK_SIZE;
};


#endif //PROJECT_BASE_TCB_HPP
