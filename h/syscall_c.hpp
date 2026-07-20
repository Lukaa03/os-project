//
// Created by os on 6/24/26.
//

#ifndef PROJECT_BASE_SYSCALL_C_HPP
#define PROJECT_BASE_SYSCALL_C_HPP
#include "../lib/hw.h"

void* mem_alloc(size_t size);
int mem_free(void* ptr);


#endif //PROJECT_BASE_SYSCALL_C_HPP
