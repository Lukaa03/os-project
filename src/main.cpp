//
// Created by os on 6/21/26.
//


#include "../h/ccb.hpp"

int main() {
    CCB *coroutines[3]; // jedna korutina je za main, a druge 2 za neki primer

    coroutines[0] = CCB::createCoroutine(nullptr);
    CCB::running = coroutines[0];
    coroutines[1];
    coroutines[2];

}