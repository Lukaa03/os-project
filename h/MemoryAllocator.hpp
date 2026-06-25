//
// Created by os on 6/20/26.
//

#ifndef PROJECT_BASE_MEMORYALLOCATOR_H
#define PROJECT_BASE_MEMORYALLOCATOR_H
#include "../lib/hw.h"


class MemoryAllocator {
private:

    struct MemoryBlock {
        size_t size;
        MemoryBlock* next;
    };

    static MemoryBlock* head;
    static MemoryBlock* joinBlocks(MemoryBlock* block, MemoryBlock* toJoin);

public:
    static void initialize();
    static void* mem_alloc(size_t size);
    static int mem_free(void*);
};



#endif //PROJECT_BASE_MEMORYALLOCATOR_H
