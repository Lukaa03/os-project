//
// Created by os on 6/20/26.
//

#include "../h/MemoryAllocator.hpp"

MemoryAllocator::MemoryBlock* MemoryAllocator::head = 0;

void MemoryAllocator::initialize() {
    head = (MemoryBlock*) HEAP_START_ADDR;
    head->next = nullptr;
    head->size = ((char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR);
}

void *MemoryAllocator::mem_alloc(::size_t size) {
    size_t numBytes = size + sizeof(MemoryBlock);
    numBytes = (numBytes % MEM_BLOCK_SIZE) ? (numBytes/MEM_BLOCK_SIZE+1)*MEM_BLOCK_SIZE : numBytes;

    MemoryBlock* curr = head;
    MemoryBlock* prev = nullptr;

    while (curr) {
        if (curr->size >= numBytes) {
            break;
        } else {
            prev = curr;
            curr = curr->next;
        }
    }

    if (!curr || curr->size < numBytes) {
        return nullptr;
    }

    if (curr->size-numBytes < MEM_BLOCK_SIZE + sizeof(MemoryBlock)) {
        (prev ? prev->next : head)  = curr->next;
    }else {
        MemoryBlock* newBlock = (MemoryBlock*) ((char*)curr + numBytes);
        newBlock->size = curr->size - numBytes;
        newBlock->next = curr->next;
        (prev ? prev->next : head)  = newBlock;
        curr->size = numBytes;
    }

    curr->next = nullptr;

    return (char*)curr+sizeof(MemoryBlock);
}

int MemoryAllocator::mem_free(void* adr) {
    MemoryBlock* block = (MemoryBlock*) ((char*)adr - sizeof(MemoryBlock));

    MemoryBlock* curr = head;
    MemoryBlock* prev = nullptr;

    while (curr && block > curr) {
        prev = curr;
        curr = curr->next;
    }

    block->next = curr;
    (prev ? prev->next : head) = block;

    if (prev && (char*)prev + prev->size == (char*)block) {
        block = joinBlocks(prev, block);
    }

    if (curr && (char*) block + block->size == (char*)curr) {
        block = joinBlocks(block, curr);
    }

    return 0;

}

MemoryAllocator::MemoryBlock *MemoryAllocator::joinBlocks(MemoryBlock* block, MemoryBlock* toJoin) {
    block->size += toJoin->size;
    block->next = toJoin->next;

    return block;
}