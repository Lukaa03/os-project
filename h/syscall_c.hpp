//
// Created by os on 6/24/26.
//

#ifndef PROJECT_BASE_SYSCALL_C_HPP
#define PROJECT_BASE_SYSCALL_C_HPP
#include "../lib/hw.h"

class TCB;
typedef TCB* thread_t;

void* mem_alloc(size_t size);
int mem_free(void* ptr);

// thread

int thread_create(thread_t* handle, void (*start_routine)(void*), void* arg);
int thread_exit();
void thread_dispatch();


// nesto drugo

#endif //PROJECT_BASE_SYSCALL_C_HPP
