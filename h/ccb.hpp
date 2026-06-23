//
// Created by os on 6/22/26.
//

#ifndef PROJECT_BASE_CCB_HPP
#define PROJECT_BASE_CCB_HPP

#include "../lib/hw.h"
#include "../h/scheduler.hpp"

// CCB - Coroutine Control Block
class CCB {
public:

    bool isFinished() const { return finished; }

    void setFinished(bool finished) { CCB::finished = finished; }

    using Body = void (*)();

    static CCB *createCoroutine(Body body);

    static void yield();  // metoda koju poziva korutina za predaju procesa, u strukturu context smo samo stavili ova 2 registra, tako da ostatak moramo na stack

    static CCB* running;

private:
    CCB(Body body) : body(body), stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr), context( { body != nullptr ? (uint64) body : 0, stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0 }), finished(false) {
        if (body != nullptr) { Scheduler::put(this); }
    }

    struct Context {
        uint64 ra;  // adresa gde se vracamo iz corutine
        uint64 sp;  // do koje adrese u steku smo dosli u corutini na steku stack
    };
    Body body;
    uint64 *stack; // svaka korutina ima svoj stack, tu stavljamo sve registre koje koristi
    Context context;
    bool finished;

    static void contextSwitch(Context *oldContext, Context *newContext);

    static void dispatch();

    static uint64 constexpr STACK_SIZE = 1024;
};


#endif //PROJECT_BASE_CCB_HPP
