//
// Created by os on 7/22/26.
//

#include "../h/syscall_cpp.hpp"

Thread::Thread(void (*body)(void*), void* arg) : myHandle(nullptr), body(body), arg(arg) {}
Thread::Thread() : myHandle(nullptr), body(nullptr), arg(nullptr) {}
Thread::~Thread() {}

int Thread::start() {
    if (body != nullptr) {
        return thread_create(&myHandle, body, arg);
    }
    return thread_create(&myHandle, &runWrapper, this);
}

void Thread::runWrapper(void* t) {
    ((Thread*) t)->run();
}

void Thread::dispatch() {
    thread_dispatch();
}

Semaphore::Semaphore(unsigned init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    sem_close(myHandle);
}

int Semaphore::wait() {
    return sem_wait(myHandle);
}

int Semaphore::signal() {
    return sem_signal(myHandle);
}
