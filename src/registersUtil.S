.global _ZN5Riscv13pushRegistersEv
.type _ZN5Riscv13pushRegistersEv, @function
_ZN5Riscv13pushRegistersEv:
    addi sp, sp, -256  // stek ide na dole, tako da kad oduzmemo broj, mi alociramo toliko mesta za stack
    // sd x0, 0 * 8(sp) ne moramo da ga cuvamo jer x0 je registar koji je "ozicen" na nulu, tj uvek je nula
    // sd x1, 1 * 8(sp)
    // sd x2, 2 * 8(sp) ova 2 registra smo cuvali u strukturi u CCB pa ih ne cuvamo ovde, oznaceni su sa x1 i x2

    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31  // postavlja range brojeva koji treba da se ponavljaju
    sd x\index, \index * 8(sp) // svaki broj stavi u novu instrukciju, tj generise onoliko instrukcija koliko ima brojeva i koristi brojeve koje smo dali u index i na mestu gde smo ga postavili
    .endr
    ret

.global _ZN5Riscv12popRegistersEv
.type _ZN5Riscv12popRegistersEv, @function
_ZN5Riscv12popRegistersEv:
    // ld x0, 0 * 8(sp) ne moramo da ga restauiramo jer x0 je registar koji je "ozicen" na nulu, tj uvek je nula
    // ld x1, 1 * 8(sp)
    // ld x2, 2 * 8(sp) ova 2 registra smo cuvali u strukturi u CCB pa ih ne restauiramo ovde, oznaceni su sa x1 i x2

    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31  // postavlja range brojeva koji treba da se ponavljaju
    ld x\index, \index * 8(sp) // svaki broj stavi u novu instrukciju, tj generise onoliko instrukcija koliko ima brojeva i koristi brojeve koje smo dali u index i na mestu gde smo ga postavili
    .endr

    addi sp, sp, 256  // oduzimamo tu alokaciju mesta na steku, resetujemo ga na pocetak
    ret