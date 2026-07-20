//
// Created by os on 7/19/26.
//

#include "../h/syscall_c.hpp"

static uint64 syscall(uint64 code, uint64 a1v = 0, uint64 a2v = 0, uint64 a3v = 0, uint64 a4v = 0) {
    uint64 result;
    __asm__ volatile("mv a0, %1\n\t"
                     "mv a1, %2\n\t"
                     "mv a2, %3\n\t"
                     "mv a3, %4\n\t"
                     "mv a4, %5\n\t"
                     "ecall\n\t"
                     "mv %0, a0"
                     : "=r"(result)
                     : "r"(code), "r"(a1v), "r"(a2v), "r"(a3v), "r"(a4v)
                     : "x10", "x11", "x12", "x13", "x14", "memory"
    );
    return result;
}

void *mem_alloc(size_t size) {
    size_t newSize = (size%MEM_BLOCK_SIZE != 0 ? ((size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE : size);
    return (void*) syscall(0x01, newSize);
}

int mem_free(void *ptr) {
    return syscall(0x02, (uint64)ptr);
}
