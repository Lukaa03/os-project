//
// Created by os on 7/19/26.
//

#include "../h/riscv.hpp"

void Riscv::handleSupervisorTrap() {

    uint64 scause = r_scause();
    if (scause == ecallU || scause == ecallS) {
        uint64 volatile sepc = r_sepc();
        uint64 volatile sstatus = r_sstatus();
        uint64 volatile opcode;

        __asm__ volatile ("mv %0 a0" : "=r"(opcode));

        switch (opcode) {
            case 0x01: {

                break;
            }
            case 0x02: {

                break;
            }
            case 0x03: {

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

        w_sepc(sepc + 4);
        w_sstatus(sstatus);
    } else if (scause == timer) {

    } else if (scause == console) {

    } else {

    }

}
