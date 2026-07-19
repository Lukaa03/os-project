//
// Created by os on 7/19/26.
//

#include "../h/riscv.hpp"
#include "../h/MemoryAllocator.hpp"

void Riscv::handleSupervisorTrap(uint64* regs) {

    uint64 scause = r_scause();
    if (scause == ecallU || scause == ecallS) {
        uint64 code = regs[10]; // a0 = kod

        switch (code) {
            case 0x01: { // mem_alloc
                regs[10] = (uint64) MemoryAllocator::mem_alloc((size_t) regs[11]);
                break;
            }
            case 0x02: { // mem_free
                regs[10] = (uint64) MemoryAllocator::mem_free((void*) regs[11]);
                break;
            }
            case 0x03: {
    // i ovo je isto nebitno
                break;
            }
            case 0x04: {

                break;
            }
            case 0x11: {

                break;
            }
            case 0x12: {

                break;
            }
            case 0x13: {

                break;
            }
            case 0x21: {

                break;
            }
            case 0x22: {

                break;
            }
            case 0x23: {

                break;
            }
            case 0x24: {

                break;
            }
            case 0x31: {

                break;
            }
            case 0x41: {

                break;
            }
            case 0x42: {

                break;
            }
        }

        uint64 volatile sepc = r_sepc();
        w_sepc(sepc + 4);

    } else if (scause == timer) {

    } else if (scause == console) {

    } else {

    }

}
