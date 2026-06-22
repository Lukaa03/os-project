//
// Created by os on 6/21/26.
//


#include "../h/MemoryAllocator.h"

extern "C" void stopEmulator() {
    *(volatile uint32*)0x100000 = 0x5555;
}

int main() {
    MemoryAllocator::initialize();

    void* p1 = MemoryAllocator::mem_alloc(100);
    void* p2 = MemoryAllocator::mem_alloc(50);
    void* p3 = MemoryAllocator::mem_alloc(200);

    MemoryAllocator::mem_free(p2);
    MemoryAllocator::mem_free(p1);
    MemoryAllocator::mem_free(p3);

    stopEmulator();
    return 0;
}