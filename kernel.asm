
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000a117          	auipc	sp,0xa
    80000004:	2b013103          	ld	sp,688(sp) # 8000a2b0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	0b9050ef          	jal	ra,800058d4 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_ZN5Riscv13pushRegistersEv>:
.global _ZN5Riscv13pushRegistersEv
.type _ZN5Riscv13pushRegistersEv, @function
_ZN5Riscv13pushRegistersEv:
    addi sp, sp, -256  // stek ide na dole, tako da kad oduzmemo broj, mi alociramo toliko mesta za stack
    80001000:	f0010113          	addi	sp,sp,-256
    // sd x1, 1 * 8(sp)
    // sd x2, 2 * 8(sp) ova 2 registra smo cuvali u strukturi u CCB pa ih ne cuvamo ovde, oznaceni su sa x1 i x2

    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31  // postavlja range brojeva koji treba da se ponavljaju
    sd x\index, \index * 8(sp) // svaki broj stavi u novu instrukciju, tj generise onoliko instrukcija koliko ima brojeva i koristi brojeve koje smo dali u index i na mestu gde smo ga postavili
    .endr
    80001004:	00313c23          	sd	gp,24(sp)
    80001008:	02413023          	sd	tp,32(sp)
    8000100c:	02513423          	sd	t0,40(sp)
    80001010:	02613823          	sd	t1,48(sp)
    80001014:	02713c23          	sd	t2,56(sp)
    80001018:	04813023          	sd	s0,64(sp)
    8000101c:	04913423          	sd	s1,72(sp)
    80001020:	04a13823          	sd	a0,80(sp)
    80001024:	04b13c23          	sd	a1,88(sp)
    80001028:	06c13023          	sd	a2,96(sp)
    8000102c:	06d13423          	sd	a3,104(sp)
    80001030:	06e13823          	sd	a4,112(sp)
    80001034:	06f13c23          	sd	a5,120(sp)
    80001038:	09013023          	sd	a6,128(sp)
    8000103c:	09113423          	sd	a7,136(sp)
    80001040:	09213823          	sd	s2,144(sp)
    80001044:	09313c23          	sd	s3,152(sp)
    80001048:	0b413023          	sd	s4,160(sp)
    8000104c:	0b513423          	sd	s5,168(sp)
    80001050:	0b613823          	sd	s6,176(sp)
    80001054:	0b713c23          	sd	s7,184(sp)
    80001058:	0d813023          	sd	s8,192(sp)
    8000105c:	0d913423          	sd	s9,200(sp)
    80001060:	0da13823          	sd	s10,208(sp)
    80001064:	0db13c23          	sd	s11,216(sp)
    80001068:	0fc13023          	sd	t3,224(sp)
    8000106c:	0fd13423          	sd	t4,232(sp)
    80001070:	0fe13823          	sd	t5,240(sp)
    80001074:	0ff13c23          	sd	t6,248(sp)
    ret
    80001078:	00008067          	ret

000000008000107c <_ZN5Riscv12popRegistersEv>:
    // ld x1, 1 * 8(sp)
    // ld x2, 2 * 8(sp) ova 2 registra smo cuvali u strukturi u CCB pa ih ne restauiramo ovde, oznaceni su sa x1 i x2

    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31  // postavlja range brojeva koji treba da se ponavljaju
    ld x\index, \index * 8(sp) // svaki broj stavi u novu instrukciju, tj generise onoliko instrukcija koliko ima brojeva i koristi brojeve koje smo dali u index i na mestu gde smo ga postavili
    .endr
    8000107c:	01813183          	ld	gp,24(sp)
    80001080:	02013203          	ld	tp,32(sp)
    80001084:	02813283          	ld	t0,40(sp)
    80001088:	03013303          	ld	t1,48(sp)
    8000108c:	03813383          	ld	t2,56(sp)
    80001090:	04013403          	ld	s0,64(sp)
    80001094:	04813483          	ld	s1,72(sp)
    80001098:	05013503          	ld	a0,80(sp)
    8000109c:	05813583          	ld	a1,88(sp)
    800010a0:	06013603          	ld	a2,96(sp)
    800010a4:	06813683          	ld	a3,104(sp)
    800010a8:	07013703          	ld	a4,112(sp)
    800010ac:	07813783          	ld	a5,120(sp)
    800010b0:	08013803          	ld	a6,128(sp)
    800010b4:	08813883          	ld	a7,136(sp)
    800010b8:	09013903          	ld	s2,144(sp)
    800010bc:	09813983          	ld	s3,152(sp)
    800010c0:	0a013a03          	ld	s4,160(sp)
    800010c4:	0a813a83          	ld	s5,168(sp)
    800010c8:	0b013b03          	ld	s6,176(sp)
    800010cc:	0b813b83          	ld	s7,184(sp)
    800010d0:	0c013c03          	ld	s8,192(sp)
    800010d4:	0c813c83          	ld	s9,200(sp)
    800010d8:	0d013d03          	ld	s10,208(sp)
    800010dc:	0d813d83          	ld	s11,216(sp)
    800010e0:	0e013e03          	ld	t3,224(sp)
    800010e4:	0e813e83          	ld	t4,232(sp)
    800010e8:	0f013f03          	ld	t5,240(sp)
    800010ec:	0f813f83          	ld	t6,248(sp)

    addi sp, sp, 256  // oduzimamo tu alokaciju mesta na steku, resetujemo ga na pocetak
    800010f0:	10010113          	addi	sp,sp,256
    800010f4:	00008067          	ret
	...

0000000080001100 <_ZN5Riscv14supervisorTrapEv>:
.global _ZN5Riscv14supervisorTrapEv
.type _ZN5Riscv14supervisorTrapEv, @function
.align 4

_ZN5Riscv14supervisorTrapEv:
    addi sp, sp, -256
    80001100:	f0010113          	addi	sp,sp,-256

    .irp index,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001104:	00013023          	sd	zero,0(sp)
    80001108:	00113423          	sd	ra,8(sp)
    8000110c:	00213823          	sd	sp,16(sp)
    80001110:	00313c23          	sd	gp,24(sp)
    80001114:	02413023          	sd	tp,32(sp)
    80001118:	02513423          	sd	t0,40(sp)
    8000111c:	02613823          	sd	t1,48(sp)
    80001120:	02713c23          	sd	t2,56(sp)
    80001124:	04813023          	sd	s0,64(sp)
    80001128:	04913423          	sd	s1,72(sp)
    8000112c:	04a13823          	sd	a0,80(sp)
    80001130:	04b13c23          	sd	a1,88(sp)
    80001134:	06c13023          	sd	a2,96(sp)
    80001138:	06d13423          	sd	a3,104(sp)
    8000113c:	06e13823          	sd	a4,112(sp)
    80001140:	06f13c23          	sd	a5,120(sp)
    80001144:	09013023          	sd	a6,128(sp)
    80001148:	09113423          	sd	a7,136(sp)
    8000114c:	09213823          	sd	s2,144(sp)
    80001150:	09313c23          	sd	s3,152(sp)
    80001154:	0b413023          	sd	s4,160(sp)
    80001158:	0b513423          	sd	s5,168(sp)
    8000115c:	0b613823          	sd	s6,176(sp)
    80001160:	0b713c23          	sd	s7,184(sp)
    80001164:	0d813023          	sd	s8,192(sp)
    80001168:	0d913423          	sd	s9,200(sp)
    8000116c:	0da13823          	sd	s10,208(sp)
    80001170:	0db13c23          	sd	s11,216(sp)
    80001174:	0fc13023          	sd	t3,224(sp)
    80001178:	0fd13423          	sd	t4,232(sp)
    8000117c:	0fe13823          	sd	t5,240(sp)
    80001180:	0ff13c23          	sd	t6,248(sp)

    mv a0, sp
    80001184:	00010513          	mv	a0,sp
    call _ZN5Riscv20handleSupervisorTrapEPm
    80001188:	3f9000ef          	jal	ra,80001d80 <_ZN5Riscv20handleSupervisorTrapEPm>

    .irp index,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    8000118c:	00013003          	ld	zero,0(sp)
    80001190:	00813083          	ld	ra,8(sp)
    80001194:	01013103          	ld	sp,16(sp)
    80001198:	01813183          	ld	gp,24(sp)
    8000119c:	02013203          	ld	tp,32(sp)
    800011a0:	02813283          	ld	t0,40(sp)
    800011a4:	03013303          	ld	t1,48(sp)
    800011a8:	03813383          	ld	t2,56(sp)
    800011ac:	04013403          	ld	s0,64(sp)
    800011b0:	04813483          	ld	s1,72(sp)
    800011b4:	05013503          	ld	a0,80(sp)
    800011b8:	05813583          	ld	a1,88(sp)
    800011bc:	06013603          	ld	a2,96(sp)
    800011c0:	06813683          	ld	a3,104(sp)
    800011c4:	07013703          	ld	a4,112(sp)
    800011c8:	07813783          	ld	a5,120(sp)
    800011cc:	08013803          	ld	a6,128(sp)
    800011d0:	08813883          	ld	a7,136(sp)
    800011d4:	09013903          	ld	s2,144(sp)
    800011d8:	09813983          	ld	s3,152(sp)
    800011dc:	0a013a03          	ld	s4,160(sp)
    800011e0:	0a813a83          	ld	s5,168(sp)
    800011e4:	0b013b03          	ld	s6,176(sp)
    800011e8:	0b813b83          	ld	s7,184(sp)
    800011ec:	0c013c03          	ld	s8,192(sp)
    800011f0:	0c813c83          	ld	s9,200(sp)
    800011f4:	0d013d03          	ld	s10,208(sp)
    800011f8:	0d813d83          	ld	s11,216(sp)
    800011fc:	0e013e03          	ld	t3,224(sp)
    80001200:	0e813e83          	ld	t4,232(sp)
    80001204:	0f013f03          	ld	t5,240(sp)
    80001208:	0f813f83          	ld	t6,248(sp)

    addi sp, sp, 256
    8000120c:	10010113          	addi	sp,sp,256
    80001210:	10200073          	sret
	...

0000000080001220 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:
.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
    // a0 - &old->context
    // a1 - &running->context ovako se prosledjuju argumenti vrv kroz a0 i a1 jer su pokazivaci, imaju po 8 bajtova
    sd ra, 0 * 8(a0)
    80001220:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    80001224:	00253423          	sd	sp,8(a0)

    ld ra, 0 * 8(a1)
    80001228:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    8000122c:	0085b103          	ld	sp,8(a1)

    80001230:	00008067          	ret

0000000080001234 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    80001234:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001238:	00b29a63          	bne	t0,a1,8000124c <fail>
    sc.w t0, a2, (a0)      # Try to update.
    8000123c:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001240:	fe029ae3          	bnez	t0,80001234 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001244:	00000513          	li	a0,0
    jr ra                  # Return.
    80001248:	00008067          	ret

000000008000124c <fail>:
    fail:
    li a0, 1               # Set return to failure.
    8000124c:	00100513          	li	a0,1
    80001250:	00008067          	ret

0000000080001254 <_ZL7syscallmmmmm>:
#include "../h/syscall_c.hpp"

#include "../h/MemoryAllocator.hpp"
#include "../h/tcb.hpp"

static uint64 syscall(uint64 code, uint64 a1v = 0, uint64 a2v = 0, uint64 a3v = 0, uint64 a4v = 0) {
    80001254:	ff010113          	addi	sp,sp,-16
    80001258:	00813423          	sd	s0,8(sp)
    8000125c:	01010413          	addi	s0,sp,16
    80001260:	00050793          	mv	a5,a0
    80001264:	00058813          	mv	a6,a1
    80001268:	00060893          	mv	a7,a2
    8000126c:	00068313          	mv	t1,a3
    80001270:	00070e13          	mv	t3,a4
                     "ecall\n\t"
                     "mv %0, a0"
                     : "=r"(result)
                     : "r"(code), "r"(a1v), "r"(a2v), "r"(a3v), "r"(a4v)
                     : "x10", "x11", "x12", "x13", "x14", "memory"
    );
    80001274:	00078513          	mv	a0,a5
    80001278:	00080593          	mv	a1,a6
    8000127c:	00088613          	mv	a2,a7
    80001280:	00030693          	mv	a3,t1
    80001284:	000e0713          	mv	a4,t3
    80001288:	00000073          	ecall
    8000128c:	00050793          	mv	a5,a0
    return result;
}
    80001290:	00078513          	mv	a0,a5
    80001294:	00813403          	ld	s0,8(sp)
    80001298:	01010113          	addi	sp,sp,16
    8000129c:	00008067          	ret

00000000800012a0 <_Z9mem_allocm>:

void *mem_alloc(size_t size) {
    800012a0:	ff010113          	addi	sp,sp,-16
    800012a4:	00113423          	sd	ra,8(sp)
    800012a8:	00813023          	sd	s0,0(sp)
    800012ac:	01010413          	addi	s0,sp,16
    800012b0:	00050593          	mv	a1,a0
    size_t newSize = (size%MEM_BLOCK_SIZE != 0 ? ((size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE : size);
    800012b4:	03f57793          	andi	a5,a0,63
    800012b8:	00078663          	beqz	a5,800012c4 <_Z9mem_allocm+0x24>
    800012bc:	03f50593          	addi	a1,a0,63
    800012c0:	fc05f593          	andi	a1,a1,-64
    return (void*) syscall(0x01, newSize);
    800012c4:	00000713          	li	a4,0
    800012c8:	00000693          	li	a3,0
    800012cc:	00000613          	li	a2,0
    800012d0:	00100513          	li	a0,1
    800012d4:	00000097          	auipc	ra,0x0
    800012d8:	f80080e7          	jalr	-128(ra) # 80001254 <_ZL7syscallmmmmm>
}
    800012dc:	00813083          	ld	ra,8(sp)
    800012e0:	00013403          	ld	s0,0(sp)
    800012e4:	01010113          	addi	sp,sp,16
    800012e8:	00008067          	ret

00000000800012ec <_Z8mem_freePv>:

int mem_free(void *ptr) {
    800012ec:	ff010113          	addi	sp,sp,-16
    800012f0:	00113423          	sd	ra,8(sp)
    800012f4:	00813023          	sd	s0,0(sp)
    800012f8:	01010413          	addi	s0,sp,16
    800012fc:	00050593          	mv	a1,a0
    return syscall(0x02, (uint64)ptr);
    80001300:	00000713          	li	a4,0
    80001304:	00000693          	li	a3,0
    80001308:	00000613          	li	a2,0
    8000130c:	00200513          	li	a0,2
    80001310:	00000097          	auipc	ra,0x0
    80001314:	f44080e7          	jalr	-188(ra) # 80001254 <_ZL7syscallmmmmm>
}
    80001318:	0005051b          	sext.w	a0,a0
    8000131c:	00813083          	ld	ra,8(sp)
    80001320:	00013403          	ld	s0,0(sp)
    80001324:	01010113          	addi	sp,sp,16
    80001328:	00008067          	ret

000000008000132c <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(thread_t *handle, void (*start_routine)(void *), void *arg) {
    8000132c:	fd010113          	addi	sp,sp,-48
    80001330:	02113423          	sd	ra,40(sp)
    80001334:	02813023          	sd	s0,32(sp)
    80001338:	00913c23          	sd	s1,24(sp)
    8000133c:	01213823          	sd	s2,16(sp)
    80001340:	01313423          	sd	s3,8(sp)
    80001344:	03010413          	addi	s0,sp,48
    80001348:	00050493          	mv	s1,a0
    8000134c:	00058913          	mv	s2,a1
    80001350:	00060993          	mv	s3,a2
    uint8* stack = (uint8*) MemoryAllocator::mem_alloc(DEFAULT_STACK_SIZE);
    80001354:	00001537          	lui	a0,0x1
    80001358:	00001097          	auipc	ra,0x1
    8000135c:	d18080e7          	jalr	-744(ra) # 80002070 <_ZN15MemoryAllocator9mem_allocEm>
    if (stack == nullptr) return -1;
    80001360:	04050263          	beqz	a0,800013a4 <_Z13thread_createPP3TCBPFvPvES2_+0x78>
    uint64 top = (uint64) (stack + DEFAULT_STACK_SIZE);
    return (int) syscall(0x11, (uint64) handle, (uint64) start_routine, (uint64) arg, top);
    80001364:	00001737          	lui	a4,0x1
    80001368:	00e50733          	add	a4,a0,a4
    8000136c:	00098693          	mv	a3,s3
    80001370:	00090613          	mv	a2,s2
    80001374:	00048593          	mv	a1,s1
    80001378:	01100513          	li	a0,17
    8000137c:	00000097          	auipc	ra,0x0
    80001380:	ed8080e7          	jalr	-296(ra) # 80001254 <_ZL7syscallmmmmm>
    80001384:	0005051b          	sext.w	a0,a0
}
    80001388:	02813083          	ld	ra,40(sp)
    8000138c:	02013403          	ld	s0,32(sp)
    80001390:	01813483          	ld	s1,24(sp)
    80001394:	01013903          	ld	s2,16(sp)
    80001398:	00813983          	ld	s3,8(sp)
    8000139c:	03010113          	addi	sp,sp,48
    800013a0:	00008067          	ret
    if (stack == nullptr) return -1;
    800013a4:	fff00513          	li	a0,-1
    800013a8:	fe1ff06f          	j	80001388 <_Z13thread_createPP3TCBPFvPvES2_+0x5c>

00000000800013ac <_Z11thread_exitv>:

int thread_exit() {
    800013ac:	ff010113          	addi	sp,sp,-16
    800013b0:	00113423          	sd	ra,8(sp)
    800013b4:	00813023          	sd	s0,0(sp)
    800013b8:	01010413          	addi	s0,sp,16
    return (int) syscall(0x12);
    800013bc:	00000713          	li	a4,0
    800013c0:	00000693          	li	a3,0
    800013c4:	00000613          	li	a2,0
    800013c8:	00000593          	li	a1,0
    800013cc:	01200513          	li	a0,18
    800013d0:	00000097          	auipc	ra,0x0
    800013d4:	e84080e7          	jalr	-380(ra) # 80001254 <_ZL7syscallmmmmm>
}
    800013d8:	0005051b          	sext.w	a0,a0
    800013dc:	00813083          	ld	ra,8(sp)
    800013e0:	00013403          	ld	s0,0(sp)
    800013e4:	01010113          	addi	sp,sp,16
    800013e8:	00008067          	ret

00000000800013ec <_Z15thread_dispatchv>:

void thread_dispatch() {
    800013ec:	ff010113          	addi	sp,sp,-16
    800013f0:	00113423          	sd	ra,8(sp)
    800013f4:	00813023          	sd	s0,0(sp)
    800013f8:	01010413          	addi	s0,sp,16
    syscall(0x13);
    800013fc:	00000713          	li	a4,0
    80001400:	00000693          	li	a3,0
    80001404:	00000613          	li	a2,0
    80001408:	00000593          	li	a1,0
    8000140c:	01300513          	li	a0,19
    80001410:	00000097          	auipc	ra,0x0
    80001414:	e44080e7          	jalr	-444(ra) # 80001254 <_ZL7syscallmmmmm>
}
    80001418:	00813083          	ld	ra,8(sp)
    8000141c:	00013403          	ld	s0,0(sp)
    80001420:	01010113          	addi	sp,sp,16
    80001424:	00008067          	ret

0000000080001428 <_Z8sem_openPP10KSemaphorej>:

int sem_open(sem_t *handle, unsigned init) {
    80001428:	ff010113          	addi	sp,sp,-16
    8000142c:	00113423          	sd	ra,8(sp)
    80001430:	00813023          	sd	s0,0(sp)
    80001434:	01010413          	addi	s0,sp,16
    return (int) syscall(0x21, (uint64) handle, (uint64) init);
    80001438:	00000713          	li	a4,0
    8000143c:	00000693          	li	a3,0
    80001440:	02059613          	slli	a2,a1,0x20
    80001444:	02065613          	srli	a2,a2,0x20
    80001448:	00050593          	mv	a1,a0
    8000144c:	02100513          	li	a0,33
    80001450:	00000097          	auipc	ra,0x0
    80001454:	e04080e7          	jalr	-508(ra) # 80001254 <_ZL7syscallmmmmm>
}
    80001458:	0005051b          	sext.w	a0,a0
    8000145c:	00813083          	ld	ra,8(sp)
    80001460:	00013403          	ld	s0,0(sp)
    80001464:	01010113          	addi	sp,sp,16
    80001468:	00008067          	ret

000000008000146c <_Z9sem_closeP10KSemaphore>:

int sem_close(sem_t handle) {
    8000146c:	ff010113          	addi	sp,sp,-16
    80001470:	00113423          	sd	ra,8(sp)
    80001474:	00813023          	sd	s0,0(sp)
    80001478:	01010413          	addi	s0,sp,16
    8000147c:	00050593          	mv	a1,a0
    return (int) syscall(0x22, (uint64) handle);
    80001480:	00000713          	li	a4,0
    80001484:	00000693          	li	a3,0
    80001488:	00000613          	li	a2,0
    8000148c:	02200513          	li	a0,34
    80001490:	00000097          	auipc	ra,0x0
    80001494:	dc4080e7          	jalr	-572(ra) # 80001254 <_ZL7syscallmmmmm>
}
    80001498:	0005051b          	sext.w	a0,a0
    8000149c:	00813083          	ld	ra,8(sp)
    800014a0:	00013403          	ld	s0,0(sp)
    800014a4:	01010113          	addi	sp,sp,16
    800014a8:	00008067          	ret

00000000800014ac <_Z8sem_waitP10KSemaphore>:

int sem_wait(sem_t id) {
    800014ac:	ff010113          	addi	sp,sp,-16
    800014b0:	00113423          	sd	ra,8(sp)
    800014b4:	00813023          	sd	s0,0(sp)
    800014b8:	01010413          	addi	s0,sp,16
    800014bc:	00050593          	mv	a1,a0
    return (int) syscall(0x23, (uint64) id);
    800014c0:	00000713          	li	a4,0
    800014c4:	00000693          	li	a3,0
    800014c8:	00000613          	li	a2,0
    800014cc:	02300513          	li	a0,35
    800014d0:	00000097          	auipc	ra,0x0
    800014d4:	d84080e7          	jalr	-636(ra) # 80001254 <_ZL7syscallmmmmm>
}
    800014d8:	0005051b          	sext.w	a0,a0
    800014dc:	00813083          	ld	ra,8(sp)
    800014e0:	00013403          	ld	s0,0(sp)
    800014e4:	01010113          	addi	sp,sp,16
    800014e8:	00008067          	ret

00000000800014ec <_Z10sem_signalP10KSemaphore>:

int sem_signal(sem_t id) {
    800014ec:	ff010113          	addi	sp,sp,-16
    800014f0:	00113423          	sd	ra,8(sp)
    800014f4:	00813023          	sd	s0,0(sp)
    800014f8:	01010413          	addi	s0,sp,16
    800014fc:	00050593          	mv	a1,a0
    return (int) syscall(0x24, (uint64) id);
    80001500:	00000713          	li	a4,0
    80001504:	00000693          	li	a3,0
    80001508:	00000613          	li	a2,0
    8000150c:	02400513          	li	a0,36
    80001510:	00000097          	auipc	ra,0x0
    80001514:	d44080e7          	jalr	-700(ra) # 80001254 <_ZL7syscallmmmmm>
}
    80001518:	0005051b          	sext.w	a0,a0
    8000151c:	00813083          	ld	ra,8(sp)
    80001520:	00013403          	ld	s0,0(sp)
    80001524:	01010113          	addi	sp,sp,16
    80001528:	00008067          	ret

000000008000152c <_Z10time_sleepm>:

int time_sleep(time_t t) {
    8000152c:	ff010113          	addi	sp,sp,-16
    80001530:	00813423          	sd	s0,8(sp)
    80001534:	01010413          	addi	s0,sp,16
    return 0;
    80001538:	00000513          	li	a0,0
    8000153c:	00813403          	ld	s0,8(sp)
    80001540:	01010113          	addi	sp,sp,16
    80001544:	00008067          	ret

0000000080001548 <_ZN10KSemaphore15createSemaphoreEj>:
//

#include "../h/semaphore.hpp"
#include "../h/scheduler.hpp"

KSemaphore* KSemaphore::createSemaphore(unsigned init) {
    80001548:	fe010113          	addi	sp,sp,-32
    8000154c:	00113c23          	sd	ra,24(sp)
    80001550:	00813823          	sd	s0,16(sp)
    80001554:	00913423          	sd	s1,8(sp)
    80001558:	02010413          	addi	s0,sp,32
    8000155c:	00050493          	mv	s1,a0
    return new KSemaphore(init);
    80001560:	01800513          	li	a0,24
    80001564:	00000097          	auipc	ra,0x0
    80001568:	4f8080e7          	jalr	1272(ra) # 80001a5c <_Znwm>
    static KSemaphore* createSemaphore(unsigned init);
    int wait();
    int signal();
    int close();
private:
    KSemaphore(unsigned init) : value(init) {}
    8000156c:	00952023          	sw	s1,0(a0) # 1000 <_entry-0x7ffff000>
    };

    Elem *head, *tail;

public:
    List() : head(0), tail(0) {}
    80001570:	00053423          	sd	zero,8(a0)
    80001574:	00053823          	sd	zero,16(a0)
}
    80001578:	01813083          	ld	ra,24(sp)
    8000157c:	01013403          	ld	s0,16(sp)
    80001580:	00813483          	ld	s1,8(sp)
    80001584:	02010113          	addi	sp,sp,32
    80001588:	00008067          	ret

000000008000158c <_ZN10KSemaphore4waitEv>:

int KSemaphore::wait() {
    8000158c:	fe010113          	addi	sp,sp,-32
    80001590:	00113c23          	sd	ra,24(sp)
    80001594:	00813823          	sd	s0,16(sp)
    80001598:	00913423          	sd	s1,8(sp)
    8000159c:	01213023          	sd	s2,0(sp)
    800015a0:	02010413          	addi	s0,sp,32
    800015a4:	00050493          	mv	s1,a0
    value--;
    800015a8:	00052783          	lw	a5,0(a0)
    800015ac:	fff7879b          	addiw	a5,a5,-1
    800015b0:	00f52023          	sw	a5,0(a0)
    if (value < 0) {
    800015b4:	02079713          	slli	a4,a5,0x20
    800015b8:	02074063          	bltz	a4,800015d8 <_ZN10KSemaphore4waitEv+0x4c>
        TCB::running->setBlocked(true);
        blockedQueue.addLast(TCB::running);
        TCB::dispatch();
    }
    return value;
}
    800015bc:	0004a503          	lw	a0,0(s1)
    800015c0:	01813083          	ld	ra,24(sp)
    800015c4:	01013403          	ld	s0,16(sp)
    800015c8:	00813483          	ld	s1,8(sp)
    800015cc:	00013903          	ld	s2,0(sp)
    800015d0:	02010113          	addi	sp,sp,32
    800015d4:	00008067          	ret
        TCB::running->setBlocked(true);
    800015d8:	00009797          	auipc	a5,0x9
    800015dc:	ce07b783          	ld	a5,-800(a5) # 8000a2b8 <_GLOBAL_OFFSET_TABLE_+0x20>
    800015e0:	0007b903          	ld	s2,0(a5)
    static TCB* running;



    void setFinished(bool finished) { TCB::finished = finished; }
    void setBlocked(bool blocked) { TCB::blocked = blocked; }
    800015e4:	00100793          	li	a5,1
    800015e8:	02f904a3          	sb	a5,41(s2)
        head = elem;
        if (!tail) { tail = head; }
    }

    void addLast(T *data) {
        Elem *elem = new Elem(data, 0);
    800015ec:	01000513          	li	a0,16
    800015f0:	00000097          	auipc	ra,0x0
    800015f4:	46c080e7          	jalr	1132(ra) # 80001a5c <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    800015f8:	01253023          	sd	s2,0(a0)
    800015fc:	00053423          	sd	zero,8(a0)
        if (tail) {
    80001600:	0104b783          	ld	a5,16(s1)
    80001604:	00078c63          	beqz	a5,8000161c <_ZN10KSemaphore4waitEv+0x90>
            tail->next = elem;
    80001608:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    8000160c:	00a4b823          	sd	a0,16(s1)
        TCB::dispatch();
    80001610:	00000097          	auipc	ra,0x0
    80001614:	358080e7          	jalr	856(ra) # 80001968 <_ZN3TCB8dispatchEv>
    80001618:	fa5ff06f          	j	800015bc <_ZN10KSemaphore4waitEv+0x30>
        } else {
            head = tail = elem;
    8000161c:	00a4b823          	sd	a0,16(s1)
    80001620:	00a4b423          	sd	a0,8(s1)
    80001624:	fedff06f          	j	80001610 <_ZN10KSemaphore4waitEv+0x84>

0000000080001628 <_ZN10KSemaphore6signalEv>:

int KSemaphore::signal() {
    value++;
    80001628:	00052703          	lw	a4,0(a0)
    8000162c:	0017071b          	addiw	a4,a4,1
    80001630:	0007069b          	sext.w	a3,a4
    80001634:	00e52023          	sw	a4,0(a0)
    if (value <= 0) {
    80001638:	00d05663          	blez	a3,80001644 <_ZN10KSemaphore6signalEv+0x1c>
            t->setBlocked(false);
            Scheduler::put(t);
        }
    }
    return 0;
}
    8000163c:	00000513          	li	a0,0
    80001640:	00008067          	ret
    80001644:	00050793          	mv	a5,a0
        }
    }

    T *removeFirst() {
        if (!head) { return 0; }
    80001648:	00853503          	ld	a0,8(a0)
    8000164c:	fe0508e3          	beqz	a0,8000163c <_ZN10KSemaphore6signalEv+0x14>
int KSemaphore::signal() {
    80001650:	fe010113          	addi	sp,sp,-32
    80001654:	00113c23          	sd	ra,24(sp)
    80001658:	00813823          	sd	s0,16(sp)
    8000165c:	00913423          	sd	s1,8(sp)
    80001660:	02010413          	addi	s0,sp,32

        Elem *elem = head;
        head = head->next;
    80001664:	00853703          	ld	a4,8(a0)
    80001668:	00e7b423          	sd	a4,8(a5)
        if (!head) { tail = 0; }
    8000166c:	02070e63          	beqz	a4,800016a8 <_ZN10KSemaphore6signalEv+0x80>

        T *ret = elem->data;
    80001670:	00053483          	ld	s1,0(a0)
        delete elem;
    80001674:	00000097          	auipc	ra,0x0
    80001678:	438080e7          	jalr	1080(ra) # 80001aac <_ZdlPv>
        if (t) {
    8000167c:	00048a63          	beqz	s1,80001690 <_ZN10KSemaphore6signalEv+0x68>
    80001680:	020484a3          	sb	zero,41(s1)
            Scheduler::put(t);
    80001684:	00048513          	mv	a0,s1
    80001688:	00001097          	auipc	ra,0x1
    8000168c:	904080e7          	jalr	-1788(ra) # 80001f8c <_ZN9Scheduler3putEP3TCB>
}
    80001690:	00000513          	li	a0,0
    80001694:	01813083          	ld	ra,24(sp)
    80001698:	01013403          	ld	s0,16(sp)
    8000169c:	00813483          	ld	s1,8(sp)
    800016a0:	02010113          	addi	sp,sp,32
    800016a4:	00008067          	ret
        if (!head) { tail = 0; }
    800016a8:	0007b823          	sd	zero,16(a5)
    800016ac:	fc5ff06f          	j	80001670 <_ZN10KSemaphore6signalEv+0x48>

00000000800016b0 <_ZN10KSemaphore5closeEv>:

int KSemaphore::close() {
    800016b0:	fe010113          	addi	sp,sp,-32
    800016b4:	00113c23          	sd	ra,24(sp)
    800016b8:	00813823          	sd	s0,16(sp)
    800016bc:	00913423          	sd	s1,8(sp)
    800016c0:	01213023          	sd	s2,0(sp)
    800016c4:	02010413          	addi	s0,sp,32
    800016c8:	00050913          	mv	s2,a0
    800016cc:	0280006f          	j	800016f4 <_ZN10KSemaphore5closeEv+0x44>
    800016d0:	00093823          	sd	zero,16(s2)
        T *ret = elem->data;
    800016d4:	00053483          	ld	s1,0(a0)
        delete elem;
    800016d8:	00000097          	auipc	ra,0x0
    800016dc:	3d4080e7          	jalr	980(ra) # 80001aac <_ZdlPv>
    while (TCB* t = blockedQueue.removeFirst()) {
    800016e0:	02048663          	beqz	s1,8000170c <_ZN10KSemaphore5closeEv+0x5c>
    800016e4:	020484a3          	sb	zero,41(s1)
        t->setBlocked(false);
        Scheduler::put(t);
    800016e8:	00048513          	mv	a0,s1
    800016ec:	00001097          	auipc	ra,0x1
    800016f0:	8a0080e7          	jalr	-1888(ra) # 80001f8c <_ZN9Scheduler3putEP3TCB>
        if (!head) { return 0; }
    800016f4:	00893503          	ld	a0,8(s2)
    800016f8:	00050a63          	beqz	a0,8000170c <_ZN10KSemaphore5closeEv+0x5c>
        head = head->next;
    800016fc:	00853783          	ld	a5,8(a0)
    80001700:	00f93423          	sd	a5,8(s2)
        if (!head) { tail = 0; }
    80001704:	fc0798e3          	bnez	a5,800016d4 <_ZN10KSemaphore5closeEv+0x24>
    80001708:	fc9ff06f          	j	800016d0 <_ZN10KSemaphore5closeEv+0x20>
    }
    return 0;
}
    8000170c:	00000513          	li	a0,0
    80001710:	01813083          	ld	ra,24(sp)
    80001714:	01013403          	ld	s0,16(sp)
    80001718:	00813483          	ld	s1,8(sp)
    8000171c:	00013903          	ld	s2,0(sp)
    80001720:	02010113          	addi	sp,sp,32
    80001724:	00008067          	ret

0000000080001728 <_Z11userWrapperPv>:
//         gotovo->signal();
//     }
// };
extern void userMain();

void userWrapper(void* arg) {
    80001728:	ff010113          	addi	sp,sp,-16
    8000172c:	00113423          	sd	ra,8(sp)
    80001730:	00813023          	sd	s0,0(sp)
    80001734:	01010413          	addi	s0,sp,16
    printString("User main starting...\n");
    80001738:	00007517          	auipc	a0,0x7
    8000173c:	8e850513          	addi	a0,a0,-1816 # 80008020 <CONSOLE_STATUS+0x10>
    80001740:	00003097          	auipc	ra,0x3
    80001744:	f50080e7          	jalr	-176(ra) # 80004690 <_Z11printStringPKc>
    userMain();
    80001748:	00003097          	auipc	ra,0x3
    8000174c:	610080e7          	jalr	1552(ra) # 80004d58 <_Z8userMainv>
    printString("User main finished.\n");
    80001750:	00007517          	auipc	a0,0x7
    80001754:	8e850513          	addi	a0,a0,-1816 # 80008038 <CONSOLE_STATUS+0x28>
    80001758:	00003097          	auipc	ra,0x3
    8000175c:	f38080e7          	jalr	-200(ra) # 80004690 <_Z11printStringPKc>
}
    80001760:	00813083          	ld	ra,8(sp)
    80001764:	00013403          	ld	s0,0(sp)
    80001768:	01010113          	addi	sp,sp,16
    8000176c:	00008067          	ret

0000000080001770 <main>:

int main() {
    80001770:	fe010113          	addi	sp,sp,-32
    80001774:	00113c23          	sd	ra,24(sp)
    80001778:	00813823          	sd	s0,16(sp)
    8000177c:	02010413          	addi	s0,sp,32
    Riscv::w_stvec(reinterpret_cast<uint64>(&Riscv::supervisorTrap));
    80001780:	00009797          	auipc	a5,0x9
    80001784:	b287b783          	ld	a5,-1240(a5) # 8000a2a8 <_GLOBAL_OFFSET_TABLE_+0x10>
    __asm__ volatile ("csrr %[stvec], stvec" : [stvec] "=r"(stvec));
    return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    __asm__ volatile ("csrw stvec, %[stvec]" :: [stvec] "r"(stvec));
    80001788:	10579073          	csrw	stvec,a5
    MemoryAllocator::initialize();
    8000178c:	00001097          	auipc	ra,0x1
    80001790:	8a0080e7          	jalr	-1888(ra) # 8000202c <_ZN15MemoryAllocator10initializeEv>
    TCB::initialize();
    80001794:	00000097          	auipc	ra,0x0
    80001798:	188080e7          	jalr	392(ra) # 8000191c <_ZN3TCB10initializeEv>
    TCB* main;
    thread_create(&main,nullptr,nullptr);
    8000179c:	00000613          	li	a2,0
    800017a0:	00000593          	li	a1,0
    800017a4:	fe840513          	addi	a0,s0,-24
    800017a8:	00000097          	auipc	ra,0x0
    800017ac:	b84080e7          	jalr	-1148(ra) # 8000132c <_Z13thread_createPP3TCBPFvPvES2_>

    TCB::running = main;
    800017b0:	00009797          	auipc	a5,0x9
    800017b4:	b087b783          	ld	a5,-1272(a5) # 8000a2b8 <_GLOBAL_OFFSET_TABLE_+0x20>
    800017b8:	fe843703          	ld	a4,-24(s0)
    800017bc:	00e7b023          	sd	a4,0(a5)
    TCB* t1;
    thread_create(&t1,&userWrapper,nullptr);
    800017c0:	00000613          	li	a2,0
    800017c4:	00000597          	auipc	a1,0x0
    800017c8:	f6458593          	addi	a1,a1,-156 # 80001728 <_Z11userWrapperPv>
    800017cc:	fe040513          	addi	a0,s0,-32
    800017d0:	00000097          	auipc	ra,0x0
    800017d4:	b5c080e7          	jalr	-1188(ra) # 8000132c <_Z13thread_createPP3TCBPFvPvES2_>

    printString("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n");
    800017d8:	00007517          	auipc	a0,0x7
    800017dc:	87850513          	addi	a0,a0,-1928 # 80008050 <CONSOLE_STATUS+0x40>
    800017e0:	00003097          	auipc	ra,0x3
    800017e4:	eb0080e7          	jalr	-336(ra) # 80004690 <_Z11printStringPKc>


    while (!t1->isFinished()) {
    800017e8:	fe043783          	ld	a5,-32(s0)
    bool isFinished() const { return finished; }
    800017ec:	0287c783          	lbu	a5,40(a5)
    800017f0:	00079863          	bnez	a5,80001800 <main+0x90>
        thread_dispatch();
    800017f4:	00000097          	auipc	ra,0x0
    800017f8:	bf8080e7          	jalr	-1032(ra) # 800013ec <_Z15thread_dispatchv>
    800017fc:	fedff06f          	j	800017e8 <main+0x78>
    }
    printString("System shutdown initiated.\n");
    80001800:	00007517          	auipc	a0,0x7
    80001804:	8c050513          	addi	a0,a0,-1856 # 800080c0 <CONSOLE_STATUS+0xb0>
    80001808:	00003097          	auipc	ra,0x3
    8000180c:	e88080e7          	jalr	-376(ra) # 80004690 <_Z11printStringPKc>


    __asm__ volatile ("li a0, 0x5555");
    80001810:	00005537          	lui	a0,0x5
    80001814:	5555051b          	addiw	a0,a0,1365
    __asm__ volatile ("li a1, 0x100000");
    80001818:	001005b7          	lui	a1,0x100
    __asm__ volatile ("sw a0, 0(a1)");
    8000181c:	00a5a023          	sw	a0,0(a1) # 100000 <_entry-0x7ff00000>
    return 0;
    80001820:	00000513          	li	a0,0
    80001824:	01813083          	ld	ra,24(sp)
    80001828:	01013403          	ld	s0,16(sp)
    8000182c:	02010113          	addi	sp,sp,32
    80001830:	00008067          	ret

0000000080001834 <_ZN3TCBC1EPFvPvES0_Pm>:
    : body(body),
    arg(arg),
    stack(stackSpace),
    context({ (uint64) &threadWrapper, (uint64) stackSpace }),
    finished(false),
    blocked(false){
    80001834:	00b53023          	sd	a1,0(a0) # 5000 <_entry-0x7fffb000>
    80001838:	00c53423          	sd	a2,8(a0)
    8000183c:	00d53823          	sd	a3,16(a0)
    80001840:	00000797          	auipc	a5,0x0
    80001844:	1e078793          	addi	a5,a5,480 # 80001a20 <_ZN3TCB13threadWrapperEv>
    80001848:	00f53c23          	sd	a5,24(a0)
    8000184c:	02d53023          	sd	a3,32(a0)
    80001850:	02050423          	sb	zero,40(a0)
    80001854:	020504a3          	sb	zero,41(a0)

    if (body != nullptr) { Scheduler::put(this); }
    80001858:	02058663          	beqz	a1,80001884 <_ZN3TCBC1EPFvPvES0_Pm+0x50>
TCB::TCB(Body body, void *arg, uint64 *stackSpace)
    8000185c:	ff010113          	addi	sp,sp,-16
    80001860:	00113423          	sd	ra,8(sp)
    80001864:	00813023          	sd	s0,0(sp)
    80001868:	01010413          	addi	s0,sp,16
    if (body != nullptr) { Scheduler::put(this); }
    8000186c:	00000097          	auipc	ra,0x0
    80001870:	720080e7          	jalr	1824(ra) # 80001f8c <_ZN9Scheduler3putEP3TCB>

}
    80001874:	00813083          	ld	ra,8(sp)
    80001878:	00013403          	ld	s0,0(sp)
    8000187c:	01010113          	addi	sp,sp,16
    80001880:	00008067          	ret
    80001884:	00008067          	ret

0000000080001888 <_ZN3TCB12createThreadEPFvPvES0_Pm>:

TCB* TCB::createThread(Body body, void *arg, uint64 *stackSpace) {
    80001888:	fd010113          	addi	sp,sp,-48
    8000188c:	02113423          	sd	ra,40(sp)
    80001890:	02813023          	sd	s0,32(sp)
    80001894:	00913c23          	sd	s1,24(sp)
    80001898:	01213823          	sd	s2,16(sp)
    8000189c:	01313423          	sd	s3,8(sp)
    800018a0:	01413023          	sd	s4,0(sp)
    800018a4:	03010413          	addi	s0,sp,48
    800018a8:	00050913          	mv	s2,a0
    800018ac:	00058993          	mv	s3,a1
    800018b0:	00060a13          	mv	s4,a2
    return new TCB(body, arg, stackSpace);
    800018b4:	03000513          	li	a0,48
    800018b8:	00000097          	auipc	ra,0x0
    800018bc:	1a4080e7          	jalr	420(ra) # 80001a5c <_Znwm>
    800018c0:	00050493          	mv	s1,a0
    800018c4:	000a0693          	mv	a3,s4
    800018c8:	00098613          	mv	a2,s3
    800018cc:	00090593          	mv	a1,s2
    800018d0:	00000097          	auipc	ra,0x0
    800018d4:	f64080e7          	jalr	-156(ra) # 80001834 <_ZN3TCBC1EPFvPvES0_Pm>
    800018d8:	0200006f          	j	800018f8 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x70>
    800018dc:	00050913          	mv	s2,a0
    800018e0:	00048513          	mv	a0,s1
    800018e4:	00000097          	auipc	ra,0x0
    800018e8:	1c8080e7          	jalr	456(ra) # 80001aac <_ZdlPv>
    800018ec:	00090513          	mv	a0,s2
    800018f0:	0000a097          	auipc	ra,0xa
    800018f4:	b58080e7          	jalr	-1192(ra) # 8000b448 <_Unwind_Resume>
}
    800018f8:	00048513          	mv	a0,s1
    800018fc:	02813083          	ld	ra,40(sp)
    80001900:	02013403          	ld	s0,32(sp)
    80001904:	01813483          	ld	s1,24(sp)
    80001908:	01013903          	ld	s2,16(sp)
    8000190c:	00813983          	ld	s3,8(sp)
    80001910:	00013a03          	ld	s4,0(sp)
    80001914:	03010113          	addi	sp,sp,48
    80001918:	00008067          	ret

000000008000191c <_ZN3TCB10initializeEv>:
    if (running == nullptr) {
    8000191c:	00009797          	auipc	a5,0x9
    80001920:	9f47b783          	ld	a5,-1548(a5) # 8000a310 <_ZN3TCB7runningE>
    80001924:	00078463          	beqz	a5,8000192c <_ZN3TCB10initializeEv+0x10>
    80001928:	00008067          	ret
void TCB::initialize() {
    8000192c:	ff010113          	addi	sp,sp,-16
    80001930:	00113423          	sd	ra,8(sp)
    80001934:	00813023          	sd	s0,0(sp)
    80001938:	01010413          	addi	s0,sp,16
        running = createThread(nullptr, nullptr,nullptr);
    8000193c:	00000613          	li	a2,0
    80001940:	00000593          	li	a1,0
    80001944:	00000513          	li	a0,0
    80001948:	00000097          	auipc	ra,0x0
    8000194c:	f40080e7          	jalr	-192(ra) # 80001888 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001950:	00009797          	auipc	a5,0x9
    80001954:	9ca7b023          	sd	a0,-1600(a5) # 8000a310 <_ZN3TCB7runningE>
}
    80001958:	00813083          	ld	ra,8(sp)
    8000195c:	00013403          	ld	s0,0(sp)
    80001960:	01010113          	addi	sp,sp,16
    80001964:	00008067          	ret

0000000080001968 <_ZN3TCB8dispatchEv>:

void TCB::dispatch() {
    80001968:	fe010113          	addi	sp,sp,-32
    8000196c:	00113c23          	sd	ra,24(sp)
    80001970:	00813823          	sd	s0,16(sp)
    80001974:	00913423          	sd	s1,8(sp)
    80001978:	02010413          	addi	s0,sp,32
    Riscv::pushRegisters();
    8000197c:	fffff097          	auipc	ra,0xfffff
    80001980:	684080e7          	jalr	1668(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
    TCB *old = running;
    80001984:	00009497          	auipc	s1,0x9
    80001988:	98c4b483          	ld	s1,-1652(s1) # 8000a310 <_ZN3TCB7runningE>
    if (!old->finished && !old->blocked) { Scheduler::put(old); }
    8000198c:	0284c783          	lbu	a5,40(s1)
    80001990:	00079663          	bnez	a5,8000199c <_ZN3TCB8dispatchEv+0x34>
    80001994:	0294c783          	lbu	a5,41(s1)
    80001998:	04078063          	beqz	a5,800019d8 <_ZN3TCB8dispatchEv+0x70>
    running = Scheduler::get();
    8000199c:	00000097          	auipc	ra,0x0
    800019a0:	588080e7          	jalr	1416(ra) # 80001f24 <_ZN9Scheduler3getEv>
    800019a4:	00009797          	auipc	a5,0x9
    800019a8:	96a7b623          	sd	a0,-1684(a5) # 8000a310 <_ZN3TCB7runningE>
    TCB::contextSwitch(&old->context, &running->context);
    800019ac:	01850593          	addi	a1,a0,24
    800019b0:	01848513          	addi	a0,s1,24
    800019b4:	00000097          	auipc	ra,0x0
    800019b8:	86c080e7          	jalr	-1940(ra) # 80001220 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
    Riscv::popRegisters();
    800019bc:	fffff097          	auipc	ra,0xfffff
    800019c0:	6c0080e7          	jalr	1728(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    800019c4:	01813083          	ld	ra,24(sp)
    800019c8:	01013403          	ld	s0,16(sp)
    800019cc:	00813483          	ld	s1,8(sp)
    800019d0:	02010113          	addi	sp,sp,32
    800019d4:	00008067          	ret
    if (!old->finished && !old->blocked) { Scheduler::put(old); }
    800019d8:	00048513          	mv	a0,s1
    800019dc:	00000097          	auipc	ra,0x0
    800019e0:	5b0080e7          	jalr	1456(ra) # 80001f8c <_ZN9Scheduler3putEP3TCB>
    800019e4:	fb9ff06f          	j	8000199c <_ZN3TCB8dispatchEv+0x34>

00000000800019e8 <_ZN3TCB4exitEv>:

void TCB::exit() {
    800019e8:	ff010113          	addi	sp,sp,-16
    800019ec:	00113423          	sd	ra,8(sp)
    800019f0:	00813023          	sd	s0,0(sp)
    800019f4:	01010413          	addi	s0,sp,16
    running->finished = true;
    800019f8:	00009797          	auipc	a5,0x9
    800019fc:	9187b783          	ld	a5,-1768(a5) # 8000a310 <_ZN3TCB7runningE>
    80001a00:	00100713          	li	a4,1
    80001a04:	02e78423          	sb	a4,40(a5)
    dispatch();
    80001a08:	00000097          	auipc	ra,0x0
    80001a0c:	f60080e7          	jalr	-160(ra) # 80001968 <_ZN3TCB8dispatchEv>
}
    80001a10:	00813083          	ld	ra,8(sp)
    80001a14:	00013403          	ld	s0,0(sp)
    80001a18:	01010113          	addi	sp,sp,16
    80001a1c:	00008067          	ret

0000000080001a20 <_ZN3TCB13threadWrapperEv>:

void TCB::threadWrapper() {
    80001a20:	ff010113          	addi	sp,sp,-16
    80001a24:	00113423          	sd	ra,8(sp)
    80001a28:	00813023          	sd	s0,0(sp)
    80001a2c:	01010413          	addi	s0,sp,16
    running->body(running->arg);
    80001a30:	00009797          	auipc	a5,0x9
    80001a34:	8e07b783          	ld	a5,-1824(a5) # 8000a310 <_ZN3TCB7runningE>
    80001a38:	0007b703          	ld	a4,0(a5)
    80001a3c:	0087b503          	ld	a0,8(a5)
    80001a40:	000700e7          	jalr	a4 # 1000 <_entry-0x7ffff000>
    TCB::exit();
    80001a44:	00000097          	auipc	ra,0x0
    80001a48:	fa4080e7          	jalr	-92(ra) # 800019e8 <_ZN3TCB4exitEv>
}
    80001a4c:	00813083          	ld	ra,8(sp)
    80001a50:	00013403          	ld	s0,0(sp)
    80001a54:	01010113          	addi	sp,sp,16
    80001a58:	00008067          	ret

0000000080001a5c <_Znwm>:
//

// #include "../h/MemoryAllocator.h"
#include "../lib/mem.h"

void *operator new(uint64 n) {
    80001a5c:	ff010113          	addi	sp,sp,-16
    80001a60:	00113423          	sd	ra,8(sp)
    80001a64:	00813023          	sd	s0,0(sp)
    80001a68:	01010413          	addi	s0,sp,16
    return __mem_alloc(n);
    80001a6c:	00006097          	auipc	ra,0x6
    80001a70:	ffc080e7          	jalr	-4(ra) # 80007a68 <__mem_alloc>
}
    80001a74:	00813083          	ld	ra,8(sp)
    80001a78:	00013403          	ld	s0,0(sp)
    80001a7c:	01010113          	addi	sp,sp,16
    80001a80:	00008067          	ret

0000000080001a84 <_Znam>:

void *operator new[](uint64 n) {
    80001a84:	ff010113          	addi	sp,sp,-16
    80001a88:	00113423          	sd	ra,8(sp)
    80001a8c:	00813023          	sd	s0,0(sp)
    80001a90:	01010413          	addi	s0,sp,16
    return __mem_alloc(n);
    80001a94:	00006097          	auipc	ra,0x6
    80001a98:	fd4080e7          	jalr	-44(ra) # 80007a68 <__mem_alloc>
}
    80001a9c:	00813083          	ld	ra,8(sp)
    80001aa0:	00013403          	ld	s0,0(sp)
    80001aa4:	01010113          	addi	sp,sp,16
    80001aa8:	00008067          	ret

0000000080001aac <_ZdlPv>:

void operator delete(void *p) noexcept {
    80001aac:	ff010113          	addi	sp,sp,-16
    80001ab0:	00113423          	sd	ra,8(sp)
    80001ab4:	00813023          	sd	s0,0(sp)
    80001ab8:	01010413          	addi	s0,sp,16
    __mem_free(p);
    80001abc:	00006097          	auipc	ra,0x6
    80001ac0:	ee0080e7          	jalr	-288(ra) # 8000799c <__mem_free>
}
    80001ac4:	00813083          	ld	ra,8(sp)
    80001ac8:	00013403          	ld	s0,0(sp)
    80001acc:	01010113          	addi	sp,sp,16
    80001ad0:	00008067          	ret

0000000080001ad4 <_ZdaPv>:

void operator delete[](void *p) noexcept {
    80001ad4:	ff010113          	addi	sp,sp,-16
    80001ad8:	00113423          	sd	ra,8(sp)
    80001adc:	00813023          	sd	s0,0(sp)
    80001ae0:	01010413          	addi	s0,sp,16
    __mem_free(p);
    80001ae4:	00006097          	auipc	ra,0x6
    80001ae8:	eb8080e7          	jalr	-328(ra) # 8000799c <__mem_free>
    80001aec:	00813083          	ld	ra,8(sp)
    80001af0:	00013403          	ld	s0,0(sp)
    80001af4:	01010113          	addi	sp,sp,16
    80001af8:	00008067          	ret

0000000080001afc <_ZN6ThreadD1Ev>:

#include "../h/syscall_cpp.hpp"

Thread::Thread(void (*body)(void*), void* arg) : myHandle(nullptr), body(body), arg(arg) {}
Thread::Thread() : myHandle(nullptr), body(nullptr), arg(nullptr) {}
Thread::~Thread() {}
    80001afc:	ff010113          	addi	sp,sp,-16
    80001b00:	00813423          	sd	s0,8(sp)
    80001b04:	01010413          	addi	s0,sp,16
    80001b08:	00813403          	ld	s0,8(sp)
    80001b0c:	01010113          	addi	sp,sp,16
    80001b10:	00008067          	ret

0000000080001b14 <_ZN6Thread10runWrapperEPv>:
        return thread_create(&myHandle, body, arg);
    }
    return thread_create(&myHandle, &runWrapper, this);
}

void Thread::runWrapper(void* t) {
    80001b14:	ff010113          	addi	sp,sp,-16
    80001b18:	00113423          	sd	ra,8(sp)
    80001b1c:	00813023          	sd	s0,0(sp)
    80001b20:	01010413          	addi	s0,sp,16
    ((Thread*) t)->run();
    80001b24:	00053783          	ld	a5,0(a0)
    80001b28:	0107b783          	ld	a5,16(a5)
    80001b2c:	000780e7          	jalr	a5
}
    80001b30:	00813083          	ld	ra,8(sp)
    80001b34:	00013403          	ld	s0,0(sp)
    80001b38:	01010113          	addi	sp,sp,16
    80001b3c:	00008067          	ret

0000000080001b40 <_ZN6ThreadD0Ev>:
Thread::~Thread() {}
    80001b40:	ff010113          	addi	sp,sp,-16
    80001b44:	00113423          	sd	ra,8(sp)
    80001b48:	00813023          	sd	s0,0(sp)
    80001b4c:	01010413          	addi	s0,sp,16
    80001b50:	00000097          	auipc	ra,0x0
    80001b54:	f5c080e7          	jalr	-164(ra) # 80001aac <_ZdlPv>
    80001b58:	00813083          	ld	ra,8(sp)
    80001b5c:	00013403          	ld	s0,0(sp)
    80001b60:	01010113          	addi	sp,sp,16
    80001b64:	00008067          	ret

0000000080001b68 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    80001b68:	ff010113          	addi	sp,sp,-16
    80001b6c:	00113423          	sd	ra,8(sp)
    80001b70:	00813023          	sd	s0,0(sp)
    80001b74:	01010413          	addi	s0,sp,16
    80001b78:	00008797          	auipc	a5,0x8
    80001b7c:	56878793          	addi	a5,a5,1384 # 8000a0e0 <_ZTV9Semaphore+0x10>
    80001b80:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80001b84:	00853503          	ld	a0,8(a0)
    80001b88:	00000097          	auipc	ra,0x0
    80001b8c:	8e4080e7          	jalr	-1820(ra) # 8000146c <_Z9sem_closeP10KSemaphore>
}
    80001b90:	00813083          	ld	ra,8(sp)
    80001b94:	00013403          	ld	s0,0(sp)
    80001b98:	01010113          	addi	sp,sp,16
    80001b9c:	00008067          	ret

0000000080001ba0 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80001ba0:	fe010113          	addi	sp,sp,-32
    80001ba4:	00113c23          	sd	ra,24(sp)
    80001ba8:	00813823          	sd	s0,16(sp)
    80001bac:	00913423          	sd	s1,8(sp)
    80001bb0:	02010413          	addi	s0,sp,32
    80001bb4:	00050493          	mv	s1,a0
}
    80001bb8:	00000097          	auipc	ra,0x0
    80001bbc:	fb0080e7          	jalr	-80(ra) # 80001b68 <_ZN9SemaphoreD1Ev>
    80001bc0:	00048513          	mv	a0,s1
    80001bc4:	00000097          	auipc	ra,0x0
    80001bc8:	ee8080e7          	jalr	-280(ra) # 80001aac <_ZdlPv>
    80001bcc:	01813083          	ld	ra,24(sp)
    80001bd0:	01013403          	ld	s0,16(sp)
    80001bd4:	00813483          	ld	s1,8(sp)
    80001bd8:	02010113          	addi	sp,sp,32
    80001bdc:	00008067          	ret

0000000080001be0 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void*), void* arg) : myHandle(nullptr), body(body), arg(arg) {}
    80001be0:	ff010113          	addi	sp,sp,-16
    80001be4:	00813423          	sd	s0,8(sp)
    80001be8:	01010413          	addi	s0,sp,16
    80001bec:	00008797          	auipc	a5,0x8
    80001bf0:	4cc78793          	addi	a5,a5,1228 # 8000a0b8 <_ZTV6Thread+0x10>
    80001bf4:	00f53023          	sd	a5,0(a0)
    80001bf8:	00053423          	sd	zero,8(a0)
    80001bfc:	00b53823          	sd	a1,16(a0)
    80001c00:	00c53c23          	sd	a2,24(a0)
    80001c04:	00813403          	ld	s0,8(sp)
    80001c08:	01010113          	addi	sp,sp,16
    80001c0c:	00008067          	ret

0000000080001c10 <_ZN6ThreadC1Ev>:
Thread::Thread() : myHandle(nullptr), body(nullptr), arg(nullptr) {}
    80001c10:	ff010113          	addi	sp,sp,-16
    80001c14:	00813423          	sd	s0,8(sp)
    80001c18:	01010413          	addi	s0,sp,16
    80001c1c:	00008797          	auipc	a5,0x8
    80001c20:	49c78793          	addi	a5,a5,1180 # 8000a0b8 <_ZTV6Thread+0x10>
    80001c24:	00f53023          	sd	a5,0(a0)
    80001c28:	00053423          	sd	zero,8(a0)
    80001c2c:	00053823          	sd	zero,16(a0)
    80001c30:	00053c23          	sd	zero,24(a0)
    80001c34:	00813403          	ld	s0,8(sp)
    80001c38:	01010113          	addi	sp,sp,16
    80001c3c:	00008067          	ret

0000000080001c40 <_ZN6Thread5startEv>:
int Thread::start() {
    80001c40:	ff010113          	addi	sp,sp,-16
    80001c44:	00113423          	sd	ra,8(sp)
    80001c48:	00813023          	sd	s0,0(sp)
    80001c4c:	01010413          	addi	s0,sp,16
    if (body != nullptr) {
    80001c50:	01053583          	ld	a1,16(a0)
    80001c54:	02058263          	beqz	a1,80001c78 <_ZN6Thread5startEv+0x38>
        return thread_create(&myHandle, body, arg);
    80001c58:	01853603          	ld	a2,24(a0)
    80001c5c:	00850513          	addi	a0,a0,8
    80001c60:	fffff097          	auipc	ra,0xfffff
    80001c64:	6cc080e7          	jalr	1740(ra) # 8000132c <_Z13thread_createPP3TCBPFvPvES2_>
}
    80001c68:	00813083          	ld	ra,8(sp)
    80001c6c:	00013403          	ld	s0,0(sp)
    80001c70:	01010113          	addi	sp,sp,16
    80001c74:	00008067          	ret
    return thread_create(&myHandle, &runWrapper, this);
    80001c78:	00050613          	mv	a2,a0
    80001c7c:	00000597          	auipc	a1,0x0
    80001c80:	e9858593          	addi	a1,a1,-360 # 80001b14 <_ZN6Thread10runWrapperEPv>
    80001c84:	00850513          	addi	a0,a0,8
    80001c88:	fffff097          	auipc	ra,0xfffff
    80001c8c:	6a4080e7          	jalr	1700(ra) # 8000132c <_Z13thread_createPP3TCBPFvPvES2_>
    80001c90:	fd9ff06f          	j	80001c68 <_ZN6Thread5startEv+0x28>

0000000080001c94 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80001c94:	ff010113          	addi	sp,sp,-16
    80001c98:	00113423          	sd	ra,8(sp)
    80001c9c:	00813023          	sd	s0,0(sp)
    80001ca0:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80001ca4:	fffff097          	auipc	ra,0xfffff
    80001ca8:	748080e7          	jalr	1864(ra) # 800013ec <_Z15thread_dispatchv>
}
    80001cac:	00813083          	ld	ra,8(sp)
    80001cb0:	00013403          	ld	s0,0(sp)
    80001cb4:	01010113          	addi	sp,sp,16
    80001cb8:	00008067          	ret

0000000080001cbc <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned init) {
    80001cbc:	ff010113          	addi	sp,sp,-16
    80001cc0:	00113423          	sd	ra,8(sp)
    80001cc4:	00813023          	sd	s0,0(sp)
    80001cc8:	01010413          	addi	s0,sp,16
    80001ccc:	00008797          	auipc	a5,0x8
    80001cd0:	41478793          	addi	a5,a5,1044 # 8000a0e0 <_ZTV9Semaphore+0x10>
    80001cd4:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    80001cd8:	00850513          	addi	a0,a0,8
    80001cdc:	fffff097          	auipc	ra,0xfffff
    80001ce0:	74c080e7          	jalr	1868(ra) # 80001428 <_Z8sem_openPP10KSemaphorej>
}
    80001ce4:	00813083          	ld	ra,8(sp)
    80001ce8:	00013403          	ld	s0,0(sp)
    80001cec:	01010113          	addi	sp,sp,16
    80001cf0:	00008067          	ret

0000000080001cf4 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    80001cf4:	ff010113          	addi	sp,sp,-16
    80001cf8:	00113423          	sd	ra,8(sp)
    80001cfc:	00813023          	sd	s0,0(sp)
    80001d00:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80001d04:	00853503          	ld	a0,8(a0)
    80001d08:	fffff097          	auipc	ra,0xfffff
    80001d0c:	7a4080e7          	jalr	1956(ra) # 800014ac <_Z8sem_waitP10KSemaphore>
}
    80001d10:	00813083          	ld	ra,8(sp)
    80001d14:	00013403          	ld	s0,0(sp)
    80001d18:	01010113          	addi	sp,sp,16
    80001d1c:	00008067          	ret

0000000080001d20 <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    80001d20:	ff010113          	addi	sp,sp,-16
    80001d24:	00113423          	sd	ra,8(sp)
    80001d28:	00813023          	sd	s0,0(sp)
    80001d2c:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80001d30:	00853503          	ld	a0,8(a0)
    80001d34:	fffff097          	auipc	ra,0xfffff
    80001d38:	7b8080e7          	jalr	1976(ra) # 800014ec <_Z10sem_signalP10KSemaphore>
}
    80001d3c:	00813083          	ld	ra,8(sp)
    80001d40:	00013403          	ld	s0,0(sp)
    80001d44:	01010113          	addi	sp,sp,16
    80001d48:	00008067          	ret

0000000080001d4c <_ZN6Thread5sleepEm>:

int Thread::sleep(uint64 t) {
    80001d4c:	ff010113          	addi	sp,sp,-16
    80001d50:	00813423          	sd	s0,8(sp)
    80001d54:	01010413          	addi	s0,sp,16
    return 0;
}
    80001d58:	00000513          	li	a0,0
    80001d5c:	00813403          	ld	s0,8(sp)
    80001d60:	01010113          	addi	sp,sp,16
    80001d64:	00008067          	ret

0000000080001d68 <_ZN6Thread3runEv>:
    int start();
    static void dispatch();
    static int sleep(uint64);
protected:
    Thread();
    virtual void run() {}
    80001d68:	ff010113          	addi	sp,sp,-16
    80001d6c:	00813423          	sd	s0,8(sp)
    80001d70:	01010413          	addi	s0,sp,16
    80001d74:	00813403          	ld	s0,8(sp)
    80001d78:	01010113          	addi	sp,sp,16
    80001d7c:	00008067          	ret

0000000080001d80 <_ZN5Riscv20handleSupervisorTrapEPm>:
#include "../h/riscv.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/semaphore.hpp"
#include "../h/tcb.hpp"

void Riscv::handleSupervisorTrap(uint64* regs) {
    80001d80:	fb010113          	addi	sp,sp,-80
    80001d84:	04113423          	sd	ra,72(sp)
    80001d88:	04813023          	sd	s0,64(sp)
    80001d8c:	02913c23          	sd	s1,56(sp)
    80001d90:	03213823          	sd	s2,48(sp)
    80001d94:	03313423          	sd	s3,40(sp)
    80001d98:	03413023          	sd	s4,32(sp)
    80001d9c:	05010413          	addi	s0,sp,80
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80001da0:	142027f3          	csrr	a5,scause
    80001da4:	faf43c23          	sd	a5,-72(s0)
    return scause;
    80001da8:	fb843783          	ld	a5,-72(s0)

    uint64 scause = r_scause();

    if (scause == ecallU || scause == ecallS) {
    80001dac:	ff878793          	addi	a5,a5,-8
    80001db0:	00100713          	li	a4,1
    80001db4:	02f77263          	bgeu	a4,a5,80001dd8 <_ZN5Riscv20handleSupervisorTrapEPm+0x58>

    } else {

    }

}
    80001db8:	04813083          	ld	ra,72(sp)
    80001dbc:	04013403          	ld	s0,64(sp)
    80001dc0:	03813483          	ld	s1,56(sp)
    80001dc4:	03013903          	ld	s2,48(sp)
    80001dc8:	02813983          	ld	s3,40(sp)
    80001dcc:	02013a03          	ld	s4,32(sp)
    80001dd0:	05010113          	addi	sp,sp,80
    80001dd4:	00008067          	ret
    80001dd8:	00050493          	mv	s1,a0
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80001ddc:	141027f3          	csrr	a5,sepc
    80001de0:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80001de4:	fc843903          	ld	s2,-56(s0)
        uint64 sepc = r_sepc() + 4;
    80001de8:	00490913          	addi	s2,s2,4
    __asm__ volatile ("csrc sstatus, %[mask]" :: [mask] "r"(mask));
}

inline uint64 Riscv::r_sstatus() {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001dec:	100027f3          	csrr	a5,sstatus
    80001df0:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    80001df4:	fc043983          	ld	s3,-64(s0)
        uint64 code = regs[10]; // a0 = kod
    80001df8:	05053783          	ld	a5,80(a0)
        switch (code) {
    80001dfc:	02400713          	li	a4,36
    80001e00:	02f76863          	bltu	a4,a5,80001e30 <_ZN5Riscv20handleSupervisorTrapEPm+0xb0>
    80001e04:	00279793          	slli	a5,a5,0x2
    80001e08:	00006717          	auipc	a4,0x6
    80001e0c:	2d470713          	addi	a4,a4,724 # 800080dc <CONSOLE_STATUS+0xcc>
    80001e10:	00e787b3          	add	a5,a5,a4
    80001e14:	0007a783          	lw	a5,0(a5)
    80001e18:	00e787b3          	add	a5,a5,a4
    80001e1c:	00078067          	jr	a5
                regs[10] = (uint64) MemoryAllocator::mem_alloc((size_t) regs[11]);
    80001e20:	05853503          	ld	a0,88(a0)
    80001e24:	00000097          	auipc	ra,0x0
    80001e28:	24c080e7          	jalr	588(ra) # 80002070 <_ZN15MemoryAllocator9mem_allocEm>
    80001e2c:	04a4b823          	sd	a0,80(s1)
}

inline void Riscv::w_sstatus(uint64 sstatus) {
    __asm__ volatile ("csrw sstatus, %[sstatus]" :: [sstatus] "r"(sstatus));
    80001e30:	10099073          	csrw	sstatus,s3
    __asm__ volatile ("csrw sepc, %[sepc]" :: [sepc] "r"(sepc));
    80001e34:	14191073          	csrw	sepc,s2
}
    80001e38:	f81ff06f          	j	80001db8 <_ZN5Riscv20handleSupervisorTrapEPm+0x38>
                regs[10] = (uint64) MemoryAllocator::mem_free((void*) regs[11]);
    80001e3c:	05853503          	ld	a0,88(a0)
    80001e40:	00000097          	auipc	ra,0x0
    80001e44:	324080e7          	jalr	804(ra) # 80002164 <_ZN15MemoryAllocator8mem_freeEPv>
    80001e48:	04a4b823          	sd	a0,80(s1)
                break;
    80001e4c:	fe5ff06f          	j	80001e30 <_ZN5Riscv20handleSupervisorTrapEPm+0xb0>
                TCB** handle = (TCB**) regs[11];
    80001e50:	05853a03          	ld	s4,88(a0)
                *handle = TCB::createThread(body, arg, stack);
    80001e54:	07053603          	ld	a2,112(a0)
    80001e58:	06853583          	ld	a1,104(a0)
    80001e5c:	06053503          	ld	a0,96(a0)
    80001e60:	00000097          	auipc	ra,0x0
    80001e64:	a28080e7          	jalr	-1496(ra) # 80001888 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001e68:	00aa3023          	sd	a0,0(s4)
                regs[10] = 0; // uradio dobro
    80001e6c:	0404b823          	sd	zero,80(s1)
                break;
    80001e70:	fc1ff06f          	j	80001e30 <_ZN5Riscv20handleSupervisorTrapEPm+0xb0>
                TCB::exit();
    80001e74:	00000097          	auipc	ra,0x0
    80001e78:	b74080e7          	jalr	-1164(ra) # 800019e8 <_ZN3TCB4exitEv>
                break;
    80001e7c:	fb5ff06f          	j	80001e30 <_ZN5Riscv20handleSupervisorTrapEPm+0xb0>
                TCB::dispatch();
    80001e80:	00000097          	auipc	ra,0x0
    80001e84:	ae8080e7          	jalr	-1304(ra) # 80001968 <_ZN3TCB8dispatchEv>
                break;
    80001e88:	fa9ff06f          	j	80001e30 <_ZN5Riscv20handleSupervisorTrapEPm+0xb0>
                KSemaphore** h = (KSemaphore**) regs[11];
    80001e8c:	05853a03          	ld	s4,88(a0)
                *h = KSemaphore::createSemaphore((unsigned) regs[12]);
    80001e90:	06052503          	lw	a0,96(a0)
    80001e94:	fffff097          	auipc	ra,0xfffff
    80001e98:	6b4080e7          	jalr	1716(ra) # 80001548 <_ZN10KSemaphore15createSemaphoreEj>
    80001e9c:	00aa3023          	sd	a0,0(s4)
                regs[10] = 0;
    80001ea0:	0404b823          	sd	zero,80(s1)
                break;
    80001ea4:	f8dff06f          	j	80001e30 <_ZN5Riscv20handleSupervisorTrapEPm+0xb0>
                regs[10] = ((KSemaphore*) regs[11])->close();
    80001ea8:	05853503          	ld	a0,88(a0)
    80001eac:	00000097          	auipc	ra,0x0
    80001eb0:	804080e7          	jalr	-2044(ra) # 800016b0 <_ZN10KSemaphore5closeEv>
    80001eb4:	04a4b823          	sd	a0,80(s1)
                break;
    80001eb8:	f79ff06f          	j	80001e30 <_ZN5Riscv20handleSupervisorTrapEPm+0xb0>
                regs[10] = ((KSemaphore*) regs[11])->wait();
    80001ebc:	05853503          	ld	a0,88(a0)
    80001ec0:	fffff097          	auipc	ra,0xfffff
    80001ec4:	6cc080e7          	jalr	1740(ra) # 8000158c <_ZN10KSemaphore4waitEv>
    80001ec8:	04a4b823          	sd	a0,80(s1)
                break;
    80001ecc:	f65ff06f          	j	80001e30 <_ZN5Riscv20handleSupervisorTrapEPm+0xb0>
                regs[10] = ((KSemaphore*) regs[11])->signal();
    80001ed0:	05853503          	ld	a0,88(a0)
    80001ed4:	fffff097          	auipc	ra,0xfffff
    80001ed8:	754080e7          	jalr	1876(ra) # 80001628 <_ZN10KSemaphore6signalEv>
    80001edc:	04a4b823          	sd	a0,80(s1)
                break;
    80001ee0:	f51ff06f          	j	80001e30 <_ZN5Riscv20handleSupervisorTrapEPm+0xb0>

0000000080001ee4 <_Z41__static_initialization_and_destruction_0ii>:
    return readyQueue.removeFirst();
}

void Scheduler::put(TCB *tcb) {
    readyQueue.addLast(tcb);
    80001ee4:	ff010113          	addi	sp,sp,-16
    80001ee8:	00813423          	sd	s0,8(sp)
    80001eec:	01010413          	addi	s0,sp,16
    80001ef0:	00100793          	li	a5,1
    80001ef4:	00f50863          	beq	a0,a5,80001f04 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80001ef8:	00813403          	ld	s0,8(sp)
    80001efc:	01010113          	addi	sp,sp,16
    80001f00:	00008067          	ret
    80001f04:	000107b7          	lui	a5,0x10
    80001f08:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001f0c:	fef596e3          	bne	a1,a5,80001ef8 <_Z41__static_initialization_and_destruction_0ii+0x14>
    List() : head(0), tail(0) {}
    80001f10:	00008797          	auipc	a5,0x8
    80001f14:	40878793          	addi	a5,a5,1032 # 8000a318 <_ZN9Scheduler10readyQueueE>
    80001f18:	0007b023          	sd	zero,0(a5)
    80001f1c:	0007b423          	sd	zero,8(a5)
    80001f20:	fd9ff06f          	j	80001ef8 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080001f24 <_ZN9Scheduler3getEv>:
TCB *Scheduler::get() {
    80001f24:	fe010113          	addi	sp,sp,-32
    80001f28:	00113c23          	sd	ra,24(sp)
    80001f2c:	00813823          	sd	s0,16(sp)
    80001f30:	00913423          	sd	s1,8(sp)
    80001f34:	02010413          	addi	s0,sp,32
        if (!head) { return 0; }
    80001f38:	00008517          	auipc	a0,0x8
    80001f3c:	3e053503          	ld	a0,992(a0) # 8000a318 <_ZN9Scheduler10readyQueueE>
    80001f40:	04050263          	beqz	a0,80001f84 <_ZN9Scheduler3getEv+0x60>
        head = head->next;
    80001f44:	00853783          	ld	a5,8(a0)
    80001f48:	00008717          	auipc	a4,0x8
    80001f4c:	3cf73823          	sd	a5,976(a4) # 8000a318 <_ZN9Scheduler10readyQueueE>
        if (!head) { tail = 0; }
    80001f50:	02078463          	beqz	a5,80001f78 <_ZN9Scheduler3getEv+0x54>
        T *ret = elem->data;
    80001f54:	00053483          	ld	s1,0(a0)
        delete elem;
    80001f58:	00000097          	auipc	ra,0x0
    80001f5c:	b54080e7          	jalr	-1196(ra) # 80001aac <_ZdlPv>
}
    80001f60:	00048513          	mv	a0,s1
    80001f64:	01813083          	ld	ra,24(sp)
    80001f68:	01013403          	ld	s0,16(sp)
    80001f6c:	00813483          	ld	s1,8(sp)
    80001f70:	02010113          	addi	sp,sp,32
    80001f74:	00008067          	ret
        if (!head) { tail = 0; }
    80001f78:	00008797          	auipc	a5,0x8
    80001f7c:	3a07b423          	sd	zero,936(a5) # 8000a320 <_ZN9Scheduler10readyQueueE+0x8>
    80001f80:	fd5ff06f          	j	80001f54 <_ZN9Scheduler3getEv+0x30>
        if (!head) { return 0; }
    80001f84:	00050493          	mv	s1,a0
    return readyQueue.removeFirst();
    80001f88:	fd9ff06f          	j	80001f60 <_ZN9Scheduler3getEv+0x3c>

0000000080001f8c <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *tcb) {
    80001f8c:	fe010113          	addi	sp,sp,-32
    80001f90:	00113c23          	sd	ra,24(sp)
    80001f94:	00813823          	sd	s0,16(sp)
    80001f98:	00913423          	sd	s1,8(sp)
    80001f9c:	02010413          	addi	s0,sp,32
    80001fa0:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    80001fa4:	01000513          	li	a0,16
    80001fa8:	00000097          	auipc	ra,0x0
    80001fac:	ab4080e7          	jalr	-1356(ra) # 80001a5c <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    80001fb0:	00953023          	sd	s1,0(a0)
    80001fb4:	00053423          	sd	zero,8(a0)
        if (tail) {
    80001fb8:	00008797          	auipc	a5,0x8
    80001fbc:	3687b783          	ld	a5,872(a5) # 8000a320 <_ZN9Scheduler10readyQueueE+0x8>
    80001fc0:	02078263          	beqz	a5,80001fe4 <_ZN9Scheduler3putEP3TCB+0x58>
            tail->next = elem;
    80001fc4:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80001fc8:	00008797          	auipc	a5,0x8
    80001fcc:	34a7bc23          	sd	a0,856(a5) # 8000a320 <_ZN9Scheduler10readyQueueE+0x8>
    80001fd0:	01813083          	ld	ra,24(sp)
    80001fd4:	01013403          	ld	s0,16(sp)
    80001fd8:	00813483          	ld	s1,8(sp)
    80001fdc:	02010113          	addi	sp,sp,32
    80001fe0:	00008067          	ret
            head = tail = elem;
    80001fe4:	00008797          	auipc	a5,0x8
    80001fe8:	33478793          	addi	a5,a5,820 # 8000a318 <_ZN9Scheduler10readyQueueE>
    80001fec:	00a7b423          	sd	a0,8(a5)
    80001ff0:	00a7b023          	sd	a0,0(a5)
    80001ff4:	fddff06f          	j	80001fd0 <_ZN9Scheduler3putEP3TCB+0x44>

0000000080001ff8 <_GLOBAL__sub_I__ZN9Scheduler10readyQueueE>:
    80001ff8:	ff010113          	addi	sp,sp,-16
    80001ffc:	00113423          	sd	ra,8(sp)
    80002000:	00813023          	sd	s0,0(sp)
    80002004:	01010413          	addi	s0,sp,16
    80002008:	000105b7          	lui	a1,0x10
    8000200c:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002010:	00100513          	li	a0,1
    80002014:	00000097          	auipc	ra,0x0
    80002018:	ed0080e7          	jalr	-304(ra) # 80001ee4 <_Z41__static_initialization_and_destruction_0ii>
    8000201c:	00813083          	ld	ra,8(sp)
    80002020:	00013403          	ld	s0,0(sp)
    80002024:	01010113          	addi	sp,sp,16
    80002028:	00008067          	ret

000000008000202c <_ZN15MemoryAllocator10initializeEv>:

#include "../h/MemoryAllocator.hpp"

MemoryAllocator::MemoryBlock* MemoryAllocator::head = 0;

void MemoryAllocator::initialize() {
    8000202c:	ff010113          	addi	sp,sp,-16
    80002030:	00813423          	sd	s0,8(sp)
    80002034:	01010413          	addi	s0,sp,16
    head = (MemoryBlock*) HEAP_START_ADDR;
    80002038:	00008797          	auipc	a5,0x8
    8000203c:	2687b783          	ld	a5,616(a5) # 8000a2a0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002040:	0007b783          	ld	a5,0(a5)
    80002044:	00008717          	auipc	a4,0x8
    80002048:	2ef73223          	sd	a5,740(a4) # 8000a328 <_ZN15MemoryAllocator4headE>
    head->next = nullptr;
    8000204c:	0007b423          	sd	zero,8(a5)
    head->size = ((char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR);
    80002050:	00008717          	auipc	a4,0x8
    80002054:	27073703          	ld	a4,624(a4) # 8000a2c0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002058:	00073703          	ld	a4,0(a4)
    8000205c:	40f70733          	sub	a4,a4,a5
    80002060:	00e7b023          	sd	a4,0(a5)
}
    80002064:	00813403          	ld	s0,8(sp)
    80002068:	01010113          	addi	sp,sp,16
    8000206c:	00008067          	ret

0000000080002070 <_ZN15MemoryAllocator9mem_allocEm>:

void *MemoryAllocator::mem_alloc(::size_t size) {
    80002070:	ff010113          	addi	sp,sp,-16
    80002074:	00813423          	sd	s0,8(sp)
    80002078:	01010413          	addi	s0,sp,16
    size_t numBytes = size + sizeof(MemoryBlock);
    8000207c:	01050793          	addi	a5,a0,16
    numBytes = (numBytes % MEM_BLOCK_SIZE) ? (numBytes/MEM_BLOCK_SIZE+1)*MEM_BLOCK_SIZE : numBytes;
    80002080:	03f7f713          	andi	a4,a5,63
    80002084:	00070863          	beqz	a4,80002094 <_ZN15MemoryAllocator9mem_allocEm+0x24>
    80002088:	0067d793          	srli	a5,a5,0x6
    8000208c:	00178793          	addi	a5,a5,1
    80002090:	00679793          	slli	a5,a5,0x6

    MemoryBlock* curr = head;
    80002094:	00008517          	auipc	a0,0x8
    80002098:	29453503          	ld	a0,660(a0) # 8000a328 <_ZN15MemoryAllocator4headE>
    MemoryBlock* prev = nullptr;
    8000209c:	00000693          	li	a3,0

    while (curr) {
    800020a0:	00050c63          	beqz	a0,800020b8 <_ZN15MemoryAllocator9mem_allocEm+0x48>
        if (curr->size >= numBytes) {
    800020a4:	00053703          	ld	a4,0(a0)
    800020a8:	00f77863          	bgeu	a4,a5,800020b8 <_ZN15MemoryAllocator9mem_allocEm+0x48>
            break;
        } else {
            prev = curr;
    800020ac:	00050693          	mv	a3,a0
            curr = curr->next;
    800020b0:	00853503          	ld	a0,8(a0)
    while (curr) {
    800020b4:	fedff06f          	j	800020a0 <_ZN15MemoryAllocator9mem_allocEm+0x30>
        }
    }

    if (!curr || curr->size < numBytes) {
    800020b8:	04050e63          	beqz	a0,80002114 <_ZN15MemoryAllocator9mem_allocEm+0xa4>
    800020bc:	00053703          	ld	a4,0(a0)
    800020c0:	06f76663          	bltu	a4,a5,8000212c <_ZN15MemoryAllocator9mem_allocEm+0xbc>
        return nullptr;
    }

    if (curr->size-numBytes < MEM_BLOCK_SIZE + sizeof(MemoryBlock)) {
    800020c4:	40f70733          	sub	a4,a4,a5
    800020c8:	04f00613          	li	a2,79
    800020cc:	02e66263          	bltu	a2,a4,800020f0 <_ZN15MemoryAllocator9mem_allocEm+0x80>
        (prev ? prev->next : head)  = curr->next;
    800020d0:	00068863          	beqz	a3,800020e0 <_ZN15MemoryAllocator9mem_allocEm+0x70>
    800020d4:	00853783          	ld	a5,8(a0)
    800020d8:	00f6b423          	sd	a5,8(a3)
    800020dc:	0300006f          	j	8000210c <_ZN15MemoryAllocator9mem_allocEm+0x9c>
    800020e0:	00853783          	ld	a5,8(a0)
    800020e4:	00008717          	auipc	a4,0x8
    800020e8:	24f73223          	sd	a5,580(a4) # 8000a328 <_ZN15MemoryAllocator4headE>
    800020ec:	0200006f          	j	8000210c <_ZN15MemoryAllocator9mem_allocEm+0x9c>
    }else {
        MemoryBlock* newBlock = (MemoryBlock*) ((char*)curr + numBytes);
    800020f0:	00f50633          	add	a2,a0,a5
        newBlock->size = curr->size - numBytes;
    800020f4:	00e63023          	sd	a4,0(a2)
        newBlock->next = curr->next;
    800020f8:	00853703          	ld	a4,8(a0)
    800020fc:	00e63423          	sd	a4,8(a2)
        (prev ? prev->next : head)  = newBlock;
    80002100:	02068063          	beqz	a3,80002120 <_ZN15MemoryAllocator9mem_allocEm+0xb0>
    80002104:	00c6b423          	sd	a2,8(a3)
        curr->size = numBytes;
    80002108:	00f53023          	sd	a5,0(a0)
    }

    curr->next = nullptr;
    8000210c:	00053423          	sd	zero,8(a0)

    return (char*)curr+sizeof(MemoryBlock);
    80002110:	01050513          	addi	a0,a0,16
}
    80002114:	00813403          	ld	s0,8(sp)
    80002118:	01010113          	addi	sp,sp,16
    8000211c:	00008067          	ret
        (prev ? prev->next : head)  = newBlock;
    80002120:	00008717          	auipc	a4,0x8
    80002124:	20c73423          	sd	a2,520(a4) # 8000a328 <_ZN15MemoryAllocator4headE>
    80002128:	fe1ff06f          	j	80002108 <_ZN15MemoryAllocator9mem_allocEm+0x98>
        return nullptr;
    8000212c:	00000513          	li	a0,0
    80002130:	fe5ff06f          	j	80002114 <_ZN15MemoryAllocator9mem_allocEm+0xa4>

0000000080002134 <_ZN15MemoryAllocator10joinBlocksEPNS_11MemoryBlockES1_>:

    return 0;

}

MemoryAllocator::MemoryBlock *MemoryAllocator::joinBlocks(MemoryBlock* block, MemoryBlock* toJoin) {
    80002134:	ff010113          	addi	sp,sp,-16
    80002138:	00813423          	sd	s0,8(sp)
    8000213c:	01010413          	addi	s0,sp,16
    block->size += toJoin->size;
    80002140:	0005b683          	ld	a3,0(a1)
    80002144:	00053703          	ld	a4,0(a0)
    80002148:	00d70733          	add	a4,a4,a3
    8000214c:	00e53023          	sd	a4,0(a0)
    block->next = toJoin->next;
    80002150:	0085b703          	ld	a4,8(a1)
    80002154:	00e53423          	sd	a4,8(a0)

    return block;
    80002158:	00813403          	ld	s0,8(sp)
    8000215c:	01010113          	addi	sp,sp,16
    80002160:	00008067          	ret

0000000080002164 <_ZN15MemoryAllocator8mem_freeEPv>:
int MemoryAllocator::mem_free(void* adr) {
    80002164:	fe010113          	addi	sp,sp,-32
    80002168:	00113c23          	sd	ra,24(sp)
    8000216c:	00813823          	sd	s0,16(sp)
    80002170:	00913423          	sd	s1,8(sp)
    80002174:	02010413          	addi	s0,sp,32
    MemoryBlock* block = (MemoryBlock*) ((char*)adr - sizeof(MemoryBlock));
    80002178:	ff050713          	addi	a4,a0,-16
    MemoryBlock* curr = head;
    8000217c:	00008497          	auipc	s1,0x8
    80002180:	1ac4b483          	ld	s1,428(s1) # 8000a328 <_ZN15MemoryAllocator4headE>
    MemoryBlock* prev = nullptr;
    80002184:	00000793          	li	a5,0
    while (curr && block > curr) {
    80002188:	00048a63          	beqz	s1,8000219c <_ZN15MemoryAllocator8mem_freeEPv+0x38>
    8000218c:	00e4f863          	bgeu	s1,a4,8000219c <_ZN15MemoryAllocator8mem_freeEPv+0x38>
        prev = curr;
    80002190:	00048793          	mv	a5,s1
        curr = curr->next;
    80002194:	0084b483          	ld	s1,8(s1)
    while (curr && block > curr) {
    80002198:	ff1ff06f          	j	80002188 <_ZN15MemoryAllocator8mem_freeEPv+0x24>
    block->next = curr;
    8000219c:	fe953c23          	sd	s1,-8(a0)
    (prev ? prev->next : head) = block;
    800021a0:	04078063          	beqz	a5,800021e0 <_ZN15MemoryAllocator8mem_freeEPv+0x7c>
    800021a4:	00e7b423          	sd	a4,8(a5)
    if (prev && (char*)prev + prev->size == (char*)block) {
    800021a8:	00078863          	beqz	a5,800021b8 <_ZN15MemoryAllocator8mem_freeEPv+0x54>
    800021ac:	0007b683          	ld	a3,0(a5)
    800021b0:	00d786b3          	add	a3,a5,a3
    800021b4:	02e68c63          	beq	a3,a4,800021ec <_ZN15MemoryAllocator8mem_freeEPv+0x88>
    if (curr && (char*) block + block->size == (char*)curr) {
    800021b8:	00048863          	beqz	s1,800021c8 <_ZN15MemoryAllocator8mem_freeEPv+0x64>
    800021bc:	00073783          	ld	a5,0(a4)
    800021c0:	00f707b3          	add	a5,a4,a5
    800021c4:	04978063          	beq	a5,s1,80002204 <_ZN15MemoryAllocator8mem_freeEPv+0xa0>
}
    800021c8:	00000513          	li	a0,0
    800021cc:	01813083          	ld	ra,24(sp)
    800021d0:	01013403          	ld	s0,16(sp)
    800021d4:	00813483          	ld	s1,8(sp)
    800021d8:	02010113          	addi	sp,sp,32
    800021dc:	00008067          	ret
    (prev ? prev->next : head) = block;
    800021e0:	00008697          	auipc	a3,0x8
    800021e4:	14e6b423          	sd	a4,328(a3) # 8000a328 <_ZN15MemoryAllocator4headE>
    800021e8:	fc1ff06f          	j	800021a8 <_ZN15MemoryAllocator8mem_freeEPv+0x44>
        block = joinBlocks(prev, block);
    800021ec:	00070593          	mv	a1,a4
    800021f0:	00078513          	mv	a0,a5
    800021f4:	00000097          	auipc	ra,0x0
    800021f8:	f40080e7          	jalr	-192(ra) # 80002134 <_ZN15MemoryAllocator10joinBlocksEPNS_11MemoryBlockES1_>
    800021fc:	00050713          	mv	a4,a0
    80002200:	fb9ff06f          	j	800021b8 <_ZN15MemoryAllocator8mem_freeEPv+0x54>
        block = joinBlocks(block, curr);
    80002204:	00048593          	mv	a1,s1
    80002208:	00070513          	mv	a0,a4
    8000220c:	00000097          	auipc	ra,0x0
    80002210:	f28080e7          	jalr	-216(ra) # 80002134 <_ZN15MemoryAllocator10joinBlocksEPNS_11MemoryBlockES1_>
    80002214:	fb5ff06f          	j	800021c8 <_ZN15MemoryAllocator8mem_freeEPv+0x64>

0000000080002218 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80002218:	fe010113          	addi	sp,sp,-32
    8000221c:	00113c23          	sd	ra,24(sp)
    80002220:	00813823          	sd	s0,16(sp)
    80002224:	00913423          	sd	s1,8(sp)
    80002228:	01213023          	sd	s2,0(sp)
    8000222c:	02010413          	addi	s0,sp,32
    80002230:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80002234:	00000913          	li	s2,0
    80002238:	00c0006f          	j	80002244 <_ZL16producerKeyboardPv+0x2c>
    while ((key = __getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    8000223c:	fffff097          	auipc	ra,0xfffff
    80002240:	1b0080e7          	jalr	432(ra) # 800013ec <_Z15thread_dispatchv>
    while ((key = __getc()) != 0x1b) {
    80002244:	00006097          	auipc	ra,0x6
    80002248:	9b8080e7          	jalr	-1608(ra) # 80007bfc <__getc>
    8000224c:	0005059b          	sext.w	a1,a0
    80002250:	01b00793          	li	a5,27
    80002254:	02f58a63          	beq	a1,a5,80002288 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80002258:	0084b503          	ld	a0,8(s1)
    8000225c:	00003097          	auipc	ra,0x3
    80002260:	3f4080e7          	jalr	1012(ra) # 80005650 <_ZN6Buffer3putEi>
        i++;
    80002264:	0019071b          	addiw	a4,s2,1
    80002268:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000226c:	0004a683          	lw	a3,0(s1)
    80002270:	0026979b          	slliw	a5,a3,0x2
    80002274:	00d787bb          	addw	a5,a5,a3
    80002278:	0017979b          	slliw	a5,a5,0x1
    8000227c:	02f767bb          	remw	a5,a4,a5
    80002280:	fc0792e3          	bnez	a5,80002244 <_ZL16producerKeyboardPv+0x2c>
    80002284:	fb9ff06f          	j	8000223c <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80002288:	00100793          	li	a5,1
    8000228c:	00008717          	auipc	a4,0x8
    80002290:	0af72223          	sw	a5,164(a4) # 8000a330 <_ZL9threadEnd>
    data->buffer->put('!');
    80002294:	02100593          	li	a1,33
    80002298:	0084b503          	ld	a0,8(s1)
    8000229c:	00003097          	auipc	ra,0x3
    800022a0:	3b4080e7          	jalr	948(ra) # 80005650 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800022a4:	0104b503          	ld	a0,16(s1)
    800022a8:	fffff097          	auipc	ra,0xfffff
    800022ac:	244080e7          	jalr	580(ra) # 800014ec <_Z10sem_signalP10KSemaphore>
}
    800022b0:	01813083          	ld	ra,24(sp)
    800022b4:	01013403          	ld	s0,16(sp)
    800022b8:	00813483          	ld	s1,8(sp)
    800022bc:	00013903          	ld	s2,0(sp)
    800022c0:	02010113          	addi	sp,sp,32
    800022c4:	00008067          	ret

00000000800022c8 <_ZL8producerPv>:

static void producer(void *arg) {
    800022c8:	fe010113          	addi	sp,sp,-32
    800022cc:	00113c23          	sd	ra,24(sp)
    800022d0:	00813823          	sd	s0,16(sp)
    800022d4:	00913423          	sd	s1,8(sp)
    800022d8:	01213023          	sd	s2,0(sp)
    800022dc:	02010413          	addi	s0,sp,32
    800022e0:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800022e4:	00000913          	li	s2,0
    800022e8:	00c0006f          	j	800022f4 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800022ec:	fffff097          	auipc	ra,0xfffff
    800022f0:	100080e7          	jalr	256(ra) # 800013ec <_Z15thread_dispatchv>
    while (!threadEnd) {
    800022f4:	00008797          	auipc	a5,0x8
    800022f8:	03c7a783          	lw	a5,60(a5) # 8000a330 <_ZL9threadEnd>
    800022fc:	02079e63          	bnez	a5,80002338 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80002300:	0004a583          	lw	a1,0(s1)
    80002304:	0305859b          	addiw	a1,a1,48
    80002308:	0084b503          	ld	a0,8(s1)
    8000230c:	00003097          	auipc	ra,0x3
    80002310:	344080e7          	jalr	836(ra) # 80005650 <_ZN6Buffer3putEi>
        i++;
    80002314:	0019071b          	addiw	a4,s2,1
    80002318:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000231c:	0004a683          	lw	a3,0(s1)
    80002320:	0026979b          	slliw	a5,a3,0x2
    80002324:	00d787bb          	addw	a5,a5,a3
    80002328:	0017979b          	slliw	a5,a5,0x1
    8000232c:	02f767bb          	remw	a5,a4,a5
    80002330:	fc0792e3          	bnez	a5,800022f4 <_ZL8producerPv+0x2c>
    80002334:	fb9ff06f          	j	800022ec <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80002338:	0104b503          	ld	a0,16(s1)
    8000233c:	fffff097          	auipc	ra,0xfffff
    80002340:	1b0080e7          	jalr	432(ra) # 800014ec <_Z10sem_signalP10KSemaphore>
}
    80002344:	01813083          	ld	ra,24(sp)
    80002348:	01013403          	ld	s0,16(sp)
    8000234c:	00813483          	ld	s1,8(sp)
    80002350:	00013903          	ld	s2,0(sp)
    80002354:	02010113          	addi	sp,sp,32
    80002358:	00008067          	ret

000000008000235c <_ZL8consumerPv>:

static void consumer(void *arg) {
    8000235c:	fd010113          	addi	sp,sp,-48
    80002360:	02113423          	sd	ra,40(sp)
    80002364:	02813023          	sd	s0,32(sp)
    80002368:	00913c23          	sd	s1,24(sp)
    8000236c:	01213823          	sd	s2,16(sp)
    80002370:	01313423          	sd	s3,8(sp)
    80002374:	03010413          	addi	s0,sp,48
    80002378:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000237c:	00000993          	li	s3,0
    80002380:	01c0006f          	j	8000239c <_ZL8consumerPv+0x40>
        i++;

        __putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80002384:	fffff097          	auipc	ra,0xfffff
    80002388:	068080e7          	jalr	104(ra) # 800013ec <_Z15thread_dispatchv>
    8000238c:	0500006f          	j	800023dc <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            __putc('\n');
    80002390:	00a00513          	li	a0,10
    80002394:	00006097          	auipc	ra,0x6
    80002398:	82c080e7          	jalr	-2004(ra) # 80007bc0 <__putc>
    while (!threadEnd) {
    8000239c:	00008797          	auipc	a5,0x8
    800023a0:	f947a783          	lw	a5,-108(a5) # 8000a330 <_ZL9threadEnd>
    800023a4:	06079063          	bnez	a5,80002404 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    800023a8:	00893503          	ld	a0,8(s2)
    800023ac:	00003097          	auipc	ra,0x3
    800023b0:	334080e7          	jalr	820(ra) # 800056e0 <_ZN6Buffer3getEv>
        i++;
    800023b4:	0019849b          	addiw	s1,s3,1
    800023b8:	0004899b          	sext.w	s3,s1
        __putc(key);
    800023bc:	0ff57513          	andi	a0,a0,255
    800023c0:	00006097          	auipc	ra,0x6
    800023c4:	800080e7          	jalr	-2048(ra) # 80007bc0 <__putc>
        if (i % (5 * data->id) == 0) {
    800023c8:	00092703          	lw	a4,0(s2)
    800023cc:	0027179b          	slliw	a5,a4,0x2
    800023d0:	00e787bb          	addw	a5,a5,a4
    800023d4:	02f4e7bb          	remw	a5,s1,a5
    800023d8:	fa0786e3          	beqz	a5,80002384 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    800023dc:	05000793          	li	a5,80
    800023e0:	02f4e4bb          	remw	s1,s1,a5
    800023e4:	fa049ce3          	bnez	s1,8000239c <_ZL8consumerPv+0x40>
    800023e8:	fa9ff06f          	j	80002390 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    800023ec:	00893503          	ld	a0,8(s2)
    800023f0:	00003097          	auipc	ra,0x3
    800023f4:	2f0080e7          	jalr	752(ra) # 800056e0 <_ZN6Buffer3getEv>
        __putc(key);
    800023f8:	0ff57513          	andi	a0,a0,255
    800023fc:	00005097          	auipc	ra,0x5
    80002400:	7c4080e7          	jalr	1988(ra) # 80007bc0 <__putc>
    while (data->buffer->getCnt() > 0) {
    80002404:	00893503          	ld	a0,8(s2)
    80002408:	00003097          	auipc	ra,0x3
    8000240c:	364080e7          	jalr	868(ra) # 8000576c <_ZN6Buffer6getCntEv>
    80002410:	fca04ee3          	bgtz	a0,800023ec <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80002414:	01093503          	ld	a0,16(s2)
    80002418:	fffff097          	auipc	ra,0xfffff
    8000241c:	0d4080e7          	jalr	212(ra) # 800014ec <_Z10sem_signalP10KSemaphore>
}
    80002420:	02813083          	ld	ra,40(sp)
    80002424:	02013403          	ld	s0,32(sp)
    80002428:	01813483          	ld	s1,24(sp)
    8000242c:	01013903          	ld	s2,16(sp)
    80002430:	00813983          	ld	s3,8(sp)
    80002434:	03010113          	addi	sp,sp,48
    80002438:	00008067          	ret

000000008000243c <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    8000243c:	f9010113          	addi	sp,sp,-112
    80002440:	06113423          	sd	ra,104(sp)
    80002444:	06813023          	sd	s0,96(sp)
    80002448:	04913c23          	sd	s1,88(sp)
    8000244c:	05213823          	sd	s2,80(sp)
    80002450:	05313423          	sd	s3,72(sp)
    80002454:	05413023          	sd	s4,64(sp)
    80002458:	03513c23          	sd	s5,56(sp)
    8000245c:	03613823          	sd	s6,48(sp)
    80002460:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80002464:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80002468:	00006517          	auipc	a0,0x6
    8000246c:	d0850513          	addi	a0,a0,-760 # 80008170 <CONSOLE_STATUS+0x160>
    80002470:	00002097          	auipc	ra,0x2
    80002474:	220080e7          	jalr	544(ra) # 80004690 <_Z11printStringPKc>
    getString(input, 30);
    80002478:	01e00593          	li	a1,30
    8000247c:	fa040493          	addi	s1,s0,-96
    80002480:	00048513          	mv	a0,s1
    80002484:	00002097          	auipc	ra,0x2
    80002488:	294080e7          	jalr	660(ra) # 80004718 <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000248c:	00048513          	mv	a0,s1
    80002490:	00002097          	auipc	ra,0x2
    80002494:	360080e7          	jalr	864(ra) # 800047f0 <_Z11stringToIntPKc>
    80002498:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    8000249c:	00006517          	auipc	a0,0x6
    800024a0:	cf450513          	addi	a0,a0,-780 # 80008190 <CONSOLE_STATUS+0x180>
    800024a4:	00002097          	auipc	ra,0x2
    800024a8:	1ec080e7          	jalr	492(ra) # 80004690 <_Z11printStringPKc>
    getString(input, 30);
    800024ac:	01e00593          	li	a1,30
    800024b0:	00048513          	mv	a0,s1
    800024b4:	00002097          	auipc	ra,0x2
    800024b8:	264080e7          	jalr	612(ra) # 80004718 <_Z9getStringPci>
    n = stringToInt(input);
    800024bc:	00048513          	mv	a0,s1
    800024c0:	00002097          	auipc	ra,0x2
    800024c4:	330080e7          	jalr	816(ra) # 800047f0 <_Z11stringToIntPKc>
    800024c8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800024cc:	00006517          	auipc	a0,0x6
    800024d0:	ce450513          	addi	a0,a0,-796 # 800081b0 <CONSOLE_STATUS+0x1a0>
    800024d4:	00002097          	auipc	ra,0x2
    800024d8:	1bc080e7          	jalr	444(ra) # 80004690 <_Z11printStringPKc>
    800024dc:	00000613          	li	a2,0
    800024e0:	00a00593          	li	a1,10
    800024e4:	00090513          	mv	a0,s2
    800024e8:	00002097          	auipc	ra,0x2
    800024ec:	358080e7          	jalr	856(ra) # 80004840 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    800024f0:	00006517          	auipc	a0,0x6
    800024f4:	cd850513          	addi	a0,a0,-808 # 800081c8 <CONSOLE_STATUS+0x1b8>
    800024f8:	00002097          	auipc	ra,0x2
    800024fc:	198080e7          	jalr	408(ra) # 80004690 <_Z11printStringPKc>
    80002500:	00000613          	li	a2,0
    80002504:	00a00593          	li	a1,10
    80002508:	00048513          	mv	a0,s1
    8000250c:	00002097          	auipc	ra,0x2
    80002510:	334080e7          	jalr	820(ra) # 80004840 <_Z8printIntiii>
    printString(".\n");
    80002514:	00006517          	auipc	a0,0x6
    80002518:	ccc50513          	addi	a0,a0,-820 # 800081e0 <CONSOLE_STATUS+0x1d0>
    8000251c:	00002097          	auipc	ra,0x2
    80002520:	174080e7          	jalr	372(ra) # 80004690 <_Z11printStringPKc>
    if(threadNum > n) {
    80002524:	0324c463          	blt	s1,s2,8000254c <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80002528:	03205c63          	blez	s2,80002560 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    8000252c:	03800513          	li	a0,56
    80002530:	fffff097          	auipc	ra,0xfffff
    80002534:	52c080e7          	jalr	1324(ra) # 80001a5c <_Znwm>
    80002538:	00050a13          	mv	s4,a0
    8000253c:	00048593          	mv	a1,s1
    80002540:	00003097          	auipc	ra,0x3
    80002544:	074080e7          	jalr	116(ra) # 800055b4 <_ZN6BufferC1Ei>
    80002548:	0300006f          	j	80002578 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000254c:	00006517          	auipc	a0,0x6
    80002550:	c9c50513          	addi	a0,a0,-868 # 800081e8 <CONSOLE_STATUS+0x1d8>
    80002554:	00002097          	auipc	ra,0x2
    80002558:	13c080e7          	jalr	316(ra) # 80004690 <_Z11printStringPKc>
        return;
    8000255c:	0140006f          	j	80002570 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80002560:	00006517          	auipc	a0,0x6
    80002564:	cc850513          	addi	a0,a0,-824 # 80008228 <CONSOLE_STATUS+0x218>
    80002568:	00002097          	auipc	ra,0x2
    8000256c:	128080e7          	jalr	296(ra) # 80004690 <_Z11printStringPKc>
        return;
    80002570:	000b0113          	mv	sp,s6
    80002574:	1500006f          	j	800026c4 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80002578:	00000593          	li	a1,0
    8000257c:	00008517          	auipc	a0,0x8
    80002580:	dbc50513          	addi	a0,a0,-580 # 8000a338 <_ZL10waitForAll>
    80002584:	fffff097          	auipc	ra,0xfffff
    80002588:	ea4080e7          	jalr	-348(ra) # 80001428 <_Z8sem_openPP10KSemaphorej>
    thread_t threads[threadNum];
    8000258c:	00391793          	slli	a5,s2,0x3
    80002590:	00f78793          	addi	a5,a5,15
    80002594:	ff07f793          	andi	a5,a5,-16
    80002598:	40f10133          	sub	sp,sp,a5
    8000259c:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    800025a0:	0019071b          	addiw	a4,s2,1
    800025a4:	00171793          	slli	a5,a4,0x1
    800025a8:	00e787b3          	add	a5,a5,a4
    800025ac:	00379793          	slli	a5,a5,0x3
    800025b0:	00f78793          	addi	a5,a5,15
    800025b4:	ff07f793          	andi	a5,a5,-16
    800025b8:	40f10133          	sub	sp,sp,a5
    800025bc:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    800025c0:	00191613          	slli	a2,s2,0x1
    800025c4:	012607b3          	add	a5,a2,s2
    800025c8:	00379793          	slli	a5,a5,0x3
    800025cc:	00f987b3          	add	a5,s3,a5
    800025d0:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800025d4:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    800025d8:	00008717          	auipc	a4,0x8
    800025dc:	d6073703          	ld	a4,-672(a4) # 8000a338 <_ZL10waitForAll>
    800025e0:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    800025e4:	00078613          	mv	a2,a5
    800025e8:	00000597          	auipc	a1,0x0
    800025ec:	d7458593          	addi	a1,a1,-652 # 8000235c <_ZL8consumerPv>
    800025f0:	f9840513          	addi	a0,s0,-104
    800025f4:	fffff097          	auipc	ra,0xfffff
    800025f8:	d38080e7          	jalr	-712(ra) # 8000132c <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800025fc:	00000493          	li	s1,0
    80002600:	0280006f          	j	80002628 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80002604:	00000597          	auipc	a1,0x0
    80002608:	c1458593          	addi	a1,a1,-1004 # 80002218 <_ZL16producerKeyboardPv>
                      data + i);
    8000260c:	00179613          	slli	a2,a5,0x1
    80002610:	00f60633          	add	a2,a2,a5
    80002614:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80002618:	00c98633          	add	a2,s3,a2
    8000261c:	fffff097          	auipc	ra,0xfffff
    80002620:	d10080e7          	jalr	-752(ra) # 8000132c <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80002624:	0014849b          	addiw	s1,s1,1
    80002628:	0524d263          	bge	s1,s2,8000266c <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    8000262c:	00149793          	slli	a5,s1,0x1
    80002630:	009787b3          	add	a5,a5,s1
    80002634:	00379793          	slli	a5,a5,0x3
    80002638:	00f987b3          	add	a5,s3,a5
    8000263c:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80002640:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80002644:	00008717          	auipc	a4,0x8
    80002648:	cf473703          	ld	a4,-780(a4) # 8000a338 <_ZL10waitForAll>
    8000264c:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80002650:	00048793          	mv	a5,s1
    80002654:	00349513          	slli	a0,s1,0x3
    80002658:	00aa8533          	add	a0,s5,a0
    8000265c:	fa9054e3          	blez	s1,80002604 <_Z22producerConsumer_C_APIv+0x1c8>
    80002660:	00000597          	auipc	a1,0x0
    80002664:	c6858593          	addi	a1,a1,-920 # 800022c8 <_ZL8producerPv>
    80002668:	fa5ff06f          	j	8000260c <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    8000266c:	fffff097          	auipc	ra,0xfffff
    80002670:	d80080e7          	jalr	-640(ra) # 800013ec <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80002674:	00000493          	li	s1,0
    80002678:	00994e63          	blt	s2,s1,80002694 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    8000267c:	00008517          	auipc	a0,0x8
    80002680:	cbc53503          	ld	a0,-836(a0) # 8000a338 <_ZL10waitForAll>
    80002684:	fffff097          	auipc	ra,0xfffff
    80002688:	e28080e7          	jalr	-472(ra) # 800014ac <_Z8sem_waitP10KSemaphore>
    for (int i = 0; i <= threadNum; i++) {
    8000268c:	0014849b          	addiw	s1,s1,1
    80002690:	fe9ff06f          	j	80002678 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80002694:	00008517          	auipc	a0,0x8
    80002698:	ca453503          	ld	a0,-860(a0) # 8000a338 <_ZL10waitForAll>
    8000269c:	fffff097          	auipc	ra,0xfffff
    800026a0:	dd0080e7          	jalr	-560(ra) # 8000146c <_Z9sem_closeP10KSemaphore>
    delete buffer;
    800026a4:	000a0e63          	beqz	s4,800026c0 <_Z22producerConsumer_C_APIv+0x284>
    800026a8:	000a0513          	mv	a0,s4
    800026ac:	00003097          	auipc	ra,0x3
    800026b0:	148080e7          	jalr	328(ra) # 800057f4 <_ZN6BufferD1Ev>
    800026b4:	000a0513          	mv	a0,s4
    800026b8:	fffff097          	auipc	ra,0xfffff
    800026bc:	3f4080e7          	jalr	1012(ra) # 80001aac <_ZdlPv>
    800026c0:	000b0113          	mv	sp,s6

}
    800026c4:	f9040113          	addi	sp,s0,-112
    800026c8:	06813083          	ld	ra,104(sp)
    800026cc:	06013403          	ld	s0,96(sp)
    800026d0:	05813483          	ld	s1,88(sp)
    800026d4:	05013903          	ld	s2,80(sp)
    800026d8:	04813983          	ld	s3,72(sp)
    800026dc:	04013a03          	ld	s4,64(sp)
    800026e0:	03813a83          	ld	s5,56(sp)
    800026e4:	03013b03          	ld	s6,48(sp)
    800026e8:	07010113          	addi	sp,sp,112
    800026ec:	00008067          	ret
    800026f0:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    800026f4:	000a0513          	mv	a0,s4
    800026f8:	fffff097          	auipc	ra,0xfffff
    800026fc:	3b4080e7          	jalr	948(ra) # 80001aac <_ZdlPv>
    80002700:	00048513          	mv	a0,s1
    80002704:	00009097          	auipc	ra,0x9
    80002708:	d44080e7          	jalr	-700(ra) # 8000b448 <_Unwind_Resume>

000000008000270c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    8000270c:	fe010113          	addi	sp,sp,-32
    80002710:	00113c23          	sd	ra,24(sp)
    80002714:	00813823          	sd	s0,16(sp)
    80002718:	00913423          	sd	s1,8(sp)
    8000271c:	01213023          	sd	s2,0(sp)
    80002720:	02010413          	addi	s0,sp,32
    80002724:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80002728:	00100793          	li	a5,1
    8000272c:	02a7f863          	bgeu	a5,a0,8000275c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80002730:	00a00793          	li	a5,10
    80002734:	02f577b3          	remu	a5,a0,a5
    80002738:	02078e63          	beqz	a5,80002774 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    8000273c:	fff48513          	addi	a0,s1,-1
    80002740:	00000097          	auipc	ra,0x0
    80002744:	fcc080e7          	jalr	-52(ra) # 8000270c <_ZL9fibonaccim>
    80002748:	00050913          	mv	s2,a0
    8000274c:	ffe48513          	addi	a0,s1,-2
    80002750:	00000097          	auipc	ra,0x0
    80002754:	fbc080e7          	jalr	-68(ra) # 8000270c <_ZL9fibonaccim>
    80002758:	00a90533          	add	a0,s2,a0
}
    8000275c:	01813083          	ld	ra,24(sp)
    80002760:	01013403          	ld	s0,16(sp)
    80002764:	00813483          	ld	s1,8(sp)
    80002768:	00013903          	ld	s2,0(sp)
    8000276c:	02010113          	addi	sp,sp,32
    80002770:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80002774:	fffff097          	auipc	ra,0xfffff
    80002778:	c78080e7          	jalr	-904(ra) # 800013ec <_Z15thread_dispatchv>
    8000277c:	fc1ff06f          	j	8000273c <_ZL9fibonaccim+0x30>

0000000080002780 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80002780:	fe010113          	addi	sp,sp,-32
    80002784:	00113c23          	sd	ra,24(sp)
    80002788:	00813823          	sd	s0,16(sp)
    8000278c:	00913423          	sd	s1,8(sp)
    80002790:	01213023          	sd	s2,0(sp)
    80002794:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80002798:	00000913          	li	s2,0
    8000279c:	0380006f          	j	800027d4 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800027a0:	fffff097          	auipc	ra,0xfffff
    800027a4:	c4c080e7          	jalr	-948(ra) # 800013ec <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800027a8:	00148493          	addi	s1,s1,1
    800027ac:	000027b7          	lui	a5,0x2
    800027b0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800027b4:	0097ee63          	bltu	a5,s1,800027d0 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800027b8:	00000713          	li	a4,0
    800027bc:	000077b7          	lui	a5,0x7
    800027c0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800027c4:	fce7eee3          	bltu	a5,a4,800027a0 <_ZN7WorkerA11workerBodyAEPv+0x20>
    800027c8:	00170713          	addi	a4,a4,1
    800027cc:	ff1ff06f          	j	800027bc <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800027d0:	00190913          	addi	s2,s2,1
    800027d4:	00900793          	li	a5,9
    800027d8:	0527e063          	bltu	a5,s2,80002818 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800027dc:	00006517          	auipc	a0,0x6
    800027e0:	a7c50513          	addi	a0,a0,-1412 # 80008258 <CONSOLE_STATUS+0x248>
    800027e4:	00002097          	auipc	ra,0x2
    800027e8:	eac080e7          	jalr	-340(ra) # 80004690 <_Z11printStringPKc>
    800027ec:	00000613          	li	a2,0
    800027f0:	00a00593          	li	a1,10
    800027f4:	0009051b          	sext.w	a0,s2
    800027f8:	00002097          	auipc	ra,0x2
    800027fc:	048080e7          	jalr	72(ra) # 80004840 <_Z8printIntiii>
    80002800:	00006517          	auipc	a0,0x6
    80002804:	cd850513          	addi	a0,a0,-808 # 800084d8 <CONSOLE_STATUS+0x4c8>
    80002808:	00002097          	auipc	ra,0x2
    8000280c:	e88080e7          	jalr	-376(ra) # 80004690 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80002810:	00000493          	li	s1,0
    80002814:	f99ff06f          	j	800027ac <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80002818:	00006517          	auipc	a0,0x6
    8000281c:	a4850513          	addi	a0,a0,-1464 # 80008260 <CONSOLE_STATUS+0x250>
    80002820:	00002097          	auipc	ra,0x2
    80002824:	e70080e7          	jalr	-400(ra) # 80004690 <_Z11printStringPKc>
    finishedA = true;
    80002828:	00100793          	li	a5,1
    8000282c:	00008717          	auipc	a4,0x8
    80002830:	b0f70a23          	sb	a5,-1260(a4) # 8000a340 <_ZL9finishedA>
}
    80002834:	01813083          	ld	ra,24(sp)
    80002838:	01013403          	ld	s0,16(sp)
    8000283c:	00813483          	ld	s1,8(sp)
    80002840:	00013903          	ld	s2,0(sp)
    80002844:	02010113          	addi	sp,sp,32
    80002848:	00008067          	ret

000000008000284c <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    8000284c:	fe010113          	addi	sp,sp,-32
    80002850:	00113c23          	sd	ra,24(sp)
    80002854:	00813823          	sd	s0,16(sp)
    80002858:	00913423          	sd	s1,8(sp)
    8000285c:	01213023          	sd	s2,0(sp)
    80002860:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80002864:	00000913          	li	s2,0
    80002868:	0380006f          	j	800028a0 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    8000286c:	fffff097          	auipc	ra,0xfffff
    80002870:	b80080e7          	jalr	-1152(ra) # 800013ec <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80002874:	00148493          	addi	s1,s1,1
    80002878:	000027b7          	lui	a5,0x2
    8000287c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80002880:	0097ee63          	bltu	a5,s1,8000289c <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80002884:	00000713          	li	a4,0
    80002888:	000077b7          	lui	a5,0x7
    8000288c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80002890:	fce7eee3          	bltu	a5,a4,8000286c <_ZN7WorkerB11workerBodyBEPv+0x20>
    80002894:	00170713          	addi	a4,a4,1
    80002898:	ff1ff06f          	j	80002888 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    8000289c:	00190913          	addi	s2,s2,1
    800028a0:	00f00793          	li	a5,15
    800028a4:	0527e063          	bltu	a5,s2,800028e4 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800028a8:	00006517          	auipc	a0,0x6
    800028ac:	9c850513          	addi	a0,a0,-1592 # 80008270 <CONSOLE_STATUS+0x260>
    800028b0:	00002097          	auipc	ra,0x2
    800028b4:	de0080e7          	jalr	-544(ra) # 80004690 <_Z11printStringPKc>
    800028b8:	00000613          	li	a2,0
    800028bc:	00a00593          	li	a1,10
    800028c0:	0009051b          	sext.w	a0,s2
    800028c4:	00002097          	auipc	ra,0x2
    800028c8:	f7c080e7          	jalr	-132(ra) # 80004840 <_Z8printIntiii>
    800028cc:	00006517          	auipc	a0,0x6
    800028d0:	c0c50513          	addi	a0,a0,-1012 # 800084d8 <CONSOLE_STATUS+0x4c8>
    800028d4:	00002097          	auipc	ra,0x2
    800028d8:	dbc080e7          	jalr	-580(ra) # 80004690 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800028dc:	00000493          	li	s1,0
    800028e0:	f99ff06f          	j	80002878 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    800028e4:	00006517          	auipc	a0,0x6
    800028e8:	99450513          	addi	a0,a0,-1644 # 80008278 <CONSOLE_STATUS+0x268>
    800028ec:	00002097          	auipc	ra,0x2
    800028f0:	da4080e7          	jalr	-604(ra) # 80004690 <_Z11printStringPKc>
    finishedB = true;
    800028f4:	00100793          	li	a5,1
    800028f8:	00008717          	auipc	a4,0x8
    800028fc:	a4f704a3          	sb	a5,-1463(a4) # 8000a341 <_ZL9finishedB>
    thread_dispatch();
    80002900:	fffff097          	auipc	ra,0xfffff
    80002904:	aec080e7          	jalr	-1300(ra) # 800013ec <_Z15thread_dispatchv>
}
    80002908:	01813083          	ld	ra,24(sp)
    8000290c:	01013403          	ld	s0,16(sp)
    80002910:	00813483          	ld	s1,8(sp)
    80002914:	00013903          	ld	s2,0(sp)
    80002918:	02010113          	addi	sp,sp,32
    8000291c:	00008067          	ret

0000000080002920 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80002920:	fe010113          	addi	sp,sp,-32
    80002924:	00113c23          	sd	ra,24(sp)
    80002928:	00813823          	sd	s0,16(sp)
    8000292c:	00913423          	sd	s1,8(sp)
    80002930:	01213023          	sd	s2,0(sp)
    80002934:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80002938:	00000493          	li	s1,0
    8000293c:	0400006f          	j	8000297c <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80002940:	00006517          	auipc	a0,0x6
    80002944:	94850513          	addi	a0,a0,-1720 # 80008288 <CONSOLE_STATUS+0x278>
    80002948:	00002097          	auipc	ra,0x2
    8000294c:	d48080e7          	jalr	-696(ra) # 80004690 <_Z11printStringPKc>
    80002950:	00000613          	li	a2,0
    80002954:	00a00593          	li	a1,10
    80002958:	00048513          	mv	a0,s1
    8000295c:	00002097          	auipc	ra,0x2
    80002960:	ee4080e7          	jalr	-284(ra) # 80004840 <_Z8printIntiii>
    80002964:	00006517          	auipc	a0,0x6
    80002968:	b7450513          	addi	a0,a0,-1164 # 800084d8 <CONSOLE_STATUS+0x4c8>
    8000296c:	00002097          	auipc	ra,0x2
    80002970:	d24080e7          	jalr	-732(ra) # 80004690 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80002974:	0014849b          	addiw	s1,s1,1
    80002978:	0ff4f493          	andi	s1,s1,255
    8000297c:	00200793          	li	a5,2
    80002980:	fc97f0e3          	bgeu	a5,s1,80002940 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80002984:	00006517          	auipc	a0,0x6
    80002988:	90c50513          	addi	a0,a0,-1780 # 80008290 <CONSOLE_STATUS+0x280>
    8000298c:	00002097          	auipc	ra,0x2
    80002990:	d04080e7          	jalr	-764(ra) # 80004690 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80002994:	00700313          	li	t1,7
    thread_dispatch();
    80002998:	fffff097          	auipc	ra,0xfffff
    8000299c:	a54080e7          	jalr	-1452(ra) # 800013ec <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800029a0:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    800029a4:	00006517          	auipc	a0,0x6
    800029a8:	8fc50513          	addi	a0,a0,-1796 # 800082a0 <CONSOLE_STATUS+0x290>
    800029ac:	00002097          	auipc	ra,0x2
    800029b0:	ce4080e7          	jalr	-796(ra) # 80004690 <_Z11printStringPKc>
    800029b4:	00000613          	li	a2,0
    800029b8:	00a00593          	li	a1,10
    800029bc:	0009051b          	sext.w	a0,s2
    800029c0:	00002097          	auipc	ra,0x2
    800029c4:	e80080e7          	jalr	-384(ra) # 80004840 <_Z8printIntiii>
    800029c8:	00006517          	auipc	a0,0x6
    800029cc:	b1050513          	addi	a0,a0,-1264 # 800084d8 <CONSOLE_STATUS+0x4c8>
    800029d0:	00002097          	auipc	ra,0x2
    800029d4:	cc0080e7          	jalr	-832(ra) # 80004690 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800029d8:	00c00513          	li	a0,12
    800029dc:	00000097          	auipc	ra,0x0
    800029e0:	d30080e7          	jalr	-720(ra) # 8000270c <_ZL9fibonaccim>
    800029e4:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800029e8:	00006517          	auipc	a0,0x6
    800029ec:	8c050513          	addi	a0,a0,-1856 # 800082a8 <CONSOLE_STATUS+0x298>
    800029f0:	00002097          	auipc	ra,0x2
    800029f4:	ca0080e7          	jalr	-864(ra) # 80004690 <_Z11printStringPKc>
    800029f8:	00000613          	li	a2,0
    800029fc:	00a00593          	li	a1,10
    80002a00:	0009051b          	sext.w	a0,s2
    80002a04:	00002097          	auipc	ra,0x2
    80002a08:	e3c080e7          	jalr	-452(ra) # 80004840 <_Z8printIntiii>
    80002a0c:	00006517          	auipc	a0,0x6
    80002a10:	acc50513          	addi	a0,a0,-1332 # 800084d8 <CONSOLE_STATUS+0x4c8>
    80002a14:	00002097          	auipc	ra,0x2
    80002a18:	c7c080e7          	jalr	-900(ra) # 80004690 <_Z11printStringPKc>
    80002a1c:	0400006f          	j	80002a5c <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80002a20:	00006517          	auipc	a0,0x6
    80002a24:	86850513          	addi	a0,a0,-1944 # 80008288 <CONSOLE_STATUS+0x278>
    80002a28:	00002097          	auipc	ra,0x2
    80002a2c:	c68080e7          	jalr	-920(ra) # 80004690 <_Z11printStringPKc>
    80002a30:	00000613          	li	a2,0
    80002a34:	00a00593          	li	a1,10
    80002a38:	00048513          	mv	a0,s1
    80002a3c:	00002097          	auipc	ra,0x2
    80002a40:	e04080e7          	jalr	-508(ra) # 80004840 <_Z8printIntiii>
    80002a44:	00006517          	auipc	a0,0x6
    80002a48:	a9450513          	addi	a0,a0,-1388 # 800084d8 <CONSOLE_STATUS+0x4c8>
    80002a4c:	00002097          	auipc	ra,0x2
    80002a50:	c44080e7          	jalr	-956(ra) # 80004690 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80002a54:	0014849b          	addiw	s1,s1,1
    80002a58:	0ff4f493          	andi	s1,s1,255
    80002a5c:	00500793          	li	a5,5
    80002a60:	fc97f0e3          	bgeu	a5,s1,80002a20 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80002a64:	00005517          	auipc	a0,0x5
    80002a68:	7fc50513          	addi	a0,a0,2044 # 80008260 <CONSOLE_STATUS+0x250>
    80002a6c:	00002097          	auipc	ra,0x2
    80002a70:	c24080e7          	jalr	-988(ra) # 80004690 <_Z11printStringPKc>
    finishedC = true;
    80002a74:	00100793          	li	a5,1
    80002a78:	00008717          	auipc	a4,0x8
    80002a7c:	8cf70523          	sb	a5,-1846(a4) # 8000a342 <_ZL9finishedC>
    thread_dispatch();
    80002a80:	fffff097          	auipc	ra,0xfffff
    80002a84:	96c080e7          	jalr	-1684(ra) # 800013ec <_Z15thread_dispatchv>
}
    80002a88:	01813083          	ld	ra,24(sp)
    80002a8c:	01013403          	ld	s0,16(sp)
    80002a90:	00813483          	ld	s1,8(sp)
    80002a94:	00013903          	ld	s2,0(sp)
    80002a98:	02010113          	addi	sp,sp,32
    80002a9c:	00008067          	ret

0000000080002aa0 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80002aa0:	fe010113          	addi	sp,sp,-32
    80002aa4:	00113c23          	sd	ra,24(sp)
    80002aa8:	00813823          	sd	s0,16(sp)
    80002aac:	00913423          	sd	s1,8(sp)
    80002ab0:	01213023          	sd	s2,0(sp)
    80002ab4:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80002ab8:	00a00493          	li	s1,10
    80002abc:	0400006f          	j	80002afc <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80002ac0:	00005517          	auipc	a0,0x5
    80002ac4:	7f850513          	addi	a0,a0,2040 # 800082b8 <CONSOLE_STATUS+0x2a8>
    80002ac8:	00002097          	auipc	ra,0x2
    80002acc:	bc8080e7          	jalr	-1080(ra) # 80004690 <_Z11printStringPKc>
    80002ad0:	00000613          	li	a2,0
    80002ad4:	00a00593          	li	a1,10
    80002ad8:	00048513          	mv	a0,s1
    80002adc:	00002097          	auipc	ra,0x2
    80002ae0:	d64080e7          	jalr	-668(ra) # 80004840 <_Z8printIntiii>
    80002ae4:	00006517          	auipc	a0,0x6
    80002ae8:	9f450513          	addi	a0,a0,-1548 # 800084d8 <CONSOLE_STATUS+0x4c8>
    80002aec:	00002097          	auipc	ra,0x2
    80002af0:	ba4080e7          	jalr	-1116(ra) # 80004690 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80002af4:	0014849b          	addiw	s1,s1,1
    80002af8:	0ff4f493          	andi	s1,s1,255
    80002afc:	00c00793          	li	a5,12
    80002b00:	fc97f0e3          	bgeu	a5,s1,80002ac0 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80002b04:	00005517          	auipc	a0,0x5
    80002b08:	7bc50513          	addi	a0,a0,1980 # 800082c0 <CONSOLE_STATUS+0x2b0>
    80002b0c:	00002097          	auipc	ra,0x2
    80002b10:	b84080e7          	jalr	-1148(ra) # 80004690 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80002b14:	00500313          	li	t1,5
    thread_dispatch();
    80002b18:	fffff097          	auipc	ra,0xfffff
    80002b1c:	8d4080e7          	jalr	-1836(ra) # 800013ec <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80002b20:	01000513          	li	a0,16
    80002b24:	00000097          	auipc	ra,0x0
    80002b28:	be8080e7          	jalr	-1048(ra) # 8000270c <_ZL9fibonaccim>
    80002b2c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80002b30:	00005517          	auipc	a0,0x5
    80002b34:	7a050513          	addi	a0,a0,1952 # 800082d0 <CONSOLE_STATUS+0x2c0>
    80002b38:	00002097          	auipc	ra,0x2
    80002b3c:	b58080e7          	jalr	-1192(ra) # 80004690 <_Z11printStringPKc>
    80002b40:	00000613          	li	a2,0
    80002b44:	00a00593          	li	a1,10
    80002b48:	0009051b          	sext.w	a0,s2
    80002b4c:	00002097          	auipc	ra,0x2
    80002b50:	cf4080e7          	jalr	-780(ra) # 80004840 <_Z8printIntiii>
    80002b54:	00006517          	auipc	a0,0x6
    80002b58:	98450513          	addi	a0,a0,-1660 # 800084d8 <CONSOLE_STATUS+0x4c8>
    80002b5c:	00002097          	auipc	ra,0x2
    80002b60:	b34080e7          	jalr	-1228(ra) # 80004690 <_Z11printStringPKc>
    80002b64:	0400006f          	j	80002ba4 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80002b68:	00005517          	auipc	a0,0x5
    80002b6c:	75050513          	addi	a0,a0,1872 # 800082b8 <CONSOLE_STATUS+0x2a8>
    80002b70:	00002097          	auipc	ra,0x2
    80002b74:	b20080e7          	jalr	-1248(ra) # 80004690 <_Z11printStringPKc>
    80002b78:	00000613          	li	a2,0
    80002b7c:	00a00593          	li	a1,10
    80002b80:	00048513          	mv	a0,s1
    80002b84:	00002097          	auipc	ra,0x2
    80002b88:	cbc080e7          	jalr	-836(ra) # 80004840 <_Z8printIntiii>
    80002b8c:	00006517          	auipc	a0,0x6
    80002b90:	94c50513          	addi	a0,a0,-1716 # 800084d8 <CONSOLE_STATUS+0x4c8>
    80002b94:	00002097          	auipc	ra,0x2
    80002b98:	afc080e7          	jalr	-1284(ra) # 80004690 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80002b9c:	0014849b          	addiw	s1,s1,1
    80002ba0:	0ff4f493          	andi	s1,s1,255
    80002ba4:	00f00793          	li	a5,15
    80002ba8:	fc97f0e3          	bgeu	a5,s1,80002b68 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80002bac:	00005517          	auipc	a0,0x5
    80002bb0:	73450513          	addi	a0,a0,1844 # 800082e0 <CONSOLE_STATUS+0x2d0>
    80002bb4:	00002097          	auipc	ra,0x2
    80002bb8:	adc080e7          	jalr	-1316(ra) # 80004690 <_Z11printStringPKc>
    finishedD = true;
    80002bbc:	00100793          	li	a5,1
    80002bc0:	00007717          	auipc	a4,0x7
    80002bc4:	78f701a3          	sb	a5,1923(a4) # 8000a343 <_ZL9finishedD>
    thread_dispatch();
    80002bc8:	fffff097          	auipc	ra,0xfffff
    80002bcc:	824080e7          	jalr	-2012(ra) # 800013ec <_Z15thread_dispatchv>
}
    80002bd0:	01813083          	ld	ra,24(sp)
    80002bd4:	01013403          	ld	s0,16(sp)
    80002bd8:	00813483          	ld	s1,8(sp)
    80002bdc:	00013903          	ld	s2,0(sp)
    80002be0:	02010113          	addi	sp,sp,32
    80002be4:	00008067          	ret

0000000080002be8 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80002be8:	fc010113          	addi	sp,sp,-64
    80002bec:	02113c23          	sd	ra,56(sp)
    80002bf0:	02813823          	sd	s0,48(sp)
    80002bf4:	02913423          	sd	s1,40(sp)
    80002bf8:	03213023          	sd	s2,32(sp)
    80002bfc:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80002c00:	02000513          	li	a0,32
    80002c04:	fffff097          	auipc	ra,0xfffff
    80002c08:	e58080e7          	jalr	-424(ra) # 80001a5c <_Znwm>
    80002c0c:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80002c10:	fffff097          	auipc	ra,0xfffff
    80002c14:	000080e7          	jalr	ra # 80001c10 <_ZN6ThreadC1Ev>
    80002c18:	00007797          	auipc	a5,0x7
    80002c1c:	4e878793          	addi	a5,a5,1256 # 8000a100 <_ZTV7WorkerA+0x10>
    80002c20:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80002c24:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80002c28:	00005517          	auipc	a0,0x5
    80002c2c:	6c850513          	addi	a0,a0,1736 # 800082f0 <CONSOLE_STATUS+0x2e0>
    80002c30:	00002097          	auipc	ra,0x2
    80002c34:	a60080e7          	jalr	-1440(ra) # 80004690 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80002c38:	02000513          	li	a0,32
    80002c3c:	fffff097          	auipc	ra,0xfffff
    80002c40:	e20080e7          	jalr	-480(ra) # 80001a5c <_Znwm>
    80002c44:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80002c48:	fffff097          	auipc	ra,0xfffff
    80002c4c:	fc8080e7          	jalr	-56(ra) # 80001c10 <_ZN6ThreadC1Ev>
    80002c50:	00007797          	auipc	a5,0x7
    80002c54:	4d878793          	addi	a5,a5,1240 # 8000a128 <_ZTV7WorkerB+0x10>
    80002c58:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80002c5c:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80002c60:	00005517          	auipc	a0,0x5
    80002c64:	6a850513          	addi	a0,a0,1704 # 80008308 <CONSOLE_STATUS+0x2f8>
    80002c68:	00002097          	auipc	ra,0x2
    80002c6c:	a28080e7          	jalr	-1496(ra) # 80004690 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80002c70:	02000513          	li	a0,32
    80002c74:	fffff097          	auipc	ra,0xfffff
    80002c78:	de8080e7          	jalr	-536(ra) # 80001a5c <_Znwm>
    80002c7c:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80002c80:	fffff097          	auipc	ra,0xfffff
    80002c84:	f90080e7          	jalr	-112(ra) # 80001c10 <_ZN6ThreadC1Ev>
    80002c88:	00007797          	auipc	a5,0x7
    80002c8c:	4c878793          	addi	a5,a5,1224 # 8000a150 <_ZTV7WorkerC+0x10>
    80002c90:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80002c94:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80002c98:	00005517          	auipc	a0,0x5
    80002c9c:	68850513          	addi	a0,a0,1672 # 80008320 <CONSOLE_STATUS+0x310>
    80002ca0:	00002097          	auipc	ra,0x2
    80002ca4:	9f0080e7          	jalr	-1552(ra) # 80004690 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80002ca8:	02000513          	li	a0,32
    80002cac:	fffff097          	auipc	ra,0xfffff
    80002cb0:	db0080e7          	jalr	-592(ra) # 80001a5c <_Znwm>
    80002cb4:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80002cb8:	fffff097          	auipc	ra,0xfffff
    80002cbc:	f58080e7          	jalr	-168(ra) # 80001c10 <_ZN6ThreadC1Ev>
    80002cc0:	00007797          	auipc	a5,0x7
    80002cc4:	4b878793          	addi	a5,a5,1208 # 8000a178 <_ZTV7WorkerD+0x10>
    80002cc8:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80002ccc:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80002cd0:	00005517          	auipc	a0,0x5
    80002cd4:	66850513          	addi	a0,a0,1640 # 80008338 <CONSOLE_STATUS+0x328>
    80002cd8:	00002097          	auipc	ra,0x2
    80002cdc:	9b8080e7          	jalr	-1608(ra) # 80004690 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80002ce0:	00000493          	li	s1,0
    80002ce4:	00300793          	li	a5,3
    80002ce8:	0297c663          	blt	a5,s1,80002d14 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80002cec:	00349793          	slli	a5,s1,0x3
    80002cf0:	fe040713          	addi	a4,s0,-32
    80002cf4:	00f707b3          	add	a5,a4,a5
    80002cf8:	fe07b503          	ld	a0,-32(a5)
    80002cfc:	fffff097          	auipc	ra,0xfffff
    80002d00:	f44080e7          	jalr	-188(ra) # 80001c40 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80002d04:	0014849b          	addiw	s1,s1,1
    80002d08:	fddff06f          	j	80002ce4 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80002d0c:	fffff097          	auipc	ra,0xfffff
    80002d10:	f88080e7          	jalr	-120(ra) # 80001c94 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80002d14:	00007797          	auipc	a5,0x7
    80002d18:	62c7c783          	lbu	a5,1580(a5) # 8000a340 <_ZL9finishedA>
    80002d1c:	fe0788e3          	beqz	a5,80002d0c <_Z20Threads_CPP_API_testv+0x124>
    80002d20:	00007797          	auipc	a5,0x7
    80002d24:	6217c783          	lbu	a5,1569(a5) # 8000a341 <_ZL9finishedB>
    80002d28:	fe0782e3          	beqz	a5,80002d0c <_Z20Threads_CPP_API_testv+0x124>
    80002d2c:	00007797          	auipc	a5,0x7
    80002d30:	6167c783          	lbu	a5,1558(a5) # 8000a342 <_ZL9finishedC>
    80002d34:	fc078ce3          	beqz	a5,80002d0c <_Z20Threads_CPP_API_testv+0x124>
    80002d38:	00007797          	auipc	a5,0x7
    80002d3c:	60b7c783          	lbu	a5,1547(a5) # 8000a343 <_ZL9finishedD>
    80002d40:	fc0786e3          	beqz	a5,80002d0c <_Z20Threads_CPP_API_testv+0x124>
    80002d44:	fc040493          	addi	s1,s0,-64
    80002d48:	0080006f          	j	80002d50 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80002d4c:	00848493          	addi	s1,s1,8
    80002d50:	fe040793          	addi	a5,s0,-32
    80002d54:	08f48663          	beq	s1,a5,80002de0 <_Z20Threads_CPP_API_testv+0x1f8>
    80002d58:	0004b503          	ld	a0,0(s1)
    80002d5c:	fe0508e3          	beqz	a0,80002d4c <_Z20Threads_CPP_API_testv+0x164>
    80002d60:	00053783          	ld	a5,0(a0)
    80002d64:	0087b783          	ld	a5,8(a5)
    80002d68:	000780e7          	jalr	a5
    80002d6c:	fe1ff06f          	j	80002d4c <_Z20Threads_CPP_API_testv+0x164>
    80002d70:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80002d74:	00048513          	mv	a0,s1
    80002d78:	fffff097          	auipc	ra,0xfffff
    80002d7c:	d34080e7          	jalr	-716(ra) # 80001aac <_ZdlPv>
    80002d80:	00090513          	mv	a0,s2
    80002d84:	00008097          	auipc	ra,0x8
    80002d88:	6c4080e7          	jalr	1732(ra) # 8000b448 <_Unwind_Resume>
    80002d8c:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80002d90:	00048513          	mv	a0,s1
    80002d94:	fffff097          	auipc	ra,0xfffff
    80002d98:	d18080e7          	jalr	-744(ra) # 80001aac <_ZdlPv>
    80002d9c:	00090513          	mv	a0,s2
    80002da0:	00008097          	auipc	ra,0x8
    80002da4:	6a8080e7          	jalr	1704(ra) # 8000b448 <_Unwind_Resume>
    80002da8:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80002dac:	00048513          	mv	a0,s1
    80002db0:	fffff097          	auipc	ra,0xfffff
    80002db4:	cfc080e7          	jalr	-772(ra) # 80001aac <_ZdlPv>
    80002db8:	00090513          	mv	a0,s2
    80002dbc:	00008097          	auipc	ra,0x8
    80002dc0:	68c080e7          	jalr	1676(ra) # 8000b448 <_Unwind_Resume>
    80002dc4:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80002dc8:	00048513          	mv	a0,s1
    80002dcc:	fffff097          	auipc	ra,0xfffff
    80002dd0:	ce0080e7          	jalr	-800(ra) # 80001aac <_ZdlPv>
    80002dd4:	00090513          	mv	a0,s2
    80002dd8:	00008097          	auipc	ra,0x8
    80002ddc:	670080e7          	jalr	1648(ra) # 8000b448 <_Unwind_Resume>
}
    80002de0:	03813083          	ld	ra,56(sp)
    80002de4:	03013403          	ld	s0,48(sp)
    80002de8:	02813483          	ld	s1,40(sp)
    80002dec:	02013903          	ld	s2,32(sp)
    80002df0:	04010113          	addi	sp,sp,64
    80002df4:	00008067          	ret

0000000080002df8 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80002df8:	ff010113          	addi	sp,sp,-16
    80002dfc:	00113423          	sd	ra,8(sp)
    80002e00:	00813023          	sd	s0,0(sp)
    80002e04:	01010413          	addi	s0,sp,16
    80002e08:	00007797          	auipc	a5,0x7
    80002e0c:	2f878793          	addi	a5,a5,760 # 8000a100 <_ZTV7WorkerA+0x10>
    80002e10:	00f53023          	sd	a5,0(a0)
    80002e14:	fffff097          	auipc	ra,0xfffff
    80002e18:	ce8080e7          	jalr	-792(ra) # 80001afc <_ZN6ThreadD1Ev>
    80002e1c:	00813083          	ld	ra,8(sp)
    80002e20:	00013403          	ld	s0,0(sp)
    80002e24:	01010113          	addi	sp,sp,16
    80002e28:	00008067          	ret

0000000080002e2c <_ZN7WorkerAD0Ev>:
    80002e2c:	fe010113          	addi	sp,sp,-32
    80002e30:	00113c23          	sd	ra,24(sp)
    80002e34:	00813823          	sd	s0,16(sp)
    80002e38:	00913423          	sd	s1,8(sp)
    80002e3c:	02010413          	addi	s0,sp,32
    80002e40:	00050493          	mv	s1,a0
    80002e44:	00007797          	auipc	a5,0x7
    80002e48:	2bc78793          	addi	a5,a5,700 # 8000a100 <_ZTV7WorkerA+0x10>
    80002e4c:	00f53023          	sd	a5,0(a0)
    80002e50:	fffff097          	auipc	ra,0xfffff
    80002e54:	cac080e7          	jalr	-852(ra) # 80001afc <_ZN6ThreadD1Ev>
    80002e58:	00048513          	mv	a0,s1
    80002e5c:	fffff097          	auipc	ra,0xfffff
    80002e60:	c50080e7          	jalr	-944(ra) # 80001aac <_ZdlPv>
    80002e64:	01813083          	ld	ra,24(sp)
    80002e68:	01013403          	ld	s0,16(sp)
    80002e6c:	00813483          	ld	s1,8(sp)
    80002e70:	02010113          	addi	sp,sp,32
    80002e74:	00008067          	ret

0000000080002e78 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80002e78:	ff010113          	addi	sp,sp,-16
    80002e7c:	00113423          	sd	ra,8(sp)
    80002e80:	00813023          	sd	s0,0(sp)
    80002e84:	01010413          	addi	s0,sp,16
    80002e88:	00007797          	auipc	a5,0x7
    80002e8c:	2a078793          	addi	a5,a5,672 # 8000a128 <_ZTV7WorkerB+0x10>
    80002e90:	00f53023          	sd	a5,0(a0)
    80002e94:	fffff097          	auipc	ra,0xfffff
    80002e98:	c68080e7          	jalr	-920(ra) # 80001afc <_ZN6ThreadD1Ev>
    80002e9c:	00813083          	ld	ra,8(sp)
    80002ea0:	00013403          	ld	s0,0(sp)
    80002ea4:	01010113          	addi	sp,sp,16
    80002ea8:	00008067          	ret

0000000080002eac <_ZN7WorkerBD0Ev>:
    80002eac:	fe010113          	addi	sp,sp,-32
    80002eb0:	00113c23          	sd	ra,24(sp)
    80002eb4:	00813823          	sd	s0,16(sp)
    80002eb8:	00913423          	sd	s1,8(sp)
    80002ebc:	02010413          	addi	s0,sp,32
    80002ec0:	00050493          	mv	s1,a0
    80002ec4:	00007797          	auipc	a5,0x7
    80002ec8:	26478793          	addi	a5,a5,612 # 8000a128 <_ZTV7WorkerB+0x10>
    80002ecc:	00f53023          	sd	a5,0(a0)
    80002ed0:	fffff097          	auipc	ra,0xfffff
    80002ed4:	c2c080e7          	jalr	-980(ra) # 80001afc <_ZN6ThreadD1Ev>
    80002ed8:	00048513          	mv	a0,s1
    80002edc:	fffff097          	auipc	ra,0xfffff
    80002ee0:	bd0080e7          	jalr	-1072(ra) # 80001aac <_ZdlPv>
    80002ee4:	01813083          	ld	ra,24(sp)
    80002ee8:	01013403          	ld	s0,16(sp)
    80002eec:	00813483          	ld	s1,8(sp)
    80002ef0:	02010113          	addi	sp,sp,32
    80002ef4:	00008067          	ret

0000000080002ef8 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80002ef8:	ff010113          	addi	sp,sp,-16
    80002efc:	00113423          	sd	ra,8(sp)
    80002f00:	00813023          	sd	s0,0(sp)
    80002f04:	01010413          	addi	s0,sp,16
    80002f08:	00007797          	auipc	a5,0x7
    80002f0c:	24878793          	addi	a5,a5,584 # 8000a150 <_ZTV7WorkerC+0x10>
    80002f10:	00f53023          	sd	a5,0(a0)
    80002f14:	fffff097          	auipc	ra,0xfffff
    80002f18:	be8080e7          	jalr	-1048(ra) # 80001afc <_ZN6ThreadD1Ev>
    80002f1c:	00813083          	ld	ra,8(sp)
    80002f20:	00013403          	ld	s0,0(sp)
    80002f24:	01010113          	addi	sp,sp,16
    80002f28:	00008067          	ret

0000000080002f2c <_ZN7WorkerCD0Ev>:
    80002f2c:	fe010113          	addi	sp,sp,-32
    80002f30:	00113c23          	sd	ra,24(sp)
    80002f34:	00813823          	sd	s0,16(sp)
    80002f38:	00913423          	sd	s1,8(sp)
    80002f3c:	02010413          	addi	s0,sp,32
    80002f40:	00050493          	mv	s1,a0
    80002f44:	00007797          	auipc	a5,0x7
    80002f48:	20c78793          	addi	a5,a5,524 # 8000a150 <_ZTV7WorkerC+0x10>
    80002f4c:	00f53023          	sd	a5,0(a0)
    80002f50:	fffff097          	auipc	ra,0xfffff
    80002f54:	bac080e7          	jalr	-1108(ra) # 80001afc <_ZN6ThreadD1Ev>
    80002f58:	00048513          	mv	a0,s1
    80002f5c:	fffff097          	auipc	ra,0xfffff
    80002f60:	b50080e7          	jalr	-1200(ra) # 80001aac <_ZdlPv>
    80002f64:	01813083          	ld	ra,24(sp)
    80002f68:	01013403          	ld	s0,16(sp)
    80002f6c:	00813483          	ld	s1,8(sp)
    80002f70:	02010113          	addi	sp,sp,32
    80002f74:	00008067          	ret

0000000080002f78 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80002f78:	ff010113          	addi	sp,sp,-16
    80002f7c:	00113423          	sd	ra,8(sp)
    80002f80:	00813023          	sd	s0,0(sp)
    80002f84:	01010413          	addi	s0,sp,16
    80002f88:	00007797          	auipc	a5,0x7
    80002f8c:	1f078793          	addi	a5,a5,496 # 8000a178 <_ZTV7WorkerD+0x10>
    80002f90:	00f53023          	sd	a5,0(a0)
    80002f94:	fffff097          	auipc	ra,0xfffff
    80002f98:	b68080e7          	jalr	-1176(ra) # 80001afc <_ZN6ThreadD1Ev>
    80002f9c:	00813083          	ld	ra,8(sp)
    80002fa0:	00013403          	ld	s0,0(sp)
    80002fa4:	01010113          	addi	sp,sp,16
    80002fa8:	00008067          	ret

0000000080002fac <_ZN7WorkerDD0Ev>:
    80002fac:	fe010113          	addi	sp,sp,-32
    80002fb0:	00113c23          	sd	ra,24(sp)
    80002fb4:	00813823          	sd	s0,16(sp)
    80002fb8:	00913423          	sd	s1,8(sp)
    80002fbc:	02010413          	addi	s0,sp,32
    80002fc0:	00050493          	mv	s1,a0
    80002fc4:	00007797          	auipc	a5,0x7
    80002fc8:	1b478793          	addi	a5,a5,436 # 8000a178 <_ZTV7WorkerD+0x10>
    80002fcc:	00f53023          	sd	a5,0(a0)
    80002fd0:	fffff097          	auipc	ra,0xfffff
    80002fd4:	b2c080e7          	jalr	-1236(ra) # 80001afc <_ZN6ThreadD1Ev>
    80002fd8:	00048513          	mv	a0,s1
    80002fdc:	fffff097          	auipc	ra,0xfffff
    80002fe0:	ad0080e7          	jalr	-1328(ra) # 80001aac <_ZdlPv>
    80002fe4:	01813083          	ld	ra,24(sp)
    80002fe8:	01013403          	ld	s0,16(sp)
    80002fec:	00813483          	ld	s1,8(sp)
    80002ff0:	02010113          	addi	sp,sp,32
    80002ff4:	00008067          	ret

0000000080002ff8 <_ZN7WorkerA3runEv>:
    void run() override {
    80002ff8:	ff010113          	addi	sp,sp,-16
    80002ffc:	00113423          	sd	ra,8(sp)
    80003000:	00813023          	sd	s0,0(sp)
    80003004:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80003008:	00000593          	li	a1,0
    8000300c:	fffff097          	auipc	ra,0xfffff
    80003010:	774080e7          	jalr	1908(ra) # 80002780 <_ZN7WorkerA11workerBodyAEPv>
    }
    80003014:	00813083          	ld	ra,8(sp)
    80003018:	00013403          	ld	s0,0(sp)
    8000301c:	01010113          	addi	sp,sp,16
    80003020:	00008067          	ret

0000000080003024 <_ZN7WorkerB3runEv>:
    void run() override {
    80003024:	ff010113          	addi	sp,sp,-16
    80003028:	00113423          	sd	ra,8(sp)
    8000302c:	00813023          	sd	s0,0(sp)
    80003030:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80003034:	00000593          	li	a1,0
    80003038:	00000097          	auipc	ra,0x0
    8000303c:	814080e7          	jalr	-2028(ra) # 8000284c <_ZN7WorkerB11workerBodyBEPv>
    }
    80003040:	00813083          	ld	ra,8(sp)
    80003044:	00013403          	ld	s0,0(sp)
    80003048:	01010113          	addi	sp,sp,16
    8000304c:	00008067          	ret

0000000080003050 <_ZN7WorkerC3runEv>:
    void run() override {
    80003050:	ff010113          	addi	sp,sp,-16
    80003054:	00113423          	sd	ra,8(sp)
    80003058:	00813023          	sd	s0,0(sp)
    8000305c:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80003060:	00000593          	li	a1,0
    80003064:	00000097          	auipc	ra,0x0
    80003068:	8bc080e7          	jalr	-1860(ra) # 80002920 <_ZN7WorkerC11workerBodyCEPv>
    }
    8000306c:	00813083          	ld	ra,8(sp)
    80003070:	00013403          	ld	s0,0(sp)
    80003074:	01010113          	addi	sp,sp,16
    80003078:	00008067          	ret

000000008000307c <_ZN7WorkerD3runEv>:
    void run() override {
    8000307c:	ff010113          	addi	sp,sp,-16
    80003080:	00113423          	sd	ra,8(sp)
    80003084:	00813023          	sd	s0,0(sp)
    80003088:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    8000308c:	00000593          	li	a1,0
    80003090:	00000097          	auipc	ra,0x0
    80003094:	a10080e7          	jalr	-1520(ra) # 80002aa0 <_ZN7WorkerD11workerBodyDEPv>
    }
    80003098:	00813083          	ld	ra,8(sp)
    8000309c:	00013403          	ld	s0,0(sp)
    800030a0:	01010113          	addi	sp,sp,16
    800030a4:	00008067          	ret

00000000800030a8 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    800030a8:	f8010113          	addi	sp,sp,-128
    800030ac:	06113c23          	sd	ra,120(sp)
    800030b0:	06813823          	sd	s0,112(sp)
    800030b4:	06913423          	sd	s1,104(sp)
    800030b8:	07213023          	sd	s2,96(sp)
    800030bc:	05313c23          	sd	s3,88(sp)
    800030c0:	05413823          	sd	s4,80(sp)
    800030c4:	05513423          	sd	s5,72(sp)
    800030c8:	05613023          	sd	s6,64(sp)
    800030cc:	03713c23          	sd	s7,56(sp)
    800030d0:	03813823          	sd	s8,48(sp)
    800030d4:	03913423          	sd	s9,40(sp)
    800030d8:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    800030dc:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    800030e0:	00005517          	auipc	a0,0x5
    800030e4:	09050513          	addi	a0,a0,144 # 80008170 <CONSOLE_STATUS+0x160>
    800030e8:	00001097          	auipc	ra,0x1
    800030ec:	5a8080e7          	jalr	1448(ra) # 80004690 <_Z11printStringPKc>
    getString(input, 30);
    800030f0:	01e00593          	li	a1,30
    800030f4:	f8040493          	addi	s1,s0,-128
    800030f8:	00048513          	mv	a0,s1
    800030fc:	00001097          	auipc	ra,0x1
    80003100:	61c080e7          	jalr	1564(ra) # 80004718 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003104:	00048513          	mv	a0,s1
    80003108:	00001097          	auipc	ra,0x1
    8000310c:	6e8080e7          	jalr	1768(ra) # 800047f0 <_Z11stringToIntPKc>
    80003110:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80003114:	00005517          	auipc	a0,0x5
    80003118:	07c50513          	addi	a0,a0,124 # 80008190 <CONSOLE_STATUS+0x180>
    8000311c:	00001097          	auipc	ra,0x1
    80003120:	574080e7          	jalr	1396(ra) # 80004690 <_Z11printStringPKc>
    getString(input, 30);
    80003124:	01e00593          	li	a1,30
    80003128:	00048513          	mv	a0,s1
    8000312c:	00001097          	auipc	ra,0x1
    80003130:	5ec080e7          	jalr	1516(ra) # 80004718 <_Z9getStringPci>
    n = stringToInt(input);
    80003134:	00048513          	mv	a0,s1
    80003138:	00001097          	auipc	ra,0x1
    8000313c:	6b8080e7          	jalr	1720(ra) # 800047f0 <_Z11stringToIntPKc>
    80003140:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80003144:	00005517          	auipc	a0,0x5
    80003148:	06c50513          	addi	a0,a0,108 # 800081b0 <CONSOLE_STATUS+0x1a0>
    8000314c:	00001097          	auipc	ra,0x1
    80003150:	544080e7          	jalr	1348(ra) # 80004690 <_Z11printStringPKc>
    printInt(threadNum);
    80003154:	00000613          	li	a2,0
    80003158:	00a00593          	li	a1,10
    8000315c:	00098513          	mv	a0,s3
    80003160:	00001097          	auipc	ra,0x1
    80003164:	6e0080e7          	jalr	1760(ra) # 80004840 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80003168:	00005517          	auipc	a0,0x5
    8000316c:	06050513          	addi	a0,a0,96 # 800081c8 <CONSOLE_STATUS+0x1b8>
    80003170:	00001097          	auipc	ra,0x1
    80003174:	520080e7          	jalr	1312(ra) # 80004690 <_Z11printStringPKc>
    printInt(n);
    80003178:	00000613          	li	a2,0
    8000317c:	00a00593          	li	a1,10
    80003180:	00048513          	mv	a0,s1
    80003184:	00001097          	auipc	ra,0x1
    80003188:	6bc080e7          	jalr	1724(ra) # 80004840 <_Z8printIntiii>
    printString(".\n");
    8000318c:	00005517          	auipc	a0,0x5
    80003190:	05450513          	addi	a0,a0,84 # 800081e0 <CONSOLE_STATUS+0x1d0>
    80003194:	00001097          	auipc	ra,0x1
    80003198:	4fc080e7          	jalr	1276(ra) # 80004690 <_Z11printStringPKc>
    if (threadNum > n) {
    8000319c:	0334c463          	blt	s1,s3,800031c4 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    800031a0:	03305c63          	blez	s3,800031d8 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800031a4:	03800513          	li	a0,56
    800031a8:	fffff097          	auipc	ra,0xfffff
    800031ac:	8b4080e7          	jalr	-1868(ra) # 80001a5c <_Znwm>
    800031b0:	00050a93          	mv	s5,a0
    800031b4:	00048593          	mv	a1,s1
    800031b8:	00001097          	auipc	ra,0x1
    800031bc:	7a8080e7          	jalr	1960(ra) # 80004960 <_ZN9BufferCPPC1Ei>
    800031c0:	0300006f          	j	800031f0 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800031c4:	00005517          	auipc	a0,0x5
    800031c8:	02450513          	addi	a0,a0,36 # 800081e8 <CONSOLE_STATUS+0x1d8>
    800031cc:	00001097          	auipc	ra,0x1
    800031d0:	4c4080e7          	jalr	1220(ra) # 80004690 <_Z11printStringPKc>
        return;
    800031d4:	0140006f          	j	800031e8 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800031d8:	00005517          	auipc	a0,0x5
    800031dc:	05050513          	addi	a0,a0,80 # 80008228 <CONSOLE_STATUS+0x218>
    800031e0:	00001097          	auipc	ra,0x1
    800031e4:	4b0080e7          	jalr	1200(ra) # 80004690 <_Z11printStringPKc>
        return;
    800031e8:	000c0113          	mv	sp,s8
    800031ec:	2140006f          	j	80003400 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    800031f0:	01000513          	li	a0,16
    800031f4:	fffff097          	auipc	ra,0xfffff
    800031f8:	868080e7          	jalr	-1944(ra) # 80001a5c <_Znwm>
    800031fc:	00050913          	mv	s2,a0
    80003200:	00000593          	li	a1,0
    80003204:	fffff097          	auipc	ra,0xfffff
    80003208:	ab8080e7          	jalr	-1352(ra) # 80001cbc <_ZN9SemaphoreC1Ej>
    8000320c:	00007797          	auipc	a5,0x7
    80003210:	1527b223          	sd	s2,324(a5) # 8000a350 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80003214:	00399793          	slli	a5,s3,0x3
    80003218:	00f78793          	addi	a5,a5,15
    8000321c:	ff07f793          	andi	a5,a5,-16
    80003220:	40f10133          	sub	sp,sp,a5
    80003224:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80003228:	0019871b          	addiw	a4,s3,1
    8000322c:	00171793          	slli	a5,a4,0x1
    80003230:	00e787b3          	add	a5,a5,a4
    80003234:	00379793          	slli	a5,a5,0x3
    80003238:	00f78793          	addi	a5,a5,15
    8000323c:	ff07f793          	andi	a5,a5,-16
    80003240:	40f10133          	sub	sp,sp,a5
    80003244:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80003248:	00199493          	slli	s1,s3,0x1
    8000324c:	013484b3          	add	s1,s1,s3
    80003250:	00349493          	slli	s1,s1,0x3
    80003254:	009b04b3          	add	s1,s6,s1
    80003258:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    8000325c:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80003260:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80003264:	02800513          	li	a0,40
    80003268:	ffffe097          	auipc	ra,0xffffe
    8000326c:	7f4080e7          	jalr	2036(ra) # 80001a5c <_Znwm>
    80003270:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80003274:	fffff097          	auipc	ra,0xfffff
    80003278:	99c080e7          	jalr	-1636(ra) # 80001c10 <_ZN6ThreadC1Ev>
    8000327c:	00007797          	auipc	a5,0x7
    80003280:	f7478793          	addi	a5,a5,-140 # 8000a1f0 <_ZTV8Consumer+0x10>
    80003284:	00fbb023          	sd	a5,0(s7)
    80003288:	029bb023          	sd	s1,32(s7)
    consumer->start();
    8000328c:	000b8513          	mv	a0,s7
    80003290:	fffff097          	auipc	ra,0xfffff
    80003294:	9b0080e7          	jalr	-1616(ra) # 80001c40 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80003298:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    8000329c:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    800032a0:	00007797          	auipc	a5,0x7
    800032a4:	0b07b783          	ld	a5,176(a5) # 8000a350 <_ZL10waitForAll>
    800032a8:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800032ac:	02800513          	li	a0,40
    800032b0:	ffffe097          	auipc	ra,0xffffe
    800032b4:	7ac080e7          	jalr	1964(ra) # 80001a5c <_Znwm>
    800032b8:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    800032bc:	fffff097          	auipc	ra,0xfffff
    800032c0:	954080e7          	jalr	-1708(ra) # 80001c10 <_ZN6ThreadC1Ev>
    800032c4:	00007797          	auipc	a5,0x7
    800032c8:	edc78793          	addi	a5,a5,-292 # 8000a1a0 <_ZTV16ProducerKeyborad+0x10>
    800032cc:	00f4b023          	sd	a5,0(s1)
    800032d0:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800032d4:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    800032d8:	00048513          	mv	a0,s1
    800032dc:	fffff097          	auipc	ra,0xfffff
    800032e0:	964080e7          	jalr	-1692(ra) # 80001c40 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800032e4:	00100913          	li	s2,1
    800032e8:	0300006f          	j	80003318 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800032ec:	00007797          	auipc	a5,0x7
    800032f0:	edc78793          	addi	a5,a5,-292 # 8000a1c8 <_ZTV8Producer+0x10>
    800032f4:	00fcb023          	sd	a5,0(s9)
    800032f8:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    800032fc:	00391793          	slli	a5,s2,0x3
    80003300:	00fa07b3          	add	a5,s4,a5
    80003304:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80003308:	000c8513          	mv	a0,s9
    8000330c:	fffff097          	auipc	ra,0xfffff
    80003310:	934080e7          	jalr	-1740(ra) # 80001c40 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80003314:	0019091b          	addiw	s2,s2,1
    80003318:	05395263          	bge	s2,s3,8000335c <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    8000331c:	00191493          	slli	s1,s2,0x1
    80003320:	012484b3          	add	s1,s1,s2
    80003324:	00349493          	slli	s1,s1,0x3
    80003328:	009b04b3          	add	s1,s6,s1
    8000332c:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80003330:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80003334:	00007797          	auipc	a5,0x7
    80003338:	01c7b783          	ld	a5,28(a5) # 8000a350 <_ZL10waitForAll>
    8000333c:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80003340:	02800513          	li	a0,40
    80003344:	ffffe097          	auipc	ra,0xffffe
    80003348:	718080e7          	jalr	1816(ra) # 80001a5c <_Znwm>
    8000334c:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80003350:	fffff097          	auipc	ra,0xfffff
    80003354:	8c0080e7          	jalr	-1856(ra) # 80001c10 <_ZN6ThreadC1Ev>
    80003358:	f95ff06f          	j	800032ec <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    8000335c:	fffff097          	auipc	ra,0xfffff
    80003360:	938080e7          	jalr	-1736(ra) # 80001c94 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80003364:	00000493          	li	s1,0
    80003368:	0099ce63          	blt	s3,s1,80003384 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    8000336c:	00007517          	auipc	a0,0x7
    80003370:	fe453503          	ld	a0,-28(a0) # 8000a350 <_ZL10waitForAll>
    80003374:	fffff097          	auipc	ra,0xfffff
    80003378:	980080e7          	jalr	-1664(ra) # 80001cf4 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    8000337c:	0014849b          	addiw	s1,s1,1
    80003380:	fe9ff06f          	j	80003368 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80003384:	00007517          	auipc	a0,0x7
    80003388:	fcc53503          	ld	a0,-52(a0) # 8000a350 <_ZL10waitForAll>
    8000338c:	00050863          	beqz	a0,8000339c <_Z20testConsumerProducerv+0x2f4>
    80003390:	00053783          	ld	a5,0(a0)
    80003394:	0087b783          	ld	a5,8(a5)
    80003398:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    8000339c:	00000493          	li	s1,0
    800033a0:	0080006f          	j	800033a8 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    800033a4:	0014849b          	addiw	s1,s1,1
    800033a8:	0334d263          	bge	s1,s3,800033cc <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    800033ac:	00349793          	slli	a5,s1,0x3
    800033b0:	00fa07b3          	add	a5,s4,a5
    800033b4:	0007b503          	ld	a0,0(a5)
    800033b8:	fe0506e3          	beqz	a0,800033a4 <_Z20testConsumerProducerv+0x2fc>
    800033bc:	00053783          	ld	a5,0(a0)
    800033c0:	0087b783          	ld	a5,8(a5)
    800033c4:	000780e7          	jalr	a5
    800033c8:	fddff06f          	j	800033a4 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    800033cc:	000b8a63          	beqz	s7,800033e0 <_Z20testConsumerProducerv+0x338>
    800033d0:	000bb783          	ld	a5,0(s7)
    800033d4:	0087b783          	ld	a5,8(a5)
    800033d8:	000b8513          	mv	a0,s7
    800033dc:	000780e7          	jalr	a5
    delete buffer;
    800033e0:	000a8e63          	beqz	s5,800033fc <_Z20testConsumerProducerv+0x354>
    800033e4:	000a8513          	mv	a0,s5
    800033e8:	00002097          	auipc	ra,0x2
    800033ec:	870080e7          	jalr	-1936(ra) # 80004c58 <_ZN9BufferCPPD1Ev>
    800033f0:	000a8513          	mv	a0,s5
    800033f4:	ffffe097          	auipc	ra,0xffffe
    800033f8:	6b8080e7          	jalr	1720(ra) # 80001aac <_ZdlPv>
    800033fc:	000c0113          	mv	sp,s8
}
    80003400:	f8040113          	addi	sp,s0,-128
    80003404:	07813083          	ld	ra,120(sp)
    80003408:	07013403          	ld	s0,112(sp)
    8000340c:	06813483          	ld	s1,104(sp)
    80003410:	06013903          	ld	s2,96(sp)
    80003414:	05813983          	ld	s3,88(sp)
    80003418:	05013a03          	ld	s4,80(sp)
    8000341c:	04813a83          	ld	s5,72(sp)
    80003420:	04013b03          	ld	s6,64(sp)
    80003424:	03813b83          	ld	s7,56(sp)
    80003428:	03013c03          	ld	s8,48(sp)
    8000342c:	02813c83          	ld	s9,40(sp)
    80003430:	08010113          	addi	sp,sp,128
    80003434:	00008067          	ret
    80003438:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    8000343c:	000a8513          	mv	a0,s5
    80003440:	ffffe097          	auipc	ra,0xffffe
    80003444:	66c080e7          	jalr	1644(ra) # 80001aac <_ZdlPv>
    80003448:	00048513          	mv	a0,s1
    8000344c:	00008097          	auipc	ra,0x8
    80003450:	ffc080e7          	jalr	-4(ra) # 8000b448 <_Unwind_Resume>
    80003454:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80003458:	00090513          	mv	a0,s2
    8000345c:	ffffe097          	auipc	ra,0xffffe
    80003460:	650080e7          	jalr	1616(ra) # 80001aac <_ZdlPv>
    80003464:	00048513          	mv	a0,s1
    80003468:	00008097          	auipc	ra,0x8
    8000346c:	fe0080e7          	jalr	-32(ra) # 8000b448 <_Unwind_Resume>
    80003470:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80003474:	000b8513          	mv	a0,s7
    80003478:	ffffe097          	auipc	ra,0xffffe
    8000347c:	634080e7          	jalr	1588(ra) # 80001aac <_ZdlPv>
    80003480:	00048513          	mv	a0,s1
    80003484:	00008097          	auipc	ra,0x8
    80003488:	fc4080e7          	jalr	-60(ra) # 8000b448 <_Unwind_Resume>
    8000348c:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80003490:	00048513          	mv	a0,s1
    80003494:	ffffe097          	auipc	ra,0xffffe
    80003498:	618080e7          	jalr	1560(ra) # 80001aac <_ZdlPv>
    8000349c:	00090513          	mv	a0,s2
    800034a0:	00008097          	auipc	ra,0x8
    800034a4:	fa8080e7          	jalr	-88(ra) # 8000b448 <_Unwind_Resume>
    800034a8:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    800034ac:	000c8513          	mv	a0,s9
    800034b0:	ffffe097          	auipc	ra,0xffffe
    800034b4:	5fc080e7          	jalr	1532(ra) # 80001aac <_ZdlPv>
    800034b8:	00048513          	mv	a0,s1
    800034bc:	00008097          	auipc	ra,0x8
    800034c0:	f8c080e7          	jalr	-116(ra) # 8000b448 <_Unwind_Resume>

00000000800034c4 <_ZN8Consumer3runEv>:
    void run() override {
    800034c4:	fd010113          	addi	sp,sp,-48
    800034c8:	02113423          	sd	ra,40(sp)
    800034cc:	02813023          	sd	s0,32(sp)
    800034d0:	00913c23          	sd	s1,24(sp)
    800034d4:	01213823          	sd	s2,16(sp)
    800034d8:	01313423          	sd	s3,8(sp)
    800034dc:	03010413          	addi	s0,sp,48
    800034e0:	00050913          	mv	s2,a0
        int i = 0;
    800034e4:	00000993          	li	s3,0
    800034e8:	0100006f          	j	800034f8 <_ZN8Consumer3runEv+0x34>
                __putc('\n');
    800034ec:	00a00513          	li	a0,10
    800034f0:	00004097          	auipc	ra,0x4
    800034f4:	6d0080e7          	jalr	1744(ra) # 80007bc0 <__putc>
        while (!threadEnd) {
    800034f8:	00007797          	auipc	a5,0x7
    800034fc:	e507a783          	lw	a5,-432(a5) # 8000a348 <_ZL9threadEnd>
    80003500:	04079a63          	bnez	a5,80003554 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80003504:	02093783          	ld	a5,32(s2)
    80003508:	0087b503          	ld	a0,8(a5)
    8000350c:	00001097          	auipc	ra,0x1
    80003510:	638080e7          	jalr	1592(ra) # 80004b44 <_ZN9BufferCPP3getEv>
            i++;
    80003514:	0019849b          	addiw	s1,s3,1
    80003518:	0004899b          	sext.w	s3,s1
            __putc(key);
    8000351c:	0ff57513          	andi	a0,a0,255
    80003520:	00004097          	auipc	ra,0x4
    80003524:	6a0080e7          	jalr	1696(ra) # 80007bc0 <__putc>
            if (i % 80 == 0) {
    80003528:	05000793          	li	a5,80
    8000352c:	02f4e4bb          	remw	s1,s1,a5
    80003530:	fc0494e3          	bnez	s1,800034f8 <_ZN8Consumer3runEv+0x34>
    80003534:	fb9ff06f          	j	800034ec <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80003538:	02093783          	ld	a5,32(s2)
    8000353c:	0087b503          	ld	a0,8(a5)
    80003540:	00001097          	auipc	ra,0x1
    80003544:	604080e7          	jalr	1540(ra) # 80004b44 <_ZN9BufferCPP3getEv>
            __putc(key);
    80003548:	0ff57513          	andi	a0,a0,255
    8000354c:	00004097          	auipc	ra,0x4
    80003550:	674080e7          	jalr	1652(ra) # 80007bc0 <__putc>
        while (td->buffer->getCnt() > 0) {
    80003554:	02093783          	ld	a5,32(s2)
    80003558:	0087b503          	ld	a0,8(a5)
    8000355c:	00001097          	auipc	ra,0x1
    80003560:	674080e7          	jalr	1652(ra) # 80004bd0 <_ZN9BufferCPP6getCntEv>
    80003564:	fca04ae3          	bgtz	a0,80003538 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80003568:	02093783          	ld	a5,32(s2)
    8000356c:	0107b503          	ld	a0,16(a5)
    80003570:	ffffe097          	auipc	ra,0xffffe
    80003574:	7b0080e7          	jalr	1968(ra) # 80001d20 <_ZN9Semaphore6signalEv>
    }
    80003578:	02813083          	ld	ra,40(sp)
    8000357c:	02013403          	ld	s0,32(sp)
    80003580:	01813483          	ld	s1,24(sp)
    80003584:	01013903          	ld	s2,16(sp)
    80003588:	00813983          	ld	s3,8(sp)
    8000358c:	03010113          	addi	sp,sp,48
    80003590:	00008067          	ret

0000000080003594 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80003594:	ff010113          	addi	sp,sp,-16
    80003598:	00113423          	sd	ra,8(sp)
    8000359c:	00813023          	sd	s0,0(sp)
    800035a0:	01010413          	addi	s0,sp,16
    800035a4:	00007797          	auipc	a5,0x7
    800035a8:	c4c78793          	addi	a5,a5,-948 # 8000a1f0 <_ZTV8Consumer+0x10>
    800035ac:	00f53023          	sd	a5,0(a0)
    800035b0:	ffffe097          	auipc	ra,0xffffe
    800035b4:	54c080e7          	jalr	1356(ra) # 80001afc <_ZN6ThreadD1Ev>
    800035b8:	00813083          	ld	ra,8(sp)
    800035bc:	00013403          	ld	s0,0(sp)
    800035c0:	01010113          	addi	sp,sp,16
    800035c4:	00008067          	ret

00000000800035c8 <_ZN8ConsumerD0Ev>:
    800035c8:	fe010113          	addi	sp,sp,-32
    800035cc:	00113c23          	sd	ra,24(sp)
    800035d0:	00813823          	sd	s0,16(sp)
    800035d4:	00913423          	sd	s1,8(sp)
    800035d8:	02010413          	addi	s0,sp,32
    800035dc:	00050493          	mv	s1,a0
    800035e0:	00007797          	auipc	a5,0x7
    800035e4:	c1078793          	addi	a5,a5,-1008 # 8000a1f0 <_ZTV8Consumer+0x10>
    800035e8:	00f53023          	sd	a5,0(a0)
    800035ec:	ffffe097          	auipc	ra,0xffffe
    800035f0:	510080e7          	jalr	1296(ra) # 80001afc <_ZN6ThreadD1Ev>
    800035f4:	00048513          	mv	a0,s1
    800035f8:	ffffe097          	auipc	ra,0xffffe
    800035fc:	4b4080e7          	jalr	1204(ra) # 80001aac <_ZdlPv>
    80003600:	01813083          	ld	ra,24(sp)
    80003604:	01013403          	ld	s0,16(sp)
    80003608:	00813483          	ld	s1,8(sp)
    8000360c:	02010113          	addi	sp,sp,32
    80003610:	00008067          	ret

0000000080003614 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80003614:	ff010113          	addi	sp,sp,-16
    80003618:	00113423          	sd	ra,8(sp)
    8000361c:	00813023          	sd	s0,0(sp)
    80003620:	01010413          	addi	s0,sp,16
    80003624:	00007797          	auipc	a5,0x7
    80003628:	b7c78793          	addi	a5,a5,-1156 # 8000a1a0 <_ZTV16ProducerKeyborad+0x10>
    8000362c:	00f53023          	sd	a5,0(a0)
    80003630:	ffffe097          	auipc	ra,0xffffe
    80003634:	4cc080e7          	jalr	1228(ra) # 80001afc <_ZN6ThreadD1Ev>
    80003638:	00813083          	ld	ra,8(sp)
    8000363c:	00013403          	ld	s0,0(sp)
    80003640:	01010113          	addi	sp,sp,16
    80003644:	00008067          	ret

0000000080003648 <_ZN16ProducerKeyboradD0Ev>:
    80003648:	fe010113          	addi	sp,sp,-32
    8000364c:	00113c23          	sd	ra,24(sp)
    80003650:	00813823          	sd	s0,16(sp)
    80003654:	00913423          	sd	s1,8(sp)
    80003658:	02010413          	addi	s0,sp,32
    8000365c:	00050493          	mv	s1,a0
    80003660:	00007797          	auipc	a5,0x7
    80003664:	b4078793          	addi	a5,a5,-1216 # 8000a1a0 <_ZTV16ProducerKeyborad+0x10>
    80003668:	00f53023          	sd	a5,0(a0)
    8000366c:	ffffe097          	auipc	ra,0xffffe
    80003670:	490080e7          	jalr	1168(ra) # 80001afc <_ZN6ThreadD1Ev>
    80003674:	00048513          	mv	a0,s1
    80003678:	ffffe097          	auipc	ra,0xffffe
    8000367c:	434080e7          	jalr	1076(ra) # 80001aac <_ZdlPv>
    80003680:	01813083          	ld	ra,24(sp)
    80003684:	01013403          	ld	s0,16(sp)
    80003688:	00813483          	ld	s1,8(sp)
    8000368c:	02010113          	addi	sp,sp,32
    80003690:	00008067          	ret

0000000080003694 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80003694:	ff010113          	addi	sp,sp,-16
    80003698:	00113423          	sd	ra,8(sp)
    8000369c:	00813023          	sd	s0,0(sp)
    800036a0:	01010413          	addi	s0,sp,16
    800036a4:	00007797          	auipc	a5,0x7
    800036a8:	b2478793          	addi	a5,a5,-1244 # 8000a1c8 <_ZTV8Producer+0x10>
    800036ac:	00f53023          	sd	a5,0(a0)
    800036b0:	ffffe097          	auipc	ra,0xffffe
    800036b4:	44c080e7          	jalr	1100(ra) # 80001afc <_ZN6ThreadD1Ev>
    800036b8:	00813083          	ld	ra,8(sp)
    800036bc:	00013403          	ld	s0,0(sp)
    800036c0:	01010113          	addi	sp,sp,16
    800036c4:	00008067          	ret

00000000800036c8 <_ZN8ProducerD0Ev>:
    800036c8:	fe010113          	addi	sp,sp,-32
    800036cc:	00113c23          	sd	ra,24(sp)
    800036d0:	00813823          	sd	s0,16(sp)
    800036d4:	00913423          	sd	s1,8(sp)
    800036d8:	02010413          	addi	s0,sp,32
    800036dc:	00050493          	mv	s1,a0
    800036e0:	00007797          	auipc	a5,0x7
    800036e4:	ae878793          	addi	a5,a5,-1304 # 8000a1c8 <_ZTV8Producer+0x10>
    800036e8:	00f53023          	sd	a5,0(a0)
    800036ec:	ffffe097          	auipc	ra,0xffffe
    800036f0:	410080e7          	jalr	1040(ra) # 80001afc <_ZN6ThreadD1Ev>
    800036f4:	00048513          	mv	a0,s1
    800036f8:	ffffe097          	auipc	ra,0xffffe
    800036fc:	3b4080e7          	jalr	948(ra) # 80001aac <_ZdlPv>
    80003700:	01813083          	ld	ra,24(sp)
    80003704:	01013403          	ld	s0,16(sp)
    80003708:	00813483          	ld	s1,8(sp)
    8000370c:	02010113          	addi	sp,sp,32
    80003710:	00008067          	ret

0000000080003714 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80003714:	fe010113          	addi	sp,sp,-32
    80003718:	00113c23          	sd	ra,24(sp)
    8000371c:	00813823          	sd	s0,16(sp)
    80003720:	00913423          	sd	s1,8(sp)
    80003724:	02010413          	addi	s0,sp,32
    80003728:	00050493          	mv	s1,a0
        while ((key = __getc()) != 0x1b) {
    8000372c:	00004097          	auipc	ra,0x4
    80003730:	4d0080e7          	jalr	1232(ra) # 80007bfc <__getc>
    80003734:	0005059b          	sext.w	a1,a0
    80003738:	01b00793          	li	a5,27
    8000373c:	00f58c63          	beq	a1,a5,80003754 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80003740:	0204b783          	ld	a5,32(s1)
    80003744:	0087b503          	ld	a0,8(a5)
    80003748:	00001097          	auipc	ra,0x1
    8000374c:	36c080e7          	jalr	876(ra) # 80004ab4 <_ZN9BufferCPP3putEi>
        while ((key = __getc()) != 0x1b) {
    80003750:	fddff06f          	j	8000372c <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80003754:	00100793          	li	a5,1
    80003758:	00007717          	auipc	a4,0x7
    8000375c:	bef72823          	sw	a5,-1040(a4) # 8000a348 <_ZL9threadEnd>
        td->buffer->put('!');
    80003760:	0204b783          	ld	a5,32(s1)
    80003764:	02100593          	li	a1,33
    80003768:	0087b503          	ld	a0,8(a5)
    8000376c:	00001097          	auipc	ra,0x1
    80003770:	348080e7          	jalr	840(ra) # 80004ab4 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80003774:	0204b783          	ld	a5,32(s1)
    80003778:	0107b503          	ld	a0,16(a5)
    8000377c:	ffffe097          	auipc	ra,0xffffe
    80003780:	5a4080e7          	jalr	1444(ra) # 80001d20 <_ZN9Semaphore6signalEv>
    }
    80003784:	01813083          	ld	ra,24(sp)
    80003788:	01013403          	ld	s0,16(sp)
    8000378c:	00813483          	ld	s1,8(sp)
    80003790:	02010113          	addi	sp,sp,32
    80003794:	00008067          	ret

0000000080003798 <_ZN8Producer3runEv>:
    void run() override {
    80003798:	fe010113          	addi	sp,sp,-32
    8000379c:	00113c23          	sd	ra,24(sp)
    800037a0:	00813823          	sd	s0,16(sp)
    800037a4:	00913423          	sd	s1,8(sp)
    800037a8:	01213023          	sd	s2,0(sp)
    800037ac:	02010413          	addi	s0,sp,32
    800037b0:	00050493          	mv	s1,a0
        int i = 0;
    800037b4:	00000913          	li	s2,0
        while (!threadEnd) {
    800037b8:	00007797          	auipc	a5,0x7
    800037bc:	b907a783          	lw	a5,-1136(a5) # 8000a348 <_ZL9threadEnd>
    800037c0:	04079263          	bnez	a5,80003804 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    800037c4:	0204b783          	ld	a5,32(s1)
    800037c8:	0007a583          	lw	a1,0(a5)
    800037cc:	0305859b          	addiw	a1,a1,48
    800037d0:	0087b503          	ld	a0,8(a5)
    800037d4:	00001097          	auipc	ra,0x1
    800037d8:	2e0080e7          	jalr	736(ra) # 80004ab4 <_ZN9BufferCPP3putEi>
            i++;
    800037dc:	0019071b          	addiw	a4,s2,1
    800037e0:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    800037e4:	0204b783          	ld	a5,32(s1)
    800037e8:	0007a783          	lw	a5,0(a5)
    800037ec:	00e787bb          	addw	a5,a5,a4
    800037f0:	00500513          	li	a0,5
    800037f4:	02a7e53b          	remw	a0,a5,a0
    800037f8:	ffffe097          	auipc	ra,0xffffe
    800037fc:	554080e7          	jalr	1364(ra) # 80001d4c <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80003800:	fb9ff06f          	j	800037b8 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80003804:	0204b783          	ld	a5,32(s1)
    80003808:	0107b503          	ld	a0,16(a5)
    8000380c:	ffffe097          	auipc	ra,0xffffe
    80003810:	514080e7          	jalr	1300(ra) # 80001d20 <_ZN9Semaphore6signalEv>
    }
    80003814:	01813083          	ld	ra,24(sp)
    80003818:	01013403          	ld	s0,16(sp)
    8000381c:	00813483          	ld	s1,8(sp)
    80003820:	00013903          	ld	s2,0(sp)
    80003824:	02010113          	addi	sp,sp,32
    80003828:	00008067          	ret

000000008000382c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    8000382c:	fe010113          	addi	sp,sp,-32
    80003830:	00113c23          	sd	ra,24(sp)
    80003834:	00813823          	sd	s0,16(sp)
    80003838:	00913423          	sd	s1,8(sp)
    8000383c:	01213023          	sd	s2,0(sp)
    80003840:	02010413          	addi	s0,sp,32
    80003844:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003848:	00100793          	li	a5,1
    8000384c:	02a7f863          	bgeu	a5,a0,8000387c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003850:	00a00793          	li	a5,10
    80003854:	02f577b3          	remu	a5,a0,a5
    80003858:	02078e63          	beqz	a5,80003894 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    8000385c:	fff48513          	addi	a0,s1,-1
    80003860:	00000097          	auipc	ra,0x0
    80003864:	fcc080e7          	jalr	-52(ra) # 8000382c <_ZL9fibonaccim>
    80003868:	00050913          	mv	s2,a0
    8000386c:	ffe48513          	addi	a0,s1,-2
    80003870:	00000097          	auipc	ra,0x0
    80003874:	fbc080e7          	jalr	-68(ra) # 8000382c <_ZL9fibonaccim>
    80003878:	00a90533          	add	a0,s2,a0
}
    8000387c:	01813083          	ld	ra,24(sp)
    80003880:	01013403          	ld	s0,16(sp)
    80003884:	00813483          	ld	s1,8(sp)
    80003888:	00013903          	ld	s2,0(sp)
    8000388c:	02010113          	addi	sp,sp,32
    80003890:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003894:	ffffe097          	auipc	ra,0xffffe
    80003898:	b58080e7          	jalr	-1192(ra) # 800013ec <_Z15thread_dispatchv>
    8000389c:	fc1ff06f          	j	8000385c <_ZL9fibonaccim+0x30>

00000000800038a0 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    800038a0:	fe010113          	addi	sp,sp,-32
    800038a4:	00113c23          	sd	ra,24(sp)
    800038a8:	00813823          	sd	s0,16(sp)
    800038ac:	00913423          	sd	s1,8(sp)
    800038b0:	01213023          	sd	s2,0(sp)
    800038b4:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800038b8:	00a00493          	li	s1,10
    800038bc:	0400006f          	j	800038fc <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800038c0:	00005517          	auipc	a0,0x5
    800038c4:	9f850513          	addi	a0,a0,-1544 # 800082b8 <CONSOLE_STATUS+0x2a8>
    800038c8:	00001097          	auipc	ra,0x1
    800038cc:	dc8080e7          	jalr	-568(ra) # 80004690 <_Z11printStringPKc>
    800038d0:	00000613          	li	a2,0
    800038d4:	00a00593          	li	a1,10
    800038d8:	00048513          	mv	a0,s1
    800038dc:	00001097          	auipc	ra,0x1
    800038e0:	f64080e7          	jalr	-156(ra) # 80004840 <_Z8printIntiii>
    800038e4:	00005517          	auipc	a0,0x5
    800038e8:	bf450513          	addi	a0,a0,-1036 # 800084d8 <CONSOLE_STATUS+0x4c8>
    800038ec:	00001097          	auipc	ra,0x1
    800038f0:	da4080e7          	jalr	-604(ra) # 80004690 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800038f4:	0014849b          	addiw	s1,s1,1
    800038f8:	0ff4f493          	andi	s1,s1,255
    800038fc:	00c00793          	li	a5,12
    80003900:	fc97f0e3          	bgeu	a5,s1,800038c0 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80003904:	00005517          	auipc	a0,0x5
    80003908:	9bc50513          	addi	a0,a0,-1604 # 800082c0 <CONSOLE_STATUS+0x2b0>
    8000390c:	00001097          	auipc	ra,0x1
    80003910:	d84080e7          	jalr	-636(ra) # 80004690 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003914:	00500313          	li	t1,5
    thread_dispatch();
    80003918:	ffffe097          	auipc	ra,0xffffe
    8000391c:	ad4080e7          	jalr	-1324(ra) # 800013ec <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003920:	01000513          	li	a0,16
    80003924:	00000097          	auipc	ra,0x0
    80003928:	f08080e7          	jalr	-248(ra) # 8000382c <_ZL9fibonaccim>
    8000392c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003930:	00005517          	auipc	a0,0x5
    80003934:	9a050513          	addi	a0,a0,-1632 # 800082d0 <CONSOLE_STATUS+0x2c0>
    80003938:	00001097          	auipc	ra,0x1
    8000393c:	d58080e7          	jalr	-680(ra) # 80004690 <_Z11printStringPKc>
    80003940:	00000613          	li	a2,0
    80003944:	00a00593          	li	a1,10
    80003948:	0009051b          	sext.w	a0,s2
    8000394c:	00001097          	auipc	ra,0x1
    80003950:	ef4080e7          	jalr	-268(ra) # 80004840 <_Z8printIntiii>
    80003954:	00005517          	auipc	a0,0x5
    80003958:	b8450513          	addi	a0,a0,-1148 # 800084d8 <CONSOLE_STATUS+0x4c8>
    8000395c:	00001097          	auipc	ra,0x1
    80003960:	d34080e7          	jalr	-716(ra) # 80004690 <_Z11printStringPKc>
    80003964:	0400006f          	j	800039a4 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003968:	00005517          	auipc	a0,0x5
    8000396c:	95050513          	addi	a0,a0,-1712 # 800082b8 <CONSOLE_STATUS+0x2a8>
    80003970:	00001097          	auipc	ra,0x1
    80003974:	d20080e7          	jalr	-736(ra) # 80004690 <_Z11printStringPKc>
    80003978:	00000613          	li	a2,0
    8000397c:	00a00593          	li	a1,10
    80003980:	00048513          	mv	a0,s1
    80003984:	00001097          	auipc	ra,0x1
    80003988:	ebc080e7          	jalr	-324(ra) # 80004840 <_Z8printIntiii>
    8000398c:	00005517          	auipc	a0,0x5
    80003990:	b4c50513          	addi	a0,a0,-1204 # 800084d8 <CONSOLE_STATUS+0x4c8>
    80003994:	00001097          	auipc	ra,0x1
    80003998:	cfc080e7          	jalr	-772(ra) # 80004690 <_Z11printStringPKc>
    for (; i < 16; i++) {
    8000399c:	0014849b          	addiw	s1,s1,1
    800039a0:	0ff4f493          	andi	s1,s1,255
    800039a4:	00f00793          	li	a5,15
    800039a8:	fc97f0e3          	bgeu	a5,s1,80003968 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800039ac:	00005517          	auipc	a0,0x5
    800039b0:	93450513          	addi	a0,a0,-1740 # 800082e0 <CONSOLE_STATUS+0x2d0>
    800039b4:	00001097          	auipc	ra,0x1
    800039b8:	cdc080e7          	jalr	-804(ra) # 80004690 <_Z11printStringPKc>
    finishedD = true;
    800039bc:	00100793          	li	a5,1
    800039c0:	00007717          	auipc	a4,0x7
    800039c4:	98f70c23          	sb	a5,-1640(a4) # 8000a358 <_ZL9finishedD>
    thread_dispatch();
    800039c8:	ffffe097          	auipc	ra,0xffffe
    800039cc:	a24080e7          	jalr	-1500(ra) # 800013ec <_Z15thread_dispatchv>
}
    800039d0:	01813083          	ld	ra,24(sp)
    800039d4:	01013403          	ld	s0,16(sp)
    800039d8:	00813483          	ld	s1,8(sp)
    800039dc:	00013903          	ld	s2,0(sp)
    800039e0:	02010113          	addi	sp,sp,32
    800039e4:	00008067          	ret

00000000800039e8 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800039e8:	fe010113          	addi	sp,sp,-32
    800039ec:	00113c23          	sd	ra,24(sp)
    800039f0:	00813823          	sd	s0,16(sp)
    800039f4:	00913423          	sd	s1,8(sp)
    800039f8:	01213023          	sd	s2,0(sp)
    800039fc:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003a00:	00000493          	li	s1,0
    80003a04:	0400006f          	j	80003a44 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80003a08:	00005517          	auipc	a0,0x5
    80003a0c:	88050513          	addi	a0,a0,-1920 # 80008288 <CONSOLE_STATUS+0x278>
    80003a10:	00001097          	auipc	ra,0x1
    80003a14:	c80080e7          	jalr	-896(ra) # 80004690 <_Z11printStringPKc>
    80003a18:	00000613          	li	a2,0
    80003a1c:	00a00593          	li	a1,10
    80003a20:	00048513          	mv	a0,s1
    80003a24:	00001097          	auipc	ra,0x1
    80003a28:	e1c080e7          	jalr	-484(ra) # 80004840 <_Z8printIntiii>
    80003a2c:	00005517          	auipc	a0,0x5
    80003a30:	aac50513          	addi	a0,a0,-1364 # 800084d8 <CONSOLE_STATUS+0x4c8>
    80003a34:	00001097          	auipc	ra,0x1
    80003a38:	c5c080e7          	jalr	-932(ra) # 80004690 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003a3c:	0014849b          	addiw	s1,s1,1
    80003a40:	0ff4f493          	andi	s1,s1,255
    80003a44:	00200793          	li	a5,2
    80003a48:	fc97f0e3          	bgeu	a5,s1,80003a08 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80003a4c:	00005517          	auipc	a0,0x5
    80003a50:	84450513          	addi	a0,a0,-1980 # 80008290 <CONSOLE_STATUS+0x280>
    80003a54:	00001097          	auipc	ra,0x1
    80003a58:	c3c080e7          	jalr	-964(ra) # 80004690 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003a5c:	00700313          	li	t1,7
    thread_dispatch();
    80003a60:	ffffe097          	auipc	ra,0xffffe
    80003a64:	98c080e7          	jalr	-1652(ra) # 800013ec <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003a68:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80003a6c:	00005517          	auipc	a0,0x5
    80003a70:	83450513          	addi	a0,a0,-1996 # 800082a0 <CONSOLE_STATUS+0x290>
    80003a74:	00001097          	auipc	ra,0x1
    80003a78:	c1c080e7          	jalr	-996(ra) # 80004690 <_Z11printStringPKc>
    80003a7c:	00000613          	li	a2,0
    80003a80:	00a00593          	li	a1,10
    80003a84:	0009051b          	sext.w	a0,s2
    80003a88:	00001097          	auipc	ra,0x1
    80003a8c:	db8080e7          	jalr	-584(ra) # 80004840 <_Z8printIntiii>
    80003a90:	00005517          	auipc	a0,0x5
    80003a94:	a4850513          	addi	a0,a0,-1464 # 800084d8 <CONSOLE_STATUS+0x4c8>
    80003a98:	00001097          	auipc	ra,0x1
    80003a9c:	bf8080e7          	jalr	-1032(ra) # 80004690 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80003aa0:	00c00513          	li	a0,12
    80003aa4:	00000097          	auipc	ra,0x0
    80003aa8:	d88080e7          	jalr	-632(ra) # 8000382c <_ZL9fibonaccim>
    80003aac:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003ab0:	00004517          	auipc	a0,0x4
    80003ab4:	7f850513          	addi	a0,a0,2040 # 800082a8 <CONSOLE_STATUS+0x298>
    80003ab8:	00001097          	auipc	ra,0x1
    80003abc:	bd8080e7          	jalr	-1064(ra) # 80004690 <_Z11printStringPKc>
    80003ac0:	00000613          	li	a2,0
    80003ac4:	00a00593          	li	a1,10
    80003ac8:	0009051b          	sext.w	a0,s2
    80003acc:	00001097          	auipc	ra,0x1
    80003ad0:	d74080e7          	jalr	-652(ra) # 80004840 <_Z8printIntiii>
    80003ad4:	00005517          	auipc	a0,0x5
    80003ad8:	a0450513          	addi	a0,a0,-1532 # 800084d8 <CONSOLE_STATUS+0x4c8>
    80003adc:	00001097          	auipc	ra,0x1
    80003ae0:	bb4080e7          	jalr	-1100(ra) # 80004690 <_Z11printStringPKc>
    80003ae4:	0400006f          	j	80003b24 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80003ae8:	00004517          	auipc	a0,0x4
    80003aec:	7a050513          	addi	a0,a0,1952 # 80008288 <CONSOLE_STATUS+0x278>
    80003af0:	00001097          	auipc	ra,0x1
    80003af4:	ba0080e7          	jalr	-1120(ra) # 80004690 <_Z11printStringPKc>
    80003af8:	00000613          	li	a2,0
    80003afc:	00a00593          	li	a1,10
    80003b00:	00048513          	mv	a0,s1
    80003b04:	00001097          	auipc	ra,0x1
    80003b08:	d3c080e7          	jalr	-708(ra) # 80004840 <_Z8printIntiii>
    80003b0c:	00005517          	auipc	a0,0x5
    80003b10:	9cc50513          	addi	a0,a0,-1588 # 800084d8 <CONSOLE_STATUS+0x4c8>
    80003b14:	00001097          	auipc	ra,0x1
    80003b18:	b7c080e7          	jalr	-1156(ra) # 80004690 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003b1c:	0014849b          	addiw	s1,s1,1
    80003b20:	0ff4f493          	andi	s1,s1,255
    80003b24:	00500793          	li	a5,5
    80003b28:	fc97f0e3          	bgeu	a5,s1,80003ae8 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80003b2c:	00004517          	auipc	a0,0x4
    80003b30:	73450513          	addi	a0,a0,1844 # 80008260 <CONSOLE_STATUS+0x250>
    80003b34:	00001097          	auipc	ra,0x1
    80003b38:	b5c080e7          	jalr	-1188(ra) # 80004690 <_Z11printStringPKc>
    finishedC = true;
    80003b3c:	00100793          	li	a5,1
    80003b40:	00007717          	auipc	a4,0x7
    80003b44:	80f70ca3          	sb	a5,-2023(a4) # 8000a359 <_ZL9finishedC>
    thread_dispatch();
    80003b48:	ffffe097          	auipc	ra,0xffffe
    80003b4c:	8a4080e7          	jalr	-1884(ra) # 800013ec <_Z15thread_dispatchv>
}
    80003b50:	01813083          	ld	ra,24(sp)
    80003b54:	01013403          	ld	s0,16(sp)
    80003b58:	00813483          	ld	s1,8(sp)
    80003b5c:	00013903          	ld	s2,0(sp)
    80003b60:	02010113          	addi	sp,sp,32
    80003b64:	00008067          	ret

0000000080003b68 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80003b68:	fe010113          	addi	sp,sp,-32
    80003b6c:	00113c23          	sd	ra,24(sp)
    80003b70:	00813823          	sd	s0,16(sp)
    80003b74:	00913423          	sd	s1,8(sp)
    80003b78:	01213023          	sd	s2,0(sp)
    80003b7c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003b80:	00000913          	li	s2,0
    80003b84:	0380006f          	j	80003bbc <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80003b88:	ffffe097          	auipc	ra,0xffffe
    80003b8c:	864080e7          	jalr	-1948(ra) # 800013ec <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003b90:	00148493          	addi	s1,s1,1
    80003b94:	000027b7          	lui	a5,0x2
    80003b98:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003b9c:	0097ee63          	bltu	a5,s1,80003bb8 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003ba0:	00000713          	li	a4,0
    80003ba4:	000077b7          	lui	a5,0x7
    80003ba8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003bac:	fce7eee3          	bltu	a5,a4,80003b88 <_ZL11workerBodyBPv+0x20>
    80003bb0:	00170713          	addi	a4,a4,1
    80003bb4:	ff1ff06f          	j	80003ba4 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003bb8:	00190913          	addi	s2,s2,1
    80003bbc:	00f00793          	li	a5,15
    80003bc0:	0527e063          	bltu	a5,s2,80003c00 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003bc4:	00004517          	auipc	a0,0x4
    80003bc8:	6ac50513          	addi	a0,a0,1708 # 80008270 <CONSOLE_STATUS+0x260>
    80003bcc:	00001097          	auipc	ra,0x1
    80003bd0:	ac4080e7          	jalr	-1340(ra) # 80004690 <_Z11printStringPKc>
    80003bd4:	00000613          	li	a2,0
    80003bd8:	00a00593          	li	a1,10
    80003bdc:	0009051b          	sext.w	a0,s2
    80003be0:	00001097          	auipc	ra,0x1
    80003be4:	c60080e7          	jalr	-928(ra) # 80004840 <_Z8printIntiii>
    80003be8:	00005517          	auipc	a0,0x5
    80003bec:	8f050513          	addi	a0,a0,-1808 # 800084d8 <CONSOLE_STATUS+0x4c8>
    80003bf0:	00001097          	auipc	ra,0x1
    80003bf4:	aa0080e7          	jalr	-1376(ra) # 80004690 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003bf8:	00000493          	li	s1,0
    80003bfc:	f99ff06f          	j	80003b94 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80003c00:	00004517          	auipc	a0,0x4
    80003c04:	67850513          	addi	a0,a0,1656 # 80008278 <CONSOLE_STATUS+0x268>
    80003c08:	00001097          	auipc	ra,0x1
    80003c0c:	a88080e7          	jalr	-1400(ra) # 80004690 <_Z11printStringPKc>
    finishedB = true;
    80003c10:	00100793          	li	a5,1
    80003c14:	00006717          	auipc	a4,0x6
    80003c18:	74f70323          	sb	a5,1862(a4) # 8000a35a <_ZL9finishedB>
    thread_dispatch();
    80003c1c:	ffffd097          	auipc	ra,0xffffd
    80003c20:	7d0080e7          	jalr	2000(ra) # 800013ec <_Z15thread_dispatchv>
}
    80003c24:	01813083          	ld	ra,24(sp)
    80003c28:	01013403          	ld	s0,16(sp)
    80003c2c:	00813483          	ld	s1,8(sp)
    80003c30:	00013903          	ld	s2,0(sp)
    80003c34:	02010113          	addi	sp,sp,32
    80003c38:	00008067          	ret

0000000080003c3c <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80003c3c:	fe010113          	addi	sp,sp,-32
    80003c40:	00113c23          	sd	ra,24(sp)
    80003c44:	00813823          	sd	s0,16(sp)
    80003c48:	00913423          	sd	s1,8(sp)
    80003c4c:	01213023          	sd	s2,0(sp)
    80003c50:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003c54:	00000913          	li	s2,0
    80003c58:	0380006f          	j	80003c90 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80003c5c:	ffffd097          	auipc	ra,0xffffd
    80003c60:	790080e7          	jalr	1936(ra) # 800013ec <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003c64:	00148493          	addi	s1,s1,1
    80003c68:	000027b7          	lui	a5,0x2
    80003c6c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003c70:	0097ee63          	bltu	a5,s1,80003c8c <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003c74:	00000713          	li	a4,0
    80003c78:	000077b7          	lui	a5,0x7
    80003c7c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003c80:	fce7eee3          	bltu	a5,a4,80003c5c <_ZL11workerBodyAPv+0x20>
    80003c84:	00170713          	addi	a4,a4,1
    80003c88:	ff1ff06f          	j	80003c78 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003c8c:	00190913          	addi	s2,s2,1
    80003c90:	00900793          	li	a5,9
    80003c94:	0527e063          	bltu	a5,s2,80003cd4 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003c98:	00004517          	auipc	a0,0x4
    80003c9c:	5c050513          	addi	a0,a0,1472 # 80008258 <CONSOLE_STATUS+0x248>
    80003ca0:	00001097          	auipc	ra,0x1
    80003ca4:	9f0080e7          	jalr	-1552(ra) # 80004690 <_Z11printStringPKc>
    80003ca8:	00000613          	li	a2,0
    80003cac:	00a00593          	li	a1,10
    80003cb0:	0009051b          	sext.w	a0,s2
    80003cb4:	00001097          	auipc	ra,0x1
    80003cb8:	b8c080e7          	jalr	-1140(ra) # 80004840 <_Z8printIntiii>
    80003cbc:	00005517          	auipc	a0,0x5
    80003cc0:	81c50513          	addi	a0,a0,-2020 # 800084d8 <CONSOLE_STATUS+0x4c8>
    80003cc4:	00001097          	auipc	ra,0x1
    80003cc8:	9cc080e7          	jalr	-1588(ra) # 80004690 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003ccc:	00000493          	li	s1,0
    80003cd0:	f99ff06f          	j	80003c68 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80003cd4:	00004517          	auipc	a0,0x4
    80003cd8:	58c50513          	addi	a0,a0,1420 # 80008260 <CONSOLE_STATUS+0x250>
    80003cdc:	00001097          	auipc	ra,0x1
    80003ce0:	9b4080e7          	jalr	-1612(ra) # 80004690 <_Z11printStringPKc>
    finishedA = true;
    80003ce4:	00100793          	li	a5,1
    80003ce8:	00006717          	auipc	a4,0x6
    80003cec:	66f709a3          	sb	a5,1651(a4) # 8000a35b <_ZL9finishedA>
}
    80003cf0:	01813083          	ld	ra,24(sp)
    80003cf4:	01013403          	ld	s0,16(sp)
    80003cf8:	00813483          	ld	s1,8(sp)
    80003cfc:	00013903          	ld	s2,0(sp)
    80003d00:	02010113          	addi	sp,sp,32
    80003d04:	00008067          	ret

0000000080003d08 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80003d08:	fd010113          	addi	sp,sp,-48
    80003d0c:	02113423          	sd	ra,40(sp)
    80003d10:	02813023          	sd	s0,32(sp)
    80003d14:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80003d18:	00000613          	li	a2,0
    80003d1c:	00000597          	auipc	a1,0x0
    80003d20:	f2058593          	addi	a1,a1,-224 # 80003c3c <_ZL11workerBodyAPv>
    80003d24:	fd040513          	addi	a0,s0,-48
    80003d28:	ffffd097          	auipc	ra,0xffffd
    80003d2c:	604080e7          	jalr	1540(ra) # 8000132c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80003d30:	00004517          	auipc	a0,0x4
    80003d34:	5c050513          	addi	a0,a0,1472 # 800082f0 <CONSOLE_STATUS+0x2e0>
    80003d38:	00001097          	auipc	ra,0x1
    80003d3c:	958080e7          	jalr	-1704(ra) # 80004690 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80003d40:	00000613          	li	a2,0
    80003d44:	00000597          	auipc	a1,0x0
    80003d48:	e2458593          	addi	a1,a1,-476 # 80003b68 <_ZL11workerBodyBPv>
    80003d4c:	fd840513          	addi	a0,s0,-40
    80003d50:	ffffd097          	auipc	ra,0xffffd
    80003d54:	5dc080e7          	jalr	1500(ra) # 8000132c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80003d58:	00004517          	auipc	a0,0x4
    80003d5c:	5b050513          	addi	a0,a0,1456 # 80008308 <CONSOLE_STATUS+0x2f8>
    80003d60:	00001097          	auipc	ra,0x1
    80003d64:	930080e7          	jalr	-1744(ra) # 80004690 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80003d68:	00000613          	li	a2,0
    80003d6c:	00000597          	auipc	a1,0x0
    80003d70:	c7c58593          	addi	a1,a1,-900 # 800039e8 <_ZL11workerBodyCPv>
    80003d74:	fe040513          	addi	a0,s0,-32
    80003d78:	ffffd097          	auipc	ra,0xffffd
    80003d7c:	5b4080e7          	jalr	1460(ra) # 8000132c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80003d80:	00004517          	auipc	a0,0x4
    80003d84:	5a050513          	addi	a0,a0,1440 # 80008320 <CONSOLE_STATUS+0x310>
    80003d88:	00001097          	auipc	ra,0x1
    80003d8c:	908080e7          	jalr	-1784(ra) # 80004690 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80003d90:	00000613          	li	a2,0
    80003d94:	00000597          	auipc	a1,0x0
    80003d98:	b0c58593          	addi	a1,a1,-1268 # 800038a0 <_ZL11workerBodyDPv>
    80003d9c:	fe840513          	addi	a0,s0,-24
    80003da0:	ffffd097          	auipc	ra,0xffffd
    80003da4:	58c080e7          	jalr	1420(ra) # 8000132c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80003da8:	00004517          	auipc	a0,0x4
    80003dac:	59050513          	addi	a0,a0,1424 # 80008338 <CONSOLE_STATUS+0x328>
    80003db0:	00001097          	auipc	ra,0x1
    80003db4:	8e0080e7          	jalr	-1824(ra) # 80004690 <_Z11printStringPKc>
    80003db8:	00c0006f          	j	80003dc4 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80003dbc:	ffffd097          	auipc	ra,0xffffd
    80003dc0:	630080e7          	jalr	1584(ra) # 800013ec <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80003dc4:	00006797          	auipc	a5,0x6
    80003dc8:	5977c783          	lbu	a5,1431(a5) # 8000a35b <_ZL9finishedA>
    80003dcc:	fe0788e3          	beqz	a5,80003dbc <_Z18Threads_C_API_testv+0xb4>
    80003dd0:	00006797          	auipc	a5,0x6
    80003dd4:	58a7c783          	lbu	a5,1418(a5) # 8000a35a <_ZL9finishedB>
    80003dd8:	fe0782e3          	beqz	a5,80003dbc <_Z18Threads_C_API_testv+0xb4>
    80003ddc:	00006797          	auipc	a5,0x6
    80003de0:	57d7c783          	lbu	a5,1405(a5) # 8000a359 <_ZL9finishedC>
    80003de4:	fc078ce3          	beqz	a5,80003dbc <_Z18Threads_C_API_testv+0xb4>
    80003de8:	00006797          	auipc	a5,0x6
    80003dec:	5707c783          	lbu	a5,1392(a5) # 8000a358 <_ZL9finishedD>
    80003df0:	fc0786e3          	beqz	a5,80003dbc <_Z18Threads_C_API_testv+0xb4>
    }

}
    80003df4:	02813083          	ld	ra,40(sp)
    80003df8:	02013403          	ld	s0,32(sp)
    80003dfc:	03010113          	addi	sp,sp,48
    80003e00:	00008067          	ret

0000000080003e04 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80003e04:	fd010113          	addi	sp,sp,-48
    80003e08:	02113423          	sd	ra,40(sp)
    80003e0c:	02813023          	sd	s0,32(sp)
    80003e10:	00913c23          	sd	s1,24(sp)
    80003e14:	01213823          	sd	s2,16(sp)
    80003e18:	01313423          	sd	s3,8(sp)
    80003e1c:	03010413          	addi	s0,sp,48
    80003e20:	00050993          	mv	s3,a0
    80003e24:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003e28:	00000913          	li	s2,0
    80003e2c:	00c0006f          	j	80003e38 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = __getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80003e30:	ffffe097          	auipc	ra,0xffffe
    80003e34:	e64080e7          	jalr	-412(ra) # 80001c94 <_ZN6Thread8dispatchEv>
    while ((key = __getc()) != 0x1b) {
    80003e38:	00004097          	auipc	ra,0x4
    80003e3c:	dc4080e7          	jalr	-572(ra) # 80007bfc <__getc>
    80003e40:	0005059b          	sext.w	a1,a0
    80003e44:	01b00793          	li	a5,27
    80003e48:	02f58a63          	beq	a1,a5,80003e7c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80003e4c:	0084b503          	ld	a0,8(s1)
    80003e50:	00001097          	auipc	ra,0x1
    80003e54:	c64080e7          	jalr	-924(ra) # 80004ab4 <_ZN9BufferCPP3putEi>
        i++;
    80003e58:	0019071b          	addiw	a4,s2,1
    80003e5c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003e60:	0004a683          	lw	a3,0(s1)
    80003e64:	0026979b          	slliw	a5,a3,0x2
    80003e68:	00d787bb          	addw	a5,a5,a3
    80003e6c:	0017979b          	slliw	a5,a5,0x1
    80003e70:	02f767bb          	remw	a5,a4,a5
    80003e74:	fc0792e3          	bnez	a5,80003e38 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80003e78:	fb9ff06f          	j	80003e30 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80003e7c:	00100793          	li	a5,1
    80003e80:	00006717          	auipc	a4,0x6
    80003e84:	4ef72023          	sw	a5,1248(a4) # 8000a360 <_ZL9threadEnd>
    td->buffer->put('!');
    80003e88:	0209b783          	ld	a5,32(s3)
    80003e8c:	02100593          	li	a1,33
    80003e90:	0087b503          	ld	a0,8(a5)
    80003e94:	00001097          	auipc	ra,0x1
    80003e98:	c20080e7          	jalr	-992(ra) # 80004ab4 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80003e9c:	0104b503          	ld	a0,16(s1)
    80003ea0:	ffffe097          	auipc	ra,0xffffe
    80003ea4:	e80080e7          	jalr	-384(ra) # 80001d20 <_ZN9Semaphore6signalEv>
}
    80003ea8:	02813083          	ld	ra,40(sp)
    80003eac:	02013403          	ld	s0,32(sp)
    80003eb0:	01813483          	ld	s1,24(sp)
    80003eb4:	01013903          	ld	s2,16(sp)
    80003eb8:	00813983          	ld	s3,8(sp)
    80003ebc:	03010113          	addi	sp,sp,48
    80003ec0:	00008067          	ret

0000000080003ec4 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80003ec4:	fe010113          	addi	sp,sp,-32
    80003ec8:	00113c23          	sd	ra,24(sp)
    80003ecc:	00813823          	sd	s0,16(sp)
    80003ed0:	00913423          	sd	s1,8(sp)
    80003ed4:	01213023          	sd	s2,0(sp)
    80003ed8:	02010413          	addi	s0,sp,32
    80003edc:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003ee0:	00000913          	li	s2,0
    80003ee4:	00c0006f          	j	80003ef0 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80003ee8:	ffffe097          	auipc	ra,0xffffe
    80003eec:	dac080e7          	jalr	-596(ra) # 80001c94 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80003ef0:	00006797          	auipc	a5,0x6
    80003ef4:	4707a783          	lw	a5,1136(a5) # 8000a360 <_ZL9threadEnd>
    80003ef8:	02079e63          	bnez	a5,80003f34 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80003efc:	0004a583          	lw	a1,0(s1)
    80003f00:	0305859b          	addiw	a1,a1,48
    80003f04:	0084b503          	ld	a0,8(s1)
    80003f08:	00001097          	auipc	ra,0x1
    80003f0c:	bac080e7          	jalr	-1108(ra) # 80004ab4 <_ZN9BufferCPP3putEi>
        i++;
    80003f10:	0019071b          	addiw	a4,s2,1
    80003f14:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003f18:	0004a683          	lw	a3,0(s1)
    80003f1c:	0026979b          	slliw	a5,a3,0x2
    80003f20:	00d787bb          	addw	a5,a5,a3
    80003f24:	0017979b          	slliw	a5,a5,0x1
    80003f28:	02f767bb          	remw	a5,a4,a5
    80003f2c:	fc0792e3          	bnez	a5,80003ef0 <_ZN12ProducerSync8producerEPv+0x2c>
    80003f30:	fb9ff06f          	j	80003ee8 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80003f34:	0104b503          	ld	a0,16(s1)
    80003f38:	ffffe097          	auipc	ra,0xffffe
    80003f3c:	de8080e7          	jalr	-536(ra) # 80001d20 <_ZN9Semaphore6signalEv>
}
    80003f40:	01813083          	ld	ra,24(sp)
    80003f44:	01013403          	ld	s0,16(sp)
    80003f48:	00813483          	ld	s1,8(sp)
    80003f4c:	00013903          	ld	s2,0(sp)
    80003f50:	02010113          	addi	sp,sp,32
    80003f54:	00008067          	ret

0000000080003f58 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80003f58:	fd010113          	addi	sp,sp,-48
    80003f5c:	02113423          	sd	ra,40(sp)
    80003f60:	02813023          	sd	s0,32(sp)
    80003f64:	00913c23          	sd	s1,24(sp)
    80003f68:	01213823          	sd	s2,16(sp)
    80003f6c:	01313423          	sd	s3,8(sp)
    80003f70:	01413023          	sd	s4,0(sp)
    80003f74:	03010413          	addi	s0,sp,48
    80003f78:	00050993          	mv	s3,a0
    80003f7c:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003f80:	00000a13          	li	s4,0
    80003f84:	01c0006f          	j	80003fa0 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        __putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80003f88:	ffffe097          	auipc	ra,0xffffe
    80003f8c:	d0c080e7          	jalr	-756(ra) # 80001c94 <_ZN6Thread8dispatchEv>
    80003f90:	0500006f          	j	80003fe0 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            __putc('\n');
    80003f94:	00a00513          	li	a0,10
    80003f98:	00004097          	auipc	ra,0x4
    80003f9c:	c28080e7          	jalr	-984(ra) # 80007bc0 <__putc>
    while (!threadEnd) {
    80003fa0:	00006797          	auipc	a5,0x6
    80003fa4:	3c07a783          	lw	a5,960(a5) # 8000a360 <_ZL9threadEnd>
    80003fa8:	06079263          	bnez	a5,8000400c <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80003fac:	00893503          	ld	a0,8(s2)
    80003fb0:	00001097          	auipc	ra,0x1
    80003fb4:	b94080e7          	jalr	-1132(ra) # 80004b44 <_ZN9BufferCPP3getEv>
        i++;
    80003fb8:	001a049b          	addiw	s1,s4,1
    80003fbc:	00048a1b          	sext.w	s4,s1
        __putc(key);
    80003fc0:	0ff57513          	andi	a0,a0,255
    80003fc4:	00004097          	auipc	ra,0x4
    80003fc8:	bfc080e7          	jalr	-1028(ra) # 80007bc0 <__putc>
        if (i % (5 * data->id) == 0) {
    80003fcc:	00092703          	lw	a4,0(s2)
    80003fd0:	0027179b          	slliw	a5,a4,0x2
    80003fd4:	00e787bb          	addw	a5,a5,a4
    80003fd8:	02f4e7bb          	remw	a5,s1,a5
    80003fdc:	fa0786e3          	beqz	a5,80003f88 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80003fe0:	05000793          	li	a5,80
    80003fe4:	02f4e4bb          	remw	s1,s1,a5
    80003fe8:	fa049ce3          	bnez	s1,80003fa0 <_ZN12ConsumerSync8consumerEPv+0x48>
    80003fec:	fa9ff06f          	j	80003f94 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80003ff0:	0209b783          	ld	a5,32(s3)
    80003ff4:	0087b503          	ld	a0,8(a5)
    80003ff8:	00001097          	auipc	ra,0x1
    80003ffc:	b4c080e7          	jalr	-1204(ra) # 80004b44 <_ZN9BufferCPP3getEv>
        __putc(key);
    80004000:	0ff57513          	andi	a0,a0,255
    80004004:	00004097          	auipc	ra,0x4
    80004008:	bbc080e7          	jalr	-1092(ra) # 80007bc0 <__putc>
    while (td->buffer->getCnt() > 0) {
    8000400c:	0209b783          	ld	a5,32(s3)
    80004010:	0087b503          	ld	a0,8(a5)
    80004014:	00001097          	auipc	ra,0x1
    80004018:	bbc080e7          	jalr	-1092(ra) # 80004bd0 <_ZN9BufferCPP6getCntEv>
    8000401c:	fca04ae3          	bgtz	a0,80003ff0 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80004020:	01093503          	ld	a0,16(s2)
    80004024:	ffffe097          	auipc	ra,0xffffe
    80004028:	cfc080e7          	jalr	-772(ra) # 80001d20 <_ZN9Semaphore6signalEv>
}
    8000402c:	02813083          	ld	ra,40(sp)
    80004030:	02013403          	ld	s0,32(sp)
    80004034:	01813483          	ld	s1,24(sp)
    80004038:	01013903          	ld	s2,16(sp)
    8000403c:	00813983          	ld	s3,8(sp)
    80004040:	00013a03          	ld	s4,0(sp)
    80004044:	03010113          	addi	sp,sp,48
    80004048:	00008067          	ret

000000008000404c <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    8000404c:	f8010113          	addi	sp,sp,-128
    80004050:	06113c23          	sd	ra,120(sp)
    80004054:	06813823          	sd	s0,112(sp)
    80004058:	06913423          	sd	s1,104(sp)
    8000405c:	07213023          	sd	s2,96(sp)
    80004060:	05313c23          	sd	s3,88(sp)
    80004064:	05413823          	sd	s4,80(sp)
    80004068:	05513423          	sd	s5,72(sp)
    8000406c:	05613023          	sd	s6,64(sp)
    80004070:	03713c23          	sd	s7,56(sp)
    80004074:	03813823          	sd	s8,48(sp)
    80004078:	03913423          	sd	s9,40(sp)
    8000407c:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80004080:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80004084:	00004517          	auipc	a0,0x4
    80004088:	0ec50513          	addi	a0,a0,236 # 80008170 <CONSOLE_STATUS+0x160>
    8000408c:	00000097          	auipc	ra,0x0
    80004090:	604080e7          	jalr	1540(ra) # 80004690 <_Z11printStringPKc>
    getString(input, 30);
    80004094:	01e00593          	li	a1,30
    80004098:	f8040493          	addi	s1,s0,-128
    8000409c:	00048513          	mv	a0,s1
    800040a0:	00000097          	auipc	ra,0x0
    800040a4:	678080e7          	jalr	1656(ra) # 80004718 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800040a8:	00048513          	mv	a0,s1
    800040ac:	00000097          	auipc	ra,0x0
    800040b0:	744080e7          	jalr	1860(ra) # 800047f0 <_Z11stringToIntPKc>
    800040b4:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800040b8:	00004517          	auipc	a0,0x4
    800040bc:	0d850513          	addi	a0,a0,216 # 80008190 <CONSOLE_STATUS+0x180>
    800040c0:	00000097          	auipc	ra,0x0
    800040c4:	5d0080e7          	jalr	1488(ra) # 80004690 <_Z11printStringPKc>
    getString(input, 30);
    800040c8:	01e00593          	li	a1,30
    800040cc:	00048513          	mv	a0,s1
    800040d0:	00000097          	auipc	ra,0x0
    800040d4:	648080e7          	jalr	1608(ra) # 80004718 <_Z9getStringPci>
    n = stringToInt(input);
    800040d8:	00048513          	mv	a0,s1
    800040dc:	00000097          	auipc	ra,0x0
    800040e0:	714080e7          	jalr	1812(ra) # 800047f0 <_Z11stringToIntPKc>
    800040e4:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800040e8:	00004517          	auipc	a0,0x4
    800040ec:	0c850513          	addi	a0,a0,200 # 800081b0 <CONSOLE_STATUS+0x1a0>
    800040f0:	00000097          	auipc	ra,0x0
    800040f4:	5a0080e7          	jalr	1440(ra) # 80004690 <_Z11printStringPKc>
    800040f8:	00000613          	li	a2,0
    800040fc:	00a00593          	li	a1,10
    80004100:	00090513          	mv	a0,s2
    80004104:	00000097          	auipc	ra,0x0
    80004108:	73c080e7          	jalr	1852(ra) # 80004840 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    8000410c:	00004517          	auipc	a0,0x4
    80004110:	0bc50513          	addi	a0,a0,188 # 800081c8 <CONSOLE_STATUS+0x1b8>
    80004114:	00000097          	auipc	ra,0x0
    80004118:	57c080e7          	jalr	1404(ra) # 80004690 <_Z11printStringPKc>
    8000411c:	00000613          	li	a2,0
    80004120:	00a00593          	li	a1,10
    80004124:	00048513          	mv	a0,s1
    80004128:	00000097          	auipc	ra,0x0
    8000412c:	718080e7          	jalr	1816(ra) # 80004840 <_Z8printIntiii>
    printString(".\n");
    80004130:	00004517          	auipc	a0,0x4
    80004134:	0b050513          	addi	a0,a0,176 # 800081e0 <CONSOLE_STATUS+0x1d0>
    80004138:	00000097          	auipc	ra,0x0
    8000413c:	558080e7          	jalr	1368(ra) # 80004690 <_Z11printStringPKc>
    if(threadNum > n) {
    80004140:	0324c463          	blt	s1,s2,80004168 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80004144:	03205c63          	blez	s2,8000417c <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004148:	03800513          	li	a0,56
    8000414c:	ffffe097          	auipc	ra,0xffffe
    80004150:	910080e7          	jalr	-1776(ra) # 80001a5c <_Znwm>
    80004154:	00050a93          	mv	s5,a0
    80004158:	00048593          	mv	a1,s1
    8000415c:	00001097          	auipc	ra,0x1
    80004160:	804080e7          	jalr	-2044(ra) # 80004960 <_ZN9BufferCPPC1Ei>
    80004164:	0300006f          	j	80004194 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004168:	00004517          	auipc	a0,0x4
    8000416c:	08050513          	addi	a0,a0,128 # 800081e8 <CONSOLE_STATUS+0x1d8>
    80004170:	00000097          	auipc	ra,0x0
    80004174:	520080e7          	jalr	1312(ra) # 80004690 <_Z11printStringPKc>
        return;
    80004178:	0140006f          	j	8000418c <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    8000417c:	00004517          	auipc	a0,0x4
    80004180:	0ac50513          	addi	a0,a0,172 # 80008228 <CONSOLE_STATUS+0x218>
    80004184:	00000097          	auipc	ra,0x0
    80004188:	50c080e7          	jalr	1292(ra) # 80004690 <_Z11printStringPKc>
        return;
    8000418c:	000b8113          	mv	sp,s7
    80004190:	2380006f          	j	800043c8 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80004194:	01000513          	li	a0,16
    80004198:	ffffe097          	auipc	ra,0xffffe
    8000419c:	8c4080e7          	jalr	-1852(ra) # 80001a5c <_Znwm>
    800041a0:	00050493          	mv	s1,a0
    800041a4:	00000593          	li	a1,0
    800041a8:	ffffe097          	auipc	ra,0xffffe
    800041ac:	b14080e7          	jalr	-1260(ra) # 80001cbc <_ZN9SemaphoreC1Ej>
    800041b0:	00006797          	auipc	a5,0x6
    800041b4:	1a97bc23          	sd	s1,440(a5) # 8000a368 <_ZL10waitForAll>
    Thread* threads[threadNum];
    800041b8:	00391793          	slli	a5,s2,0x3
    800041bc:	00f78793          	addi	a5,a5,15
    800041c0:	ff07f793          	andi	a5,a5,-16
    800041c4:	40f10133          	sub	sp,sp,a5
    800041c8:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    800041cc:	0019071b          	addiw	a4,s2,1
    800041d0:	00171793          	slli	a5,a4,0x1
    800041d4:	00e787b3          	add	a5,a5,a4
    800041d8:	00379793          	slli	a5,a5,0x3
    800041dc:	00f78793          	addi	a5,a5,15
    800041e0:	ff07f793          	andi	a5,a5,-16
    800041e4:	40f10133          	sub	sp,sp,a5
    800041e8:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    800041ec:	00191c13          	slli	s8,s2,0x1
    800041f0:	012c07b3          	add	a5,s8,s2
    800041f4:	00379793          	slli	a5,a5,0x3
    800041f8:	00fa07b3          	add	a5,s4,a5
    800041fc:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80004200:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80004204:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80004208:	02800513          	li	a0,40
    8000420c:	ffffe097          	auipc	ra,0xffffe
    80004210:	850080e7          	jalr	-1968(ra) # 80001a5c <_Znwm>
    80004214:	00050b13          	mv	s6,a0
    80004218:	012c0c33          	add	s8,s8,s2
    8000421c:	003c1c13          	slli	s8,s8,0x3
    80004220:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80004224:	ffffe097          	auipc	ra,0xffffe
    80004228:	9ec080e7          	jalr	-1556(ra) # 80001c10 <_ZN6ThreadC1Ev>
    8000422c:	00006797          	auipc	a5,0x6
    80004230:	03c78793          	addi	a5,a5,60 # 8000a268 <_ZTV12ConsumerSync+0x10>
    80004234:	00fb3023          	sd	a5,0(s6)
    80004238:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    8000423c:	000b0513          	mv	a0,s6
    80004240:	ffffe097          	auipc	ra,0xffffe
    80004244:	a00080e7          	jalr	-1536(ra) # 80001c40 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80004248:	00000493          	li	s1,0
    8000424c:	0380006f          	j	80004284 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80004250:	00006797          	auipc	a5,0x6
    80004254:	ff078793          	addi	a5,a5,-16 # 8000a240 <_ZTV12ProducerSync+0x10>
    80004258:	00fcb023          	sd	a5,0(s9)
    8000425c:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80004260:	00349793          	slli	a5,s1,0x3
    80004264:	00f987b3          	add	a5,s3,a5
    80004268:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    8000426c:	00349793          	slli	a5,s1,0x3
    80004270:	00f987b3          	add	a5,s3,a5
    80004274:	0007b503          	ld	a0,0(a5)
    80004278:	ffffe097          	auipc	ra,0xffffe
    8000427c:	9c8080e7          	jalr	-1592(ra) # 80001c40 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80004280:	0014849b          	addiw	s1,s1,1
    80004284:	0b24d063          	bge	s1,s2,80004324 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80004288:	00149793          	slli	a5,s1,0x1
    8000428c:	009787b3          	add	a5,a5,s1
    80004290:	00379793          	slli	a5,a5,0x3
    80004294:	00fa07b3          	add	a5,s4,a5
    80004298:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    8000429c:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    800042a0:	00006717          	auipc	a4,0x6
    800042a4:	0c873703          	ld	a4,200(a4) # 8000a368 <_ZL10waitForAll>
    800042a8:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    800042ac:	02905863          	blez	s1,800042dc <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    800042b0:	02800513          	li	a0,40
    800042b4:	ffffd097          	auipc	ra,0xffffd
    800042b8:	7a8080e7          	jalr	1960(ra) # 80001a5c <_Znwm>
    800042bc:	00050c93          	mv	s9,a0
    800042c0:	00149c13          	slli	s8,s1,0x1
    800042c4:	009c0c33          	add	s8,s8,s1
    800042c8:	003c1c13          	slli	s8,s8,0x3
    800042cc:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800042d0:	ffffe097          	auipc	ra,0xffffe
    800042d4:	940080e7          	jalr	-1728(ra) # 80001c10 <_ZN6ThreadC1Ev>
    800042d8:	f79ff06f          	j	80004250 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    800042dc:	02800513          	li	a0,40
    800042e0:	ffffd097          	auipc	ra,0xffffd
    800042e4:	77c080e7          	jalr	1916(ra) # 80001a5c <_Znwm>
    800042e8:	00050c93          	mv	s9,a0
    800042ec:	00149c13          	slli	s8,s1,0x1
    800042f0:	009c0c33          	add	s8,s8,s1
    800042f4:	003c1c13          	slli	s8,s8,0x3
    800042f8:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    800042fc:	ffffe097          	auipc	ra,0xffffe
    80004300:	914080e7          	jalr	-1772(ra) # 80001c10 <_ZN6ThreadC1Ev>
    80004304:	00006797          	auipc	a5,0x6
    80004308:	f1478793          	addi	a5,a5,-236 # 8000a218 <_ZTV16ProducerKeyboard+0x10>
    8000430c:	00fcb023          	sd	a5,0(s9)
    80004310:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80004314:	00349793          	slli	a5,s1,0x3
    80004318:	00f987b3          	add	a5,s3,a5
    8000431c:	0197b023          	sd	s9,0(a5)
    80004320:	f4dff06f          	j	8000426c <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80004324:	ffffe097          	auipc	ra,0xffffe
    80004328:	970080e7          	jalr	-1680(ra) # 80001c94 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    8000432c:	00000493          	li	s1,0
    80004330:	00994e63          	blt	s2,s1,8000434c <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80004334:	00006517          	auipc	a0,0x6
    80004338:	03453503          	ld	a0,52(a0) # 8000a368 <_ZL10waitForAll>
    8000433c:	ffffe097          	auipc	ra,0xffffe
    80004340:	9b8080e7          	jalr	-1608(ra) # 80001cf4 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004344:	0014849b          	addiw	s1,s1,1
    80004348:	fe9ff06f          	j	80004330 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    8000434c:	00000493          	li	s1,0
    80004350:	0080006f          	j	80004358 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80004354:	0014849b          	addiw	s1,s1,1
    80004358:	0324d263          	bge	s1,s2,8000437c <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    8000435c:	00349793          	slli	a5,s1,0x3
    80004360:	00f987b3          	add	a5,s3,a5
    80004364:	0007b503          	ld	a0,0(a5)
    80004368:	fe0506e3          	beqz	a0,80004354 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    8000436c:	00053783          	ld	a5,0(a0)
    80004370:	0087b783          	ld	a5,8(a5)
    80004374:	000780e7          	jalr	a5
    80004378:	fddff06f          	j	80004354 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    8000437c:	000b0a63          	beqz	s6,80004390 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80004380:	000b3783          	ld	a5,0(s6)
    80004384:	0087b783          	ld	a5,8(a5)
    80004388:	000b0513          	mv	a0,s6
    8000438c:	000780e7          	jalr	a5
    delete waitForAll;
    80004390:	00006517          	auipc	a0,0x6
    80004394:	fd853503          	ld	a0,-40(a0) # 8000a368 <_ZL10waitForAll>
    80004398:	00050863          	beqz	a0,800043a8 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    8000439c:	00053783          	ld	a5,0(a0)
    800043a0:	0087b783          	ld	a5,8(a5)
    800043a4:	000780e7          	jalr	a5
    delete buffer;
    800043a8:	000a8e63          	beqz	s5,800043c4 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    800043ac:	000a8513          	mv	a0,s5
    800043b0:	00001097          	auipc	ra,0x1
    800043b4:	8a8080e7          	jalr	-1880(ra) # 80004c58 <_ZN9BufferCPPD1Ev>
    800043b8:	000a8513          	mv	a0,s5
    800043bc:	ffffd097          	auipc	ra,0xffffd
    800043c0:	6f0080e7          	jalr	1776(ra) # 80001aac <_ZdlPv>
    800043c4:	000b8113          	mv	sp,s7

}
    800043c8:	f8040113          	addi	sp,s0,-128
    800043cc:	07813083          	ld	ra,120(sp)
    800043d0:	07013403          	ld	s0,112(sp)
    800043d4:	06813483          	ld	s1,104(sp)
    800043d8:	06013903          	ld	s2,96(sp)
    800043dc:	05813983          	ld	s3,88(sp)
    800043e0:	05013a03          	ld	s4,80(sp)
    800043e4:	04813a83          	ld	s5,72(sp)
    800043e8:	04013b03          	ld	s6,64(sp)
    800043ec:	03813b83          	ld	s7,56(sp)
    800043f0:	03013c03          	ld	s8,48(sp)
    800043f4:	02813c83          	ld	s9,40(sp)
    800043f8:	08010113          	addi	sp,sp,128
    800043fc:	00008067          	ret
    80004400:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004404:	000a8513          	mv	a0,s5
    80004408:	ffffd097          	auipc	ra,0xffffd
    8000440c:	6a4080e7          	jalr	1700(ra) # 80001aac <_ZdlPv>
    80004410:	00048513          	mv	a0,s1
    80004414:	00007097          	auipc	ra,0x7
    80004418:	034080e7          	jalr	52(ra) # 8000b448 <_Unwind_Resume>
    8000441c:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80004420:	00048513          	mv	a0,s1
    80004424:	ffffd097          	auipc	ra,0xffffd
    80004428:	688080e7          	jalr	1672(ra) # 80001aac <_ZdlPv>
    8000442c:	00090513          	mv	a0,s2
    80004430:	00007097          	auipc	ra,0x7
    80004434:	018080e7          	jalr	24(ra) # 8000b448 <_Unwind_Resume>
    80004438:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    8000443c:	000b0513          	mv	a0,s6
    80004440:	ffffd097          	auipc	ra,0xffffd
    80004444:	66c080e7          	jalr	1644(ra) # 80001aac <_ZdlPv>
    80004448:	00048513          	mv	a0,s1
    8000444c:	00007097          	auipc	ra,0x7
    80004450:	ffc080e7          	jalr	-4(ra) # 8000b448 <_Unwind_Resume>
    80004454:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80004458:	000c8513          	mv	a0,s9
    8000445c:	ffffd097          	auipc	ra,0xffffd
    80004460:	650080e7          	jalr	1616(ra) # 80001aac <_ZdlPv>
    80004464:	00048513          	mv	a0,s1
    80004468:	00007097          	auipc	ra,0x7
    8000446c:	fe0080e7          	jalr	-32(ra) # 8000b448 <_Unwind_Resume>
    80004470:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80004474:	000c8513          	mv	a0,s9
    80004478:	ffffd097          	auipc	ra,0xffffd
    8000447c:	634080e7          	jalr	1588(ra) # 80001aac <_ZdlPv>
    80004480:	00048513          	mv	a0,s1
    80004484:	00007097          	auipc	ra,0x7
    80004488:	fc4080e7          	jalr	-60(ra) # 8000b448 <_Unwind_Resume>

000000008000448c <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    8000448c:	ff010113          	addi	sp,sp,-16
    80004490:	00113423          	sd	ra,8(sp)
    80004494:	00813023          	sd	s0,0(sp)
    80004498:	01010413          	addi	s0,sp,16
    8000449c:	00006797          	auipc	a5,0x6
    800044a0:	dcc78793          	addi	a5,a5,-564 # 8000a268 <_ZTV12ConsumerSync+0x10>
    800044a4:	00f53023          	sd	a5,0(a0)
    800044a8:	ffffd097          	auipc	ra,0xffffd
    800044ac:	654080e7          	jalr	1620(ra) # 80001afc <_ZN6ThreadD1Ev>
    800044b0:	00813083          	ld	ra,8(sp)
    800044b4:	00013403          	ld	s0,0(sp)
    800044b8:	01010113          	addi	sp,sp,16
    800044bc:	00008067          	ret

00000000800044c0 <_ZN12ConsumerSyncD0Ev>:
    800044c0:	fe010113          	addi	sp,sp,-32
    800044c4:	00113c23          	sd	ra,24(sp)
    800044c8:	00813823          	sd	s0,16(sp)
    800044cc:	00913423          	sd	s1,8(sp)
    800044d0:	02010413          	addi	s0,sp,32
    800044d4:	00050493          	mv	s1,a0
    800044d8:	00006797          	auipc	a5,0x6
    800044dc:	d9078793          	addi	a5,a5,-624 # 8000a268 <_ZTV12ConsumerSync+0x10>
    800044e0:	00f53023          	sd	a5,0(a0)
    800044e4:	ffffd097          	auipc	ra,0xffffd
    800044e8:	618080e7          	jalr	1560(ra) # 80001afc <_ZN6ThreadD1Ev>
    800044ec:	00048513          	mv	a0,s1
    800044f0:	ffffd097          	auipc	ra,0xffffd
    800044f4:	5bc080e7          	jalr	1468(ra) # 80001aac <_ZdlPv>
    800044f8:	01813083          	ld	ra,24(sp)
    800044fc:	01013403          	ld	s0,16(sp)
    80004500:	00813483          	ld	s1,8(sp)
    80004504:	02010113          	addi	sp,sp,32
    80004508:	00008067          	ret

000000008000450c <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    8000450c:	ff010113          	addi	sp,sp,-16
    80004510:	00113423          	sd	ra,8(sp)
    80004514:	00813023          	sd	s0,0(sp)
    80004518:	01010413          	addi	s0,sp,16
    8000451c:	00006797          	auipc	a5,0x6
    80004520:	d2478793          	addi	a5,a5,-732 # 8000a240 <_ZTV12ProducerSync+0x10>
    80004524:	00f53023          	sd	a5,0(a0)
    80004528:	ffffd097          	auipc	ra,0xffffd
    8000452c:	5d4080e7          	jalr	1492(ra) # 80001afc <_ZN6ThreadD1Ev>
    80004530:	00813083          	ld	ra,8(sp)
    80004534:	00013403          	ld	s0,0(sp)
    80004538:	01010113          	addi	sp,sp,16
    8000453c:	00008067          	ret

0000000080004540 <_ZN12ProducerSyncD0Ev>:
    80004540:	fe010113          	addi	sp,sp,-32
    80004544:	00113c23          	sd	ra,24(sp)
    80004548:	00813823          	sd	s0,16(sp)
    8000454c:	00913423          	sd	s1,8(sp)
    80004550:	02010413          	addi	s0,sp,32
    80004554:	00050493          	mv	s1,a0
    80004558:	00006797          	auipc	a5,0x6
    8000455c:	ce878793          	addi	a5,a5,-792 # 8000a240 <_ZTV12ProducerSync+0x10>
    80004560:	00f53023          	sd	a5,0(a0)
    80004564:	ffffd097          	auipc	ra,0xffffd
    80004568:	598080e7          	jalr	1432(ra) # 80001afc <_ZN6ThreadD1Ev>
    8000456c:	00048513          	mv	a0,s1
    80004570:	ffffd097          	auipc	ra,0xffffd
    80004574:	53c080e7          	jalr	1340(ra) # 80001aac <_ZdlPv>
    80004578:	01813083          	ld	ra,24(sp)
    8000457c:	01013403          	ld	s0,16(sp)
    80004580:	00813483          	ld	s1,8(sp)
    80004584:	02010113          	addi	sp,sp,32
    80004588:	00008067          	ret

000000008000458c <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    8000458c:	ff010113          	addi	sp,sp,-16
    80004590:	00113423          	sd	ra,8(sp)
    80004594:	00813023          	sd	s0,0(sp)
    80004598:	01010413          	addi	s0,sp,16
    8000459c:	00006797          	auipc	a5,0x6
    800045a0:	c7c78793          	addi	a5,a5,-900 # 8000a218 <_ZTV16ProducerKeyboard+0x10>
    800045a4:	00f53023          	sd	a5,0(a0)
    800045a8:	ffffd097          	auipc	ra,0xffffd
    800045ac:	554080e7          	jalr	1364(ra) # 80001afc <_ZN6ThreadD1Ev>
    800045b0:	00813083          	ld	ra,8(sp)
    800045b4:	00013403          	ld	s0,0(sp)
    800045b8:	01010113          	addi	sp,sp,16
    800045bc:	00008067          	ret

00000000800045c0 <_ZN16ProducerKeyboardD0Ev>:
    800045c0:	fe010113          	addi	sp,sp,-32
    800045c4:	00113c23          	sd	ra,24(sp)
    800045c8:	00813823          	sd	s0,16(sp)
    800045cc:	00913423          	sd	s1,8(sp)
    800045d0:	02010413          	addi	s0,sp,32
    800045d4:	00050493          	mv	s1,a0
    800045d8:	00006797          	auipc	a5,0x6
    800045dc:	c4078793          	addi	a5,a5,-960 # 8000a218 <_ZTV16ProducerKeyboard+0x10>
    800045e0:	00f53023          	sd	a5,0(a0)
    800045e4:	ffffd097          	auipc	ra,0xffffd
    800045e8:	518080e7          	jalr	1304(ra) # 80001afc <_ZN6ThreadD1Ev>
    800045ec:	00048513          	mv	a0,s1
    800045f0:	ffffd097          	auipc	ra,0xffffd
    800045f4:	4bc080e7          	jalr	1212(ra) # 80001aac <_ZdlPv>
    800045f8:	01813083          	ld	ra,24(sp)
    800045fc:	01013403          	ld	s0,16(sp)
    80004600:	00813483          	ld	s1,8(sp)
    80004604:	02010113          	addi	sp,sp,32
    80004608:	00008067          	ret

000000008000460c <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    8000460c:	ff010113          	addi	sp,sp,-16
    80004610:	00113423          	sd	ra,8(sp)
    80004614:	00813023          	sd	s0,0(sp)
    80004618:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    8000461c:	02053583          	ld	a1,32(a0)
    80004620:	fffff097          	auipc	ra,0xfffff
    80004624:	7e4080e7          	jalr	2020(ra) # 80003e04 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80004628:	00813083          	ld	ra,8(sp)
    8000462c:	00013403          	ld	s0,0(sp)
    80004630:	01010113          	addi	sp,sp,16
    80004634:	00008067          	ret

0000000080004638 <_ZN12ProducerSync3runEv>:
    void run() override {
    80004638:	ff010113          	addi	sp,sp,-16
    8000463c:	00113423          	sd	ra,8(sp)
    80004640:	00813023          	sd	s0,0(sp)
    80004644:	01010413          	addi	s0,sp,16
        producer(td);
    80004648:	02053583          	ld	a1,32(a0)
    8000464c:	00000097          	auipc	ra,0x0
    80004650:	878080e7          	jalr	-1928(ra) # 80003ec4 <_ZN12ProducerSync8producerEPv>
    }
    80004654:	00813083          	ld	ra,8(sp)
    80004658:	00013403          	ld	s0,0(sp)
    8000465c:	01010113          	addi	sp,sp,16
    80004660:	00008067          	ret

0000000080004664 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80004664:	ff010113          	addi	sp,sp,-16
    80004668:	00113423          	sd	ra,8(sp)
    8000466c:	00813023          	sd	s0,0(sp)
    80004670:	01010413          	addi	s0,sp,16
        consumer(td);
    80004674:	02053583          	ld	a1,32(a0)
    80004678:	00000097          	auipc	ra,0x0
    8000467c:	8e0080e7          	jalr	-1824(ra) # 80003f58 <_ZN12ConsumerSync8consumerEPv>
    }
    80004680:	00813083          	ld	ra,8(sp)
    80004684:	00013403          	ld	s0,0(sp)
    80004688:	01010113          	addi	sp,sp,16
    8000468c:	00008067          	ret

0000000080004690 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80004690:	fe010113          	addi	sp,sp,-32
    80004694:	00113c23          	sd	ra,24(sp)
    80004698:	00813823          	sd	s0,16(sp)
    8000469c:	00913423          	sd	s1,8(sp)
    800046a0:	02010413          	addi	s0,sp,32
    800046a4:	00050493          	mv	s1,a0
    LOCK();
    800046a8:	00100613          	li	a2,1
    800046ac:	00000593          	li	a1,0
    800046b0:	00006517          	auipc	a0,0x6
    800046b4:	cc050513          	addi	a0,a0,-832 # 8000a370 <lockPrint>
    800046b8:	ffffd097          	auipc	ra,0xffffd
    800046bc:	b7c080e7          	jalr	-1156(ra) # 80001234 <copy_and_swap>
    800046c0:	00050863          	beqz	a0,800046d0 <_Z11printStringPKc+0x40>
    800046c4:	ffffd097          	auipc	ra,0xffffd
    800046c8:	d28080e7          	jalr	-728(ra) # 800013ec <_Z15thread_dispatchv>
    800046cc:	fddff06f          	j	800046a8 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    800046d0:	0004c503          	lbu	a0,0(s1)
    800046d4:	00050a63          	beqz	a0,800046e8 <_Z11printStringPKc+0x58>
    {
        __putc(*string);
    800046d8:	00003097          	auipc	ra,0x3
    800046dc:	4e8080e7          	jalr	1256(ra) # 80007bc0 <__putc>
        string++;
    800046e0:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    800046e4:	fedff06f          	j	800046d0 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    800046e8:	00000613          	li	a2,0
    800046ec:	00100593          	li	a1,1
    800046f0:	00006517          	auipc	a0,0x6
    800046f4:	c8050513          	addi	a0,a0,-896 # 8000a370 <lockPrint>
    800046f8:	ffffd097          	auipc	ra,0xffffd
    800046fc:	b3c080e7          	jalr	-1220(ra) # 80001234 <copy_and_swap>
    80004700:	fe0514e3          	bnez	a0,800046e8 <_Z11printStringPKc+0x58>
}
    80004704:	01813083          	ld	ra,24(sp)
    80004708:	01013403          	ld	s0,16(sp)
    8000470c:	00813483          	ld	s1,8(sp)
    80004710:	02010113          	addi	sp,sp,32
    80004714:	00008067          	ret

0000000080004718 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80004718:	fd010113          	addi	sp,sp,-48
    8000471c:	02113423          	sd	ra,40(sp)
    80004720:	02813023          	sd	s0,32(sp)
    80004724:	00913c23          	sd	s1,24(sp)
    80004728:	01213823          	sd	s2,16(sp)
    8000472c:	01313423          	sd	s3,8(sp)
    80004730:	01413023          	sd	s4,0(sp)
    80004734:	03010413          	addi	s0,sp,48
    80004738:	00050993          	mv	s3,a0
    8000473c:	00058a13          	mv	s4,a1
    LOCK();
    80004740:	00100613          	li	a2,1
    80004744:	00000593          	li	a1,0
    80004748:	00006517          	auipc	a0,0x6
    8000474c:	c2850513          	addi	a0,a0,-984 # 8000a370 <lockPrint>
    80004750:	ffffd097          	auipc	ra,0xffffd
    80004754:	ae4080e7          	jalr	-1308(ra) # 80001234 <copy_and_swap>
    80004758:	00050863          	beqz	a0,80004768 <_Z9getStringPci+0x50>
    8000475c:	ffffd097          	auipc	ra,0xffffd
    80004760:	c90080e7          	jalr	-880(ra) # 800013ec <_Z15thread_dispatchv>
    80004764:	fddff06f          	j	80004740 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80004768:	00000913          	li	s2,0
    8000476c:	00090493          	mv	s1,s2
    80004770:	0019091b          	addiw	s2,s2,1
    80004774:	03495a63          	bge	s2,s4,800047a8 <_Z9getStringPci+0x90>
        cc = __getc();
    80004778:	00003097          	auipc	ra,0x3
    8000477c:	484080e7          	jalr	1156(ra) # 80007bfc <__getc>
        if(cc < 1)
    80004780:	02050463          	beqz	a0,800047a8 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80004784:	009984b3          	add	s1,s3,s1
    80004788:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    8000478c:	00a00793          	li	a5,10
    80004790:	00f50a63          	beq	a0,a5,800047a4 <_Z9getStringPci+0x8c>
    80004794:	00d00793          	li	a5,13
    80004798:	fcf51ae3          	bne	a0,a5,8000476c <_Z9getStringPci+0x54>
        buf[i++] = c;
    8000479c:	00090493          	mv	s1,s2
    800047a0:	0080006f          	j	800047a8 <_Z9getStringPci+0x90>
    800047a4:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    800047a8:	009984b3          	add	s1,s3,s1
    800047ac:	00048023          	sb	zero,0(s1)

    UNLOCK();
    800047b0:	00000613          	li	a2,0
    800047b4:	00100593          	li	a1,1
    800047b8:	00006517          	auipc	a0,0x6
    800047bc:	bb850513          	addi	a0,a0,-1096 # 8000a370 <lockPrint>
    800047c0:	ffffd097          	auipc	ra,0xffffd
    800047c4:	a74080e7          	jalr	-1420(ra) # 80001234 <copy_and_swap>
    800047c8:	fe0514e3          	bnez	a0,800047b0 <_Z9getStringPci+0x98>
    return buf;
}
    800047cc:	00098513          	mv	a0,s3
    800047d0:	02813083          	ld	ra,40(sp)
    800047d4:	02013403          	ld	s0,32(sp)
    800047d8:	01813483          	ld	s1,24(sp)
    800047dc:	01013903          	ld	s2,16(sp)
    800047e0:	00813983          	ld	s3,8(sp)
    800047e4:	00013a03          	ld	s4,0(sp)
    800047e8:	03010113          	addi	sp,sp,48
    800047ec:	00008067          	ret

00000000800047f0 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    800047f0:	ff010113          	addi	sp,sp,-16
    800047f4:	00813423          	sd	s0,8(sp)
    800047f8:	01010413          	addi	s0,sp,16
    800047fc:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80004800:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80004804:	0006c603          	lbu	a2,0(a3)
    80004808:	fd06071b          	addiw	a4,a2,-48
    8000480c:	0ff77713          	andi	a4,a4,255
    80004810:	00900793          	li	a5,9
    80004814:	02e7e063          	bltu	a5,a4,80004834 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80004818:	0025179b          	slliw	a5,a0,0x2
    8000481c:	00a787bb          	addw	a5,a5,a0
    80004820:	0017979b          	slliw	a5,a5,0x1
    80004824:	00168693          	addi	a3,a3,1
    80004828:	00c787bb          	addw	a5,a5,a2
    8000482c:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80004830:	fd5ff06f          	j	80004804 <_Z11stringToIntPKc+0x14>
    return n;
}
    80004834:	00813403          	ld	s0,8(sp)
    80004838:	01010113          	addi	sp,sp,16
    8000483c:	00008067          	ret

0000000080004840 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80004840:	fc010113          	addi	sp,sp,-64
    80004844:	02113c23          	sd	ra,56(sp)
    80004848:	02813823          	sd	s0,48(sp)
    8000484c:	02913423          	sd	s1,40(sp)
    80004850:	03213023          	sd	s2,32(sp)
    80004854:	01313c23          	sd	s3,24(sp)
    80004858:	04010413          	addi	s0,sp,64
    8000485c:	00050493          	mv	s1,a0
    80004860:	00058913          	mv	s2,a1
    80004864:	00060993          	mv	s3,a2
    LOCK();
    80004868:	00100613          	li	a2,1
    8000486c:	00000593          	li	a1,0
    80004870:	00006517          	auipc	a0,0x6
    80004874:	b0050513          	addi	a0,a0,-1280 # 8000a370 <lockPrint>
    80004878:	ffffd097          	auipc	ra,0xffffd
    8000487c:	9bc080e7          	jalr	-1604(ra) # 80001234 <copy_and_swap>
    80004880:	00050863          	beqz	a0,80004890 <_Z8printIntiii+0x50>
    80004884:	ffffd097          	auipc	ra,0xffffd
    80004888:	b68080e7          	jalr	-1176(ra) # 800013ec <_Z15thread_dispatchv>
    8000488c:	fddff06f          	j	80004868 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80004890:	00098463          	beqz	s3,80004898 <_Z8printIntiii+0x58>
    80004894:	0804c463          	bltz	s1,8000491c <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80004898:	0004851b          	sext.w	a0,s1
    neg = 0;
    8000489c:	00000593          	li	a1,0
    }

    i = 0;
    800048a0:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    800048a4:	0009079b          	sext.w	a5,s2
    800048a8:	0325773b          	remuw	a4,a0,s2
    800048ac:	00048613          	mv	a2,s1
    800048b0:	0014849b          	addiw	s1,s1,1
    800048b4:	02071693          	slli	a3,a4,0x20
    800048b8:	0206d693          	srli	a3,a3,0x20
    800048bc:	00006717          	auipc	a4,0x6
    800048c0:	9c470713          	addi	a4,a4,-1596 # 8000a280 <digits>
    800048c4:	00d70733          	add	a4,a4,a3
    800048c8:	00074683          	lbu	a3,0(a4)
    800048cc:	fd040713          	addi	a4,s0,-48
    800048d0:	00c70733          	add	a4,a4,a2
    800048d4:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    800048d8:	0005071b          	sext.w	a4,a0
    800048dc:	0325553b          	divuw	a0,a0,s2
    800048e0:	fcf772e3          	bgeu	a4,a5,800048a4 <_Z8printIntiii+0x64>
    if(neg)
    800048e4:	00058c63          	beqz	a1,800048fc <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    800048e8:	fd040793          	addi	a5,s0,-48
    800048ec:	009784b3          	add	s1,a5,s1
    800048f0:	02d00793          	li	a5,45
    800048f4:	fef48823          	sb	a5,-16(s1)
    800048f8:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    800048fc:	fff4849b          	addiw	s1,s1,-1
    80004900:	0204c463          	bltz	s1,80004928 <_Z8printIntiii+0xe8>
        __putc(buf[i]);
    80004904:	fd040793          	addi	a5,s0,-48
    80004908:	009787b3          	add	a5,a5,s1
    8000490c:	ff07c503          	lbu	a0,-16(a5)
    80004910:	00003097          	auipc	ra,0x3
    80004914:	2b0080e7          	jalr	688(ra) # 80007bc0 <__putc>
    80004918:	fe5ff06f          	j	800048fc <_Z8printIntiii+0xbc>
        x = -xx;
    8000491c:	4090053b          	negw	a0,s1
        neg = 1;
    80004920:	00100593          	li	a1,1
        x = -xx;
    80004924:	f7dff06f          	j	800048a0 <_Z8printIntiii+0x60>

    UNLOCK();
    80004928:	00000613          	li	a2,0
    8000492c:	00100593          	li	a1,1
    80004930:	00006517          	auipc	a0,0x6
    80004934:	a4050513          	addi	a0,a0,-1472 # 8000a370 <lockPrint>
    80004938:	ffffd097          	auipc	ra,0xffffd
    8000493c:	8fc080e7          	jalr	-1796(ra) # 80001234 <copy_and_swap>
    80004940:	fe0514e3          	bnez	a0,80004928 <_Z8printIntiii+0xe8>
    80004944:	03813083          	ld	ra,56(sp)
    80004948:	03013403          	ld	s0,48(sp)
    8000494c:	02813483          	ld	s1,40(sp)
    80004950:	02013903          	ld	s2,32(sp)
    80004954:	01813983          	ld	s3,24(sp)
    80004958:	04010113          	addi	sp,sp,64
    8000495c:	00008067          	ret

0000000080004960 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"
#include "../lib/console.h"
BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80004960:	fd010113          	addi	sp,sp,-48
    80004964:	02113423          	sd	ra,40(sp)
    80004968:	02813023          	sd	s0,32(sp)
    8000496c:	00913c23          	sd	s1,24(sp)
    80004970:	01213823          	sd	s2,16(sp)
    80004974:	01313423          	sd	s3,8(sp)
    80004978:	03010413          	addi	s0,sp,48
    8000497c:	00050493          	mv	s1,a0
    80004980:	00058913          	mv	s2,a1
    80004984:	0015879b          	addiw	a5,a1,1
    80004988:	0007851b          	sext.w	a0,a5
    8000498c:	00f4a023          	sw	a5,0(s1)
    80004990:	0004a823          	sw	zero,16(s1)
    80004994:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80004998:	00251513          	slli	a0,a0,0x2
    8000499c:	ffffd097          	auipc	ra,0xffffd
    800049a0:	904080e7          	jalr	-1788(ra) # 800012a0 <_Z9mem_allocm>
    800049a4:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    800049a8:	01000513          	li	a0,16
    800049ac:	ffffd097          	auipc	ra,0xffffd
    800049b0:	0b0080e7          	jalr	176(ra) # 80001a5c <_Znwm>
    800049b4:	00050993          	mv	s3,a0
    800049b8:	00000593          	li	a1,0
    800049bc:	ffffd097          	auipc	ra,0xffffd
    800049c0:	300080e7          	jalr	768(ra) # 80001cbc <_ZN9SemaphoreC1Ej>
    800049c4:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800049c8:	01000513          	li	a0,16
    800049cc:	ffffd097          	auipc	ra,0xffffd
    800049d0:	090080e7          	jalr	144(ra) # 80001a5c <_Znwm>
    800049d4:	00050993          	mv	s3,a0
    800049d8:	00090593          	mv	a1,s2
    800049dc:	ffffd097          	auipc	ra,0xffffd
    800049e0:	2e0080e7          	jalr	736(ra) # 80001cbc <_ZN9SemaphoreC1Ej>
    800049e4:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    800049e8:	01000513          	li	a0,16
    800049ec:	ffffd097          	auipc	ra,0xffffd
    800049f0:	070080e7          	jalr	112(ra) # 80001a5c <_Znwm>
    800049f4:	00050913          	mv	s2,a0
    800049f8:	00100593          	li	a1,1
    800049fc:	ffffd097          	auipc	ra,0xffffd
    80004a00:	2c0080e7          	jalr	704(ra) # 80001cbc <_ZN9SemaphoreC1Ej>
    80004a04:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80004a08:	01000513          	li	a0,16
    80004a0c:	ffffd097          	auipc	ra,0xffffd
    80004a10:	050080e7          	jalr	80(ra) # 80001a5c <_Znwm>
    80004a14:	00050913          	mv	s2,a0
    80004a18:	00100593          	li	a1,1
    80004a1c:	ffffd097          	auipc	ra,0xffffd
    80004a20:	2a0080e7          	jalr	672(ra) # 80001cbc <_ZN9SemaphoreC1Ej>
    80004a24:	0324b823          	sd	s2,48(s1)
}
    80004a28:	02813083          	ld	ra,40(sp)
    80004a2c:	02013403          	ld	s0,32(sp)
    80004a30:	01813483          	ld	s1,24(sp)
    80004a34:	01013903          	ld	s2,16(sp)
    80004a38:	00813983          	ld	s3,8(sp)
    80004a3c:	03010113          	addi	sp,sp,48
    80004a40:	00008067          	ret
    80004a44:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80004a48:	00098513          	mv	a0,s3
    80004a4c:	ffffd097          	auipc	ra,0xffffd
    80004a50:	060080e7          	jalr	96(ra) # 80001aac <_ZdlPv>
    80004a54:	00048513          	mv	a0,s1
    80004a58:	00007097          	auipc	ra,0x7
    80004a5c:	9f0080e7          	jalr	-1552(ra) # 8000b448 <_Unwind_Resume>
    80004a60:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80004a64:	00098513          	mv	a0,s3
    80004a68:	ffffd097          	auipc	ra,0xffffd
    80004a6c:	044080e7          	jalr	68(ra) # 80001aac <_ZdlPv>
    80004a70:	00048513          	mv	a0,s1
    80004a74:	00007097          	auipc	ra,0x7
    80004a78:	9d4080e7          	jalr	-1580(ra) # 8000b448 <_Unwind_Resume>
    80004a7c:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80004a80:	00090513          	mv	a0,s2
    80004a84:	ffffd097          	auipc	ra,0xffffd
    80004a88:	028080e7          	jalr	40(ra) # 80001aac <_ZdlPv>
    80004a8c:	00048513          	mv	a0,s1
    80004a90:	00007097          	auipc	ra,0x7
    80004a94:	9b8080e7          	jalr	-1608(ra) # 8000b448 <_Unwind_Resume>
    80004a98:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80004a9c:	00090513          	mv	a0,s2
    80004aa0:	ffffd097          	auipc	ra,0xffffd
    80004aa4:	00c080e7          	jalr	12(ra) # 80001aac <_ZdlPv>
    80004aa8:	00048513          	mv	a0,s1
    80004aac:	00007097          	auipc	ra,0x7
    80004ab0:	99c080e7          	jalr	-1636(ra) # 8000b448 <_Unwind_Resume>

0000000080004ab4 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80004ab4:	fe010113          	addi	sp,sp,-32
    80004ab8:	00113c23          	sd	ra,24(sp)
    80004abc:	00813823          	sd	s0,16(sp)
    80004ac0:	00913423          	sd	s1,8(sp)
    80004ac4:	01213023          	sd	s2,0(sp)
    80004ac8:	02010413          	addi	s0,sp,32
    80004acc:	00050493          	mv	s1,a0
    80004ad0:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80004ad4:	01853503          	ld	a0,24(a0)
    80004ad8:	ffffd097          	auipc	ra,0xffffd
    80004adc:	21c080e7          	jalr	540(ra) # 80001cf4 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80004ae0:	0304b503          	ld	a0,48(s1)
    80004ae4:	ffffd097          	auipc	ra,0xffffd
    80004ae8:	210080e7          	jalr	528(ra) # 80001cf4 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80004aec:	0084b783          	ld	a5,8(s1)
    80004af0:	0144a703          	lw	a4,20(s1)
    80004af4:	00271713          	slli	a4,a4,0x2
    80004af8:	00e787b3          	add	a5,a5,a4
    80004afc:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80004b00:	0144a783          	lw	a5,20(s1)
    80004b04:	0017879b          	addiw	a5,a5,1
    80004b08:	0004a703          	lw	a4,0(s1)
    80004b0c:	02e7e7bb          	remw	a5,a5,a4
    80004b10:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80004b14:	0304b503          	ld	a0,48(s1)
    80004b18:	ffffd097          	auipc	ra,0xffffd
    80004b1c:	208080e7          	jalr	520(ra) # 80001d20 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80004b20:	0204b503          	ld	a0,32(s1)
    80004b24:	ffffd097          	auipc	ra,0xffffd
    80004b28:	1fc080e7          	jalr	508(ra) # 80001d20 <_ZN9Semaphore6signalEv>

}
    80004b2c:	01813083          	ld	ra,24(sp)
    80004b30:	01013403          	ld	s0,16(sp)
    80004b34:	00813483          	ld	s1,8(sp)
    80004b38:	00013903          	ld	s2,0(sp)
    80004b3c:	02010113          	addi	sp,sp,32
    80004b40:	00008067          	ret

0000000080004b44 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80004b44:	fe010113          	addi	sp,sp,-32
    80004b48:	00113c23          	sd	ra,24(sp)
    80004b4c:	00813823          	sd	s0,16(sp)
    80004b50:	00913423          	sd	s1,8(sp)
    80004b54:	01213023          	sd	s2,0(sp)
    80004b58:	02010413          	addi	s0,sp,32
    80004b5c:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80004b60:	02053503          	ld	a0,32(a0)
    80004b64:	ffffd097          	auipc	ra,0xffffd
    80004b68:	190080e7          	jalr	400(ra) # 80001cf4 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80004b6c:	0284b503          	ld	a0,40(s1)
    80004b70:	ffffd097          	auipc	ra,0xffffd
    80004b74:	184080e7          	jalr	388(ra) # 80001cf4 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80004b78:	0084b703          	ld	a4,8(s1)
    80004b7c:	0104a783          	lw	a5,16(s1)
    80004b80:	00279693          	slli	a3,a5,0x2
    80004b84:	00d70733          	add	a4,a4,a3
    80004b88:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80004b8c:	0017879b          	addiw	a5,a5,1
    80004b90:	0004a703          	lw	a4,0(s1)
    80004b94:	02e7e7bb          	remw	a5,a5,a4
    80004b98:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80004b9c:	0284b503          	ld	a0,40(s1)
    80004ba0:	ffffd097          	auipc	ra,0xffffd
    80004ba4:	180080e7          	jalr	384(ra) # 80001d20 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80004ba8:	0184b503          	ld	a0,24(s1)
    80004bac:	ffffd097          	auipc	ra,0xffffd
    80004bb0:	174080e7          	jalr	372(ra) # 80001d20 <_ZN9Semaphore6signalEv>

    return ret;
}
    80004bb4:	00090513          	mv	a0,s2
    80004bb8:	01813083          	ld	ra,24(sp)
    80004bbc:	01013403          	ld	s0,16(sp)
    80004bc0:	00813483          	ld	s1,8(sp)
    80004bc4:	00013903          	ld	s2,0(sp)
    80004bc8:	02010113          	addi	sp,sp,32
    80004bcc:	00008067          	ret

0000000080004bd0 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80004bd0:	fe010113          	addi	sp,sp,-32
    80004bd4:	00113c23          	sd	ra,24(sp)
    80004bd8:	00813823          	sd	s0,16(sp)
    80004bdc:	00913423          	sd	s1,8(sp)
    80004be0:	01213023          	sd	s2,0(sp)
    80004be4:	02010413          	addi	s0,sp,32
    80004be8:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80004bec:	02853503          	ld	a0,40(a0)
    80004bf0:	ffffd097          	auipc	ra,0xffffd
    80004bf4:	104080e7          	jalr	260(ra) # 80001cf4 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80004bf8:	0304b503          	ld	a0,48(s1)
    80004bfc:	ffffd097          	auipc	ra,0xffffd
    80004c00:	0f8080e7          	jalr	248(ra) # 80001cf4 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80004c04:	0144a783          	lw	a5,20(s1)
    80004c08:	0104a903          	lw	s2,16(s1)
    80004c0c:	0327ce63          	blt	a5,s2,80004c48 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80004c10:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80004c14:	0304b503          	ld	a0,48(s1)
    80004c18:	ffffd097          	auipc	ra,0xffffd
    80004c1c:	108080e7          	jalr	264(ra) # 80001d20 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80004c20:	0284b503          	ld	a0,40(s1)
    80004c24:	ffffd097          	auipc	ra,0xffffd
    80004c28:	0fc080e7          	jalr	252(ra) # 80001d20 <_ZN9Semaphore6signalEv>

    return ret;
}
    80004c2c:	00090513          	mv	a0,s2
    80004c30:	01813083          	ld	ra,24(sp)
    80004c34:	01013403          	ld	s0,16(sp)
    80004c38:	00813483          	ld	s1,8(sp)
    80004c3c:	00013903          	ld	s2,0(sp)
    80004c40:	02010113          	addi	sp,sp,32
    80004c44:	00008067          	ret
        ret = cap - head + tail;
    80004c48:	0004a703          	lw	a4,0(s1)
    80004c4c:	4127093b          	subw	s2,a4,s2
    80004c50:	00f9093b          	addw	s2,s2,a5
    80004c54:	fc1ff06f          	j	80004c14 <_ZN9BufferCPP6getCntEv+0x44>

0000000080004c58 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80004c58:	fe010113          	addi	sp,sp,-32
    80004c5c:	00113c23          	sd	ra,24(sp)
    80004c60:	00813823          	sd	s0,16(sp)
    80004c64:	00913423          	sd	s1,8(sp)
    80004c68:	02010413          	addi	s0,sp,32
    80004c6c:	00050493          	mv	s1,a0
    __putc('\n');
    80004c70:	00a00513          	li	a0,10
    80004c74:	00003097          	auipc	ra,0x3
    80004c78:	f4c080e7          	jalr	-180(ra) # 80007bc0 <__putc>
    printString("Buffer deleted!\n");
    80004c7c:	00003517          	auipc	a0,0x3
    80004c80:	6d450513          	addi	a0,a0,1748 # 80008350 <CONSOLE_STATUS+0x340>
    80004c84:	00000097          	auipc	ra,0x0
    80004c88:	a0c080e7          	jalr	-1524(ra) # 80004690 <_Z11printStringPKc>
    while (getCnt()) {
    80004c8c:	00048513          	mv	a0,s1
    80004c90:	00000097          	auipc	ra,0x0
    80004c94:	f40080e7          	jalr	-192(ra) # 80004bd0 <_ZN9BufferCPP6getCntEv>
    80004c98:	02050c63          	beqz	a0,80004cd0 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80004c9c:	0084b783          	ld	a5,8(s1)
    80004ca0:	0104a703          	lw	a4,16(s1)
    80004ca4:	00271713          	slli	a4,a4,0x2
    80004ca8:	00e787b3          	add	a5,a5,a4
        __putc(ch);
    80004cac:	0007c503          	lbu	a0,0(a5)
    80004cb0:	00003097          	auipc	ra,0x3
    80004cb4:	f10080e7          	jalr	-240(ra) # 80007bc0 <__putc>
        head = (head + 1) % cap;
    80004cb8:	0104a783          	lw	a5,16(s1)
    80004cbc:	0017879b          	addiw	a5,a5,1
    80004cc0:	0004a703          	lw	a4,0(s1)
    80004cc4:	02e7e7bb          	remw	a5,a5,a4
    80004cc8:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80004ccc:	fc1ff06f          	j	80004c8c <_ZN9BufferCPPD1Ev+0x34>
    __putc('!');
    80004cd0:	02100513          	li	a0,33
    80004cd4:	00003097          	auipc	ra,0x3
    80004cd8:	eec080e7          	jalr	-276(ra) # 80007bc0 <__putc>
    __putc('\n');
    80004cdc:	00a00513          	li	a0,10
    80004ce0:	00003097          	auipc	ra,0x3
    80004ce4:	ee0080e7          	jalr	-288(ra) # 80007bc0 <__putc>
    mem_free(buffer);
    80004ce8:	0084b503          	ld	a0,8(s1)
    80004cec:	ffffc097          	auipc	ra,0xffffc
    80004cf0:	600080e7          	jalr	1536(ra) # 800012ec <_Z8mem_freePv>
    delete itemAvailable;
    80004cf4:	0204b503          	ld	a0,32(s1)
    80004cf8:	00050863          	beqz	a0,80004d08 <_ZN9BufferCPPD1Ev+0xb0>
    80004cfc:	00053783          	ld	a5,0(a0)
    80004d00:	0087b783          	ld	a5,8(a5)
    80004d04:	000780e7          	jalr	a5
    delete spaceAvailable;
    80004d08:	0184b503          	ld	a0,24(s1)
    80004d0c:	00050863          	beqz	a0,80004d1c <_ZN9BufferCPPD1Ev+0xc4>
    80004d10:	00053783          	ld	a5,0(a0)
    80004d14:	0087b783          	ld	a5,8(a5)
    80004d18:	000780e7          	jalr	a5
    delete mutexTail;
    80004d1c:	0304b503          	ld	a0,48(s1)
    80004d20:	00050863          	beqz	a0,80004d30 <_ZN9BufferCPPD1Ev+0xd8>
    80004d24:	00053783          	ld	a5,0(a0)
    80004d28:	0087b783          	ld	a5,8(a5)
    80004d2c:	000780e7          	jalr	a5
    delete mutexHead;
    80004d30:	0284b503          	ld	a0,40(s1)
    80004d34:	00050863          	beqz	a0,80004d44 <_ZN9BufferCPPD1Ev+0xec>
    80004d38:	00053783          	ld	a5,0(a0)
    80004d3c:	0087b783          	ld	a5,8(a5)
    80004d40:	000780e7          	jalr	a5
}
    80004d44:	01813083          	ld	ra,24(sp)
    80004d48:	01013403          	ld	s0,16(sp)
    80004d4c:	00813483          	ld	s1,8(sp)
    80004d50:	02010113          	addi	sp,sp,32
    80004d54:	00008067          	ret

0000000080004d58 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80004d58:	fe010113          	addi	sp,sp,-32
    80004d5c:	00113c23          	sd	ra,24(sp)
    80004d60:	00813823          	sd	s0,16(sp)
    80004d64:	00913423          	sd	s1,8(sp)
    80004d68:	01213023          	sd	s2,0(sp)
    80004d6c:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80004d70:	00003517          	auipc	a0,0x3
    80004d74:	5f850513          	addi	a0,a0,1528 # 80008368 <CONSOLE_STATUS+0x358>
    80004d78:	00000097          	auipc	ra,0x0
    80004d7c:	918080e7          	jalr	-1768(ra) # 80004690 <_Z11printStringPKc>
    int test = __getc() - '0';
    80004d80:	00003097          	auipc	ra,0x3
    80004d84:	e7c080e7          	jalr	-388(ra) # 80007bfc <__getc>
    80004d88:	00050913          	mv	s2,a0
    80004d8c:	fd05049b          	addiw	s1,a0,-48
    __getc(); // Enter posle broja
    80004d90:	00003097          	auipc	ra,0x3
    80004d94:	e6c080e7          	jalr	-404(ra) # 80007bfc <__getc>
            printString("Nije navedeno da je zadatak 3 implementiran\n");
            return;
        }
    }

    if (test >= 5 && test <= 6) {
    80004d98:	fcb9091b          	addiw	s2,s2,-53
    80004d9c:	00100793          	li	a5,1
    80004da0:	0327f463          	bgeu	a5,s2,80004dc8 <_Z8userMainv+0x70>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80004da4:	00700793          	li	a5,7
    80004da8:	0e97e263          	bltu	a5,s1,80004e8c <_Z8userMainv+0x134>
    80004dac:	00249493          	slli	s1,s1,0x2
    80004db0:	00003717          	auipc	a4,0x3
    80004db4:	7d070713          	addi	a4,a4,2000 # 80008580 <CONSOLE_STATUS+0x570>
    80004db8:	00e484b3          	add	s1,s1,a4
    80004dbc:	0004a783          	lw	a5,0(s1)
    80004dc0:	00e787b3          	add	a5,a5,a4
    80004dc4:	00078067          	jr	a5
            printString("Nije navedeno da je zadatak 4 implementiran\n");
    80004dc8:	00003517          	auipc	a0,0x3
    80004dcc:	5c050513          	addi	a0,a0,1472 # 80008388 <CONSOLE_STATUS+0x378>
    80004dd0:	00000097          	auipc	ra,0x0
    80004dd4:	8c0080e7          	jalr	-1856(ra) # 80004690 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80004dd8:	01813083          	ld	ra,24(sp)
    80004ddc:	01013403          	ld	s0,16(sp)
    80004de0:	00813483          	ld	s1,8(sp)
    80004de4:	00013903          	ld	s2,0(sp)
    80004de8:	02010113          	addi	sp,sp,32
    80004dec:	00008067          	ret
            Threads_C_API_test();
    80004df0:	fffff097          	auipc	ra,0xfffff
    80004df4:	f18080e7          	jalr	-232(ra) # 80003d08 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80004df8:	00003517          	auipc	a0,0x3
    80004dfc:	5c050513          	addi	a0,a0,1472 # 800083b8 <CONSOLE_STATUS+0x3a8>
    80004e00:	00000097          	auipc	ra,0x0
    80004e04:	890080e7          	jalr	-1904(ra) # 80004690 <_Z11printStringPKc>
            break;
    80004e08:	fd1ff06f          	j	80004dd8 <_Z8userMainv+0x80>
            Threads_CPP_API_test();
    80004e0c:	ffffe097          	auipc	ra,0xffffe
    80004e10:	ddc080e7          	jalr	-548(ra) # 80002be8 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80004e14:	00003517          	auipc	a0,0x3
    80004e18:	5e450513          	addi	a0,a0,1508 # 800083f8 <CONSOLE_STATUS+0x3e8>
    80004e1c:	00000097          	auipc	ra,0x0
    80004e20:	874080e7          	jalr	-1932(ra) # 80004690 <_Z11printStringPKc>
            break;
    80004e24:	fb5ff06f          	j	80004dd8 <_Z8userMainv+0x80>
            producerConsumer_C_API();
    80004e28:	ffffd097          	auipc	ra,0xffffd
    80004e2c:	614080e7          	jalr	1556(ra) # 8000243c <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80004e30:	00003517          	auipc	a0,0x3
    80004e34:	60850513          	addi	a0,a0,1544 # 80008438 <CONSOLE_STATUS+0x428>
    80004e38:	00000097          	auipc	ra,0x0
    80004e3c:	858080e7          	jalr	-1960(ra) # 80004690 <_Z11printStringPKc>
            break;
    80004e40:	f99ff06f          	j	80004dd8 <_Z8userMainv+0x80>
            producerConsumer_CPP_Sync_API();
    80004e44:	fffff097          	auipc	ra,0xfffff
    80004e48:	208080e7          	jalr	520(ra) # 8000404c <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80004e4c:	00003517          	auipc	a0,0x3
    80004e50:	63c50513          	addi	a0,a0,1596 # 80008488 <CONSOLE_STATUS+0x478>
    80004e54:	00000097          	auipc	ra,0x0
    80004e58:	83c080e7          	jalr	-1988(ra) # 80004690 <_Z11printStringPKc>
            break;
    80004e5c:	f7dff06f          	j	80004dd8 <_Z8userMainv+0x80>
            System_Mode_test();
    80004e60:	00000097          	auipc	ra,0x0
    80004e64:	658080e7          	jalr	1624(ra) # 800054b8 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80004e68:	00003517          	auipc	a0,0x3
    80004e6c:	67850513          	addi	a0,a0,1656 # 800084e0 <CONSOLE_STATUS+0x4d0>
    80004e70:	00000097          	auipc	ra,0x0
    80004e74:	820080e7          	jalr	-2016(ra) # 80004690 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80004e78:	00003517          	auipc	a0,0x3
    80004e7c:	68850513          	addi	a0,a0,1672 # 80008500 <CONSOLE_STATUS+0x4f0>
    80004e80:	00000097          	auipc	ra,0x0
    80004e84:	810080e7          	jalr	-2032(ra) # 80004690 <_Z11printStringPKc>
            break;
    80004e88:	f51ff06f          	j	80004dd8 <_Z8userMainv+0x80>
            printString("Niste uneli odgovarajuci broj za test\n");
    80004e8c:	00003517          	auipc	a0,0x3
    80004e90:	6cc50513          	addi	a0,a0,1740 # 80008558 <CONSOLE_STATUS+0x548>
    80004e94:	fffff097          	auipc	ra,0xfffff
    80004e98:	7fc080e7          	jalr	2044(ra) # 80004690 <_Z11printStringPKc>
    80004e9c:	f3dff06f          	j	80004dd8 <_Z8userMainv+0x80>

0000000080004ea0 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80004ea0:	fe010113          	addi	sp,sp,-32
    80004ea4:	00113c23          	sd	ra,24(sp)
    80004ea8:	00813823          	sd	s0,16(sp)
    80004eac:	00913423          	sd	s1,8(sp)
    80004eb0:	01213023          	sd	s2,0(sp)
    80004eb4:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80004eb8:	00053903          	ld	s2,0(a0)
    int i = 6;
    80004ebc:	00600493          	li	s1,6
    while (--i > 0) {
    80004ec0:	fff4849b          	addiw	s1,s1,-1
    80004ec4:	04905463          	blez	s1,80004f0c <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    80004ec8:	00003517          	auipc	a0,0x3
    80004ecc:	6d850513          	addi	a0,a0,1752 # 800085a0 <CONSOLE_STATUS+0x590>
    80004ed0:	fffff097          	auipc	ra,0xfffff
    80004ed4:	7c0080e7          	jalr	1984(ra) # 80004690 <_Z11printStringPKc>
        printInt(sleep_time);
    80004ed8:	00000613          	li	a2,0
    80004edc:	00a00593          	li	a1,10
    80004ee0:	0009051b          	sext.w	a0,s2
    80004ee4:	00000097          	auipc	ra,0x0
    80004ee8:	95c080e7          	jalr	-1700(ra) # 80004840 <_Z8printIntiii>
        printString(" !\n");
    80004eec:	00003517          	auipc	a0,0x3
    80004ef0:	6bc50513          	addi	a0,a0,1724 # 800085a8 <CONSOLE_STATUS+0x598>
    80004ef4:	fffff097          	auipc	ra,0xfffff
    80004ef8:	79c080e7          	jalr	1948(ra) # 80004690 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80004efc:	00090513          	mv	a0,s2
    80004f00:	ffffc097          	auipc	ra,0xffffc
    80004f04:	62c080e7          	jalr	1580(ra) # 8000152c <_Z10time_sleepm>
    while (--i > 0) {
    80004f08:	fb9ff06f          	j	80004ec0 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80004f0c:	00a00793          	li	a5,10
    80004f10:	02f95933          	divu	s2,s2,a5
    80004f14:	fff90913          	addi	s2,s2,-1
    80004f18:	00005797          	auipc	a5,0x5
    80004f1c:	46078793          	addi	a5,a5,1120 # 8000a378 <_ZL8finished>
    80004f20:	01278933          	add	s2,a5,s2
    80004f24:	00100793          	li	a5,1
    80004f28:	00f90023          	sb	a5,0(s2)
}
    80004f2c:	01813083          	ld	ra,24(sp)
    80004f30:	01013403          	ld	s0,16(sp)
    80004f34:	00813483          	ld	s1,8(sp)
    80004f38:	00013903          	ld	s2,0(sp)
    80004f3c:	02010113          	addi	sp,sp,32
    80004f40:	00008067          	ret

0000000080004f44 <_Z12testSleepingv>:

void testSleeping() {
    80004f44:	fc010113          	addi	sp,sp,-64
    80004f48:	02113c23          	sd	ra,56(sp)
    80004f4c:	02813823          	sd	s0,48(sp)
    80004f50:	02913423          	sd	s1,40(sp)
    80004f54:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80004f58:	00a00793          	li	a5,10
    80004f5c:	fcf43823          	sd	a5,-48(s0)
    80004f60:	01400793          	li	a5,20
    80004f64:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80004f68:	00000493          	li	s1,0
    80004f6c:	02c0006f          	j	80004f98 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80004f70:	00349793          	slli	a5,s1,0x3
    80004f74:	fd040613          	addi	a2,s0,-48
    80004f78:	00f60633          	add	a2,a2,a5
    80004f7c:	00000597          	auipc	a1,0x0
    80004f80:	f2458593          	addi	a1,a1,-220 # 80004ea0 <_ZL9sleepyRunPv>
    80004f84:	fc040513          	addi	a0,s0,-64
    80004f88:	00f50533          	add	a0,a0,a5
    80004f8c:	ffffc097          	auipc	ra,0xffffc
    80004f90:	3a0080e7          	jalr	928(ra) # 8000132c <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80004f94:	0014849b          	addiw	s1,s1,1
    80004f98:	00100793          	li	a5,1
    80004f9c:	fc97dae3          	bge	a5,s1,80004f70 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80004fa0:	00005797          	auipc	a5,0x5
    80004fa4:	3d87c783          	lbu	a5,984(a5) # 8000a378 <_ZL8finished>
    80004fa8:	fe078ce3          	beqz	a5,80004fa0 <_Z12testSleepingv+0x5c>
    80004fac:	00005797          	auipc	a5,0x5
    80004fb0:	3cd7c783          	lbu	a5,973(a5) # 8000a379 <_ZL8finished+0x1>
    80004fb4:	fe0786e3          	beqz	a5,80004fa0 <_Z12testSleepingv+0x5c>
}
    80004fb8:	03813083          	ld	ra,56(sp)
    80004fbc:	03013403          	ld	s0,48(sp)
    80004fc0:	02813483          	ld	s1,40(sp)
    80004fc4:	04010113          	addi	sp,sp,64
    80004fc8:	00008067          	ret

0000000080004fcc <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004fcc:	fe010113          	addi	sp,sp,-32
    80004fd0:	00113c23          	sd	ra,24(sp)
    80004fd4:	00813823          	sd	s0,16(sp)
    80004fd8:	00913423          	sd	s1,8(sp)
    80004fdc:	01213023          	sd	s2,0(sp)
    80004fe0:	02010413          	addi	s0,sp,32
    80004fe4:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004fe8:	00100793          	li	a5,1
    80004fec:	02a7f863          	bgeu	a5,a0,8000501c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004ff0:	00a00793          	li	a5,10
    80004ff4:	02f577b3          	remu	a5,a0,a5
    80004ff8:	02078e63          	beqz	a5,80005034 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004ffc:	fff48513          	addi	a0,s1,-1
    80005000:	00000097          	auipc	ra,0x0
    80005004:	fcc080e7          	jalr	-52(ra) # 80004fcc <_ZL9fibonaccim>
    80005008:	00050913          	mv	s2,a0
    8000500c:	ffe48513          	addi	a0,s1,-2
    80005010:	00000097          	auipc	ra,0x0
    80005014:	fbc080e7          	jalr	-68(ra) # 80004fcc <_ZL9fibonaccim>
    80005018:	00a90533          	add	a0,s2,a0
}
    8000501c:	01813083          	ld	ra,24(sp)
    80005020:	01013403          	ld	s0,16(sp)
    80005024:	00813483          	ld	s1,8(sp)
    80005028:	00013903          	ld	s2,0(sp)
    8000502c:	02010113          	addi	sp,sp,32
    80005030:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80005034:	ffffc097          	auipc	ra,0xffffc
    80005038:	3b8080e7          	jalr	952(ra) # 800013ec <_Z15thread_dispatchv>
    8000503c:	fc1ff06f          	j	80004ffc <_ZL9fibonaccim+0x30>

0000000080005040 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80005040:	fe010113          	addi	sp,sp,-32
    80005044:	00113c23          	sd	ra,24(sp)
    80005048:	00813823          	sd	s0,16(sp)
    8000504c:	00913423          	sd	s1,8(sp)
    80005050:	01213023          	sd	s2,0(sp)
    80005054:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80005058:	00a00493          	li	s1,10
    8000505c:	0400006f          	j	8000509c <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005060:	00003517          	auipc	a0,0x3
    80005064:	25850513          	addi	a0,a0,600 # 800082b8 <CONSOLE_STATUS+0x2a8>
    80005068:	fffff097          	auipc	ra,0xfffff
    8000506c:	628080e7          	jalr	1576(ra) # 80004690 <_Z11printStringPKc>
    80005070:	00000613          	li	a2,0
    80005074:	00a00593          	li	a1,10
    80005078:	00048513          	mv	a0,s1
    8000507c:	fffff097          	auipc	ra,0xfffff
    80005080:	7c4080e7          	jalr	1988(ra) # 80004840 <_Z8printIntiii>
    80005084:	00003517          	auipc	a0,0x3
    80005088:	45450513          	addi	a0,a0,1108 # 800084d8 <CONSOLE_STATUS+0x4c8>
    8000508c:	fffff097          	auipc	ra,0xfffff
    80005090:	604080e7          	jalr	1540(ra) # 80004690 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80005094:	0014849b          	addiw	s1,s1,1
    80005098:	0ff4f493          	andi	s1,s1,255
    8000509c:	00c00793          	li	a5,12
    800050a0:	fc97f0e3          	bgeu	a5,s1,80005060 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800050a4:	00003517          	auipc	a0,0x3
    800050a8:	21c50513          	addi	a0,a0,540 # 800082c0 <CONSOLE_STATUS+0x2b0>
    800050ac:	fffff097          	auipc	ra,0xfffff
    800050b0:	5e4080e7          	jalr	1508(ra) # 80004690 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800050b4:	00500313          	li	t1,5
    thread_dispatch();
    800050b8:	ffffc097          	auipc	ra,0xffffc
    800050bc:	334080e7          	jalr	820(ra) # 800013ec <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800050c0:	01000513          	li	a0,16
    800050c4:	00000097          	auipc	ra,0x0
    800050c8:	f08080e7          	jalr	-248(ra) # 80004fcc <_ZL9fibonaccim>
    800050cc:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800050d0:	00003517          	auipc	a0,0x3
    800050d4:	20050513          	addi	a0,a0,512 # 800082d0 <CONSOLE_STATUS+0x2c0>
    800050d8:	fffff097          	auipc	ra,0xfffff
    800050dc:	5b8080e7          	jalr	1464(ra) # 80004690 <_Z11printStringPKc>
    800050e0:	00000613          	li	a2,0
    800050e4:	00a00593          	li	a1,10
    800050e8:	0009051b          	sext.w	a0,s2
    800050ec:	fffff097          	auipc	ra,0xfffff
    800050f0:	754080e7          	jalr	1876(ra) # 80004840 <_Z8printIntiii>
    800050f4:	00003517          	auipc	a0,0x3
    800050f8:	3e450513          	addi	a0,a0,996 # 800084d8 <CONSOLE_STATUS+0x4c8>
    800050fc:	fffff097          	auipc	ra,0xfffff
    80005100:	594080e7          	jalr	1428(ra) # 80004690 <_Z11printStringPKc>
    80005104:	0400006f          	j	80005144 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005108:	00003517          	auipc	a0,0x3
    8000510c:	1b050513          	addi	a0,a0,432 # 800082b8 <CONSOLE_STATUS+0x2a8>
    80005110:	fffff097          	auipc	ra,0xfffff
    80005114:	580080e7          	jalr	1408(ra) # 80004690 <_Z11printStringPKc>
    80005118:	00000613          	li	a2,0
    8000511c:	00a00593          	li	a1,10
    80005120:	00048513          	mv	a0,s1
    80005124:	fffff097          	auipc	ra,0xfffff
    80005128:	71c080e7          	jalr	1820(ra) # 80004840 <_Z8printIntiii>
    8000512c:	00003517          	auipc	a0,0x3
    80005130:	3ac50513          	addi	a0,a0,940 # 800084d8 <CONSOLE_STATUS+0x4c8>
    80005134:	fffff097          	auipc	ra,0xfffff
    80005138:	55c080e7          	jalr	1372(ra) # 80004690 <_Z11printStringPKc>
    for (; i < 16; i++) {
    8000513c:	0014849b          	addiw	s1,s1,1
    80005140:	0ff4f493          	andi	s1,s1,255
    80005144:	00f00793          	li	a5,15
    80005148:	fc97f0e3          	bgeu	a5,s1,80005108 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    8000514c:	00003517          	auipc	a0,0x3
    80005150:	19450513          	addi	a0,a0,404 # 800082e0 <CONSOLE_STATUS+0x2d0>
    80005154:	fffff097          	auipc	ra,0xfffff
    80005158:	53c080e7          	jalr	1340(ra) # 80004690 <_Z11printStringPKc>
    finishedD = true;
    8000515c:	00100793          	li	a5,1
    80005160:	00005717          	auipc	a4,0x5
    80005164:	20f70d23          	sb	a5,538(a4) # 8000a37a <_ZL9finishedD>
    thread_dispatch();
    80005168:	ffffc097          	auipc	ra,0xffffc
    8000516c:	284080e7          	jalr	644(ra) # 800013ec <_Z15thread_dispatchv>
}
    80005170:	01813083          	ld	ra,24(sp)
    80005174:	01013403          	ld	s0,16(sp)
    80005178:	00813483          	ld	s1,8(sp)
    8000517c:	00013903          	ld	s2,0(sp)
    80005180:	02010113          	addi	sp,sp,32
    80005184:	00008067          	ret

0000000080005188 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80005188:	fe010113          	addi	sp,sp,-32
    8000518c:	00113c23          	sd	ra,24(sp)
    80005190:	00813823          	sd	s0,16(sp)
    80005194:	00913423          	sd	s1,8(sp)
    80005198:	01213023          	sd	s2,0(sp)
    8000519c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800051a0:	00000493          	li	s1,0
    800051a4:	0400006f          	j	800051e4 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800051a8:	00003517          	auipc	a0,0x3
    800051ac:	0e050513          	addi	a0,a0,224 # 80008288 <CONSOLE_STATUS+0x278>
    800051b0:	fffff097          	auipc	ra,0xfffff
    800051b4:	4e0080e7          	jalr	1248(ra) # 80004690 <_Z11printStringPKc>
    800051b8:	00000613          	li	a2,0
    800051bc:	00a00593          	li	a1,10
    800051c0:	00048513          	mv	a0,s1
    800051c4:	fffff097          	auipc	ra,0xfffff
    800051c8:	67c080e7          	jalr	1660(ra) # 80004840 <_Z8printIntiii>
    800051cc:	00003517          	auipc	a0,0x3
    800051d0:	30c50513          	addi	a0,a0,780 # 800084d8 <CONSOLE_STATUS+0x4c8>
    800051d4:	fffff097          	auipc	ra,0xfffff
    800051d8:	4bc080e7          	jalr	1212(ra) # 80004690 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800051dc:	0014849b          	addiw	s1,s1,1
    800051e0:	0ff4f493          	andi	s1,s1,255
    800051e4:	00200793          	li	a5,2
    800051e8:	fc97f0e3          	bgeu	a5,s1,800051a8 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800051ec:	00003517          	auipc	a0,0x3
    800051f0:	0a450513          	addi	a0,a0,164 # 80008290 <CONSOLE_STATUS+0x280>
    800051f4:	fffff097          	auipc	ra,0xfffff
    800051f8:	49c080e7          	jalr	1180(ra) # 80004690 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800051fc:	00700313          	li	t1,7
    thread_dispatch();
    80005200:	ffffc097          	auipc	ra,0xffffc
    80005204:	1ec080e7          	jalr	492(ra) # 800013ec <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80005208:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    8000520c:	00003517          	auipc	a0,0x3
    80005210:	09450513          	addi	a0,a0,148 # 800082a0 <CONSOLE_STATUS+0x290>
    80005214:	fffff097          	auipc	ra,0xfffff
    80005218:	47c080e7          	jalr	1148(ra) # 80004690 <_Z11printStringPKc>
    8000521c:	00000613          	li	a2,0
    80005220:	00a00593          	li	a1,10
    80005224:	0009051b          	sext.w	a0,s2
    80005228:	fffff097          	auipc	ra,0xfffff
    8000522c:	618080e7          	jalr	1560(ra) # 80004840 <_Z8printIntiii>
    80005230:	00003517          	auipc	a0,0x3
    80005234:	2a850513          	addi	a0,a0,680 # 800084d8 <CONSOLE_STATUS+0x4c8>
    80005238:	fffff097          	auipc	ra,0xfffff
    8000523c:	458080e7          	jalr	1112(ra) # 80004690 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80005240:	00c00513          	li	a0,12
    80005244:	00000097          	auipc	ra,0x0
    80005248:	d88080e7          	jalr	-632(ra) # 80004fcc <_ZL9fibonaccim>
    8000524c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005250:	00003517          	auipc	a0,0x3
    80005254:	05850513          	addi	a0,a0,88 # 800082a8 <CONSOLE_STATUS+0x298>
    80005258:	fffff097          	auipc	ra,0xfffff
    8000525c:	438080e7          	jalr	1080(ra) # 80004690 <_Z11printStringPKc>
    80005260:	00000613          	li	a2,0
    80005264:	00a00593          	li	a1,10
    80005268:	0009051b          	sext.w	a0,s2
    8000526c:	fffff097          	auipc	ra,0xfffff
    80005270:	5d4080e7          	jalr	1492(ra) # 80004840 <_Z8printIntiii>
    80005274:	00003517          	auipc	a0,0x3
    80005278:	26450513          	addi	a0,a0,612 # 800084d8 <CONSOLE_STATUS+0x4c8>
    8000527c:	fffff097          	auipc	ra,0xfffff
    80005280:	414080e7          	jalr	1044(ra) # 80004690 <_Z11printStringPKc>
    80005284:	0400006f          	j	800052c4 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80005288:	00003517          	auipc	a0,0x3
    8000528c:	00050513          	mv	a0,a0
    80005290:	fffff097          	auipc	ra,0xfffff
    80005294:	400080e7          	jalr	1024(ra) # 80004690 <_Z11printStringPKc>
    80005298:	00000613          	li	a2,0
    8000529c:	00a00593          	li	a1,10
    800052a0:	00048513          	mv	a0,s1
    800052a4:	fffff097          	auipc	ra,0xfffff
    800052a8:	59c080e7          	jalr	1436(ra) # 80004840 <_Z8printIntiii>
    800052ac:	00003517          	auipc	a0,0x3
    800052b0:	22c50513          	addi	a0,a0,556 # 800084d8 <CONSOLE_STATUS+0x4c8>
    800052b4:	fffff097          	auipc	ra,0xfffff
    800052b8:	3dc080e7          	jalr	988(ra) # 80004690 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800052bc:	0014849b          	addiw	s1,s1,1
    800052c0:	0ff4f493          	andi	s1,s1,255
    800052c4:	00500793          	li	a5,5
    800052c8:	fc97f0e3          	bgeu	a5,s1,80005288 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    800052cc:	00003517          	auipc	a0,0x3
    800052d0:	f9450513          	addi	a0,a0,-108 # 80008260 <CONSOLE_STATUS+0x250>
    800052d4:	fffff097          	auipc	ra,0xfffff
    800052d8:	3bc080e7          	jalr	956(ra) # 80004690 <_Z11printStringPKc>
    finishedC = true;
    800052dc:	00100793          	li	a5,1
    800052e0:	00005717          	auipc	a4,0x5
    800052e4:	08f70da3          	sb	a5,155(a4) # 8000a37b <_ZL9finishedC>
    thread_dispatch();
    800052e8:	ffffc097          	auipc	ra,0xffffc
    800052ec:	104080e7          	jalr	260(ra) # 800013ec <_Z15thread_dispatchv>
}
    800052f0:	01813083          	ld	ra,24(sp)
    800052f4:	01013403          	ld	s0,16(sp)
    800052f8:	00813483          	ld	s1,8(sp)
    800052fc:	00013903          	ld	s2,0(sp)
    80005300:	02010113          	addi	sp,sp,32
    80005304:	00008067          	ret

0000000080005308 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80005308:	fe010113          	addi	sp,sp,-32
    8000530c:	00113c23          	sd	ra,24(sp)
    80005310:	00813823          	sd	s0,16(sp)
    80005314:	00913423          	sd	s1,8(sp)
    80005318:	01213023          	sd	s2,0(sp)
    8000531c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80005320:	00000913          	li	s2,0
    80005324:	0400006f          	j	80005364 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80005328:	ffffc097          	auipc	ra,0xffffc
    8000532c:	0c4080e7          	jalr	196(ra) # 800013ec <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005330:	00148493          	addi	s1,s1,1
    80005334:	000027b7          	lui	a5,0x2
    80005338:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000533c:	0097ee63          	bltu	a5,s1,80005358 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005340:	00000713          	li	a4,0
    80005344:	000077b7          	lui	a5,0x7
    80005348:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000534c:	fce7eee3          	bltu	a5,a4,80005328 <_ZL11workerBodyBPv+0x20>
    80005350:	00170713          	addi	a4,a4,1
    80005354:	ff1ff06f          	j	80005344 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80005358:	00a00793          	li	a5,10
    8000535c:	04f90663          	beq	s2,a5,800053a8 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80005360:	00190913          	addi	s2,s2,1
    80005364:	00f00793          	li	a5,15
    80005368:	0527e463          	bltu	a5,s2,800053b0 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    8000536c:	00003517          	auipc	a0,0x3
    80005370:	f0450513          	addi	a0,a0,-252 # 80008270 <CONSOLE_STATUS+0x260>
    80005374:	fffff097          	auipc	ra,0xfffff
    80005378:	31c080e7          	jalr	796(ra) # 80004690 <_Z11printStringPKc>
    8000537c:	00000613          	li	a2,0
    80005380:	00a00593          	li	a1,10
    80005384:	0009051b          	sext.w	a0,s2
    80005388:	fffff097          	auipc	ra,0xfffff
    8000538c:	4b8080e7          	jalr	1208(ra) # 80004840 <_Z8printIntiii>
    80005390:	00003517          	auipc	a0,0x3
    80005394:	14850513          	addi	a0,a0,328 # 800084d8 <CONSOLE_STATUS+0x4c8>
    80005398:	fffff097          	auipc	ra,0xfffff
    8000539c:	2f8080e7          	jalr	760(ra) # 80004690 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800053a0:	00000493          	li	s1,0
    800053a4:	f91ff06f          	j	80005334 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    800053a8:	14102ff3          	csrr	t6,sepc
    800053ac:	fb5ff06f          	j	80005360 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    800053b0:	00003517          	auipc	a0,0x3
    800053b4:	ec850513          	addi	a0,a0,-312 # 80008278 <CONSOLE_STATUS+0x268>
    800053b8:	fffff097          	auipc	ra,0xfffff
    800053bc:	2d8080e7          	jalr	728(ra) # 80004690 <_Z11printStringPKc>
    finishedB = true;
    800053c0:	00100793          	li	a5,1
    800053c4:	00005717          	auipc	a4,0x5
    800053c8:	faf70c23          	sb	a5,-72(a4) # 8000a37c <_ZL9finishedB>
    thread_dispatch();
    800053cc:	ffffc097          	auipc	ra,0xffffc
    800053d0:	020080e7          	jalr	32(ra) # 800013ec <_Z15thread_dispatchv>
}
    800053d4:	01813083          	ld	ra,24(sp)
    800053d8:	01013403          	ld	s0,16(sp)
    800053dc:	00813483          	ld	s1,8(sp)
    800053e0:	00013903          	ld	s2,0(sp)
    800053e4:	02010113          	addi	sp,sp,32
    800053e8:	00008067          	ret

00000000800053ec <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800053ec:	fe010113          	addi	sp,sp,-32
    800053f0:	00113c23          	sd	ra,24(sp)
    800053f4:	00813823          	sd	s0,16(sp)
    800053f8:	00913423          	sd	s1,8(sp)
    800053fc:	01213023          	sd	s2,0(sp)
    80005400:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005404:	00000913          	li	s2,0
    80005408:	0380006f          	j	80005440 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    8000540c:	ffffc097          	auipc	ra,0xffffc
    80005410:	fe0080e7          	jalr	-32(ra) # 800013ec <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005414:	00148493          	addi	s1,s1,1
    80005418:	000027b7          	lui	a5,0x2
    8000541c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005420:	0097ee63          	bltu	a5,s1,8000543c <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005424:	00000713          	li	a4,0
    80005428:	000077b7          	lui	a5,0x7
    8000542c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005430:	fce7eee3          	bltu	a5,a4,8000540c <_ZL11workerBodyAPv+0x20>
    80005434:	00170713          	addi	a4,a4,1
    80005438:	ff1ff06f          	j	80005428 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    8000543c:	00190913          	addi	s2,s2,1
    80005440:	00900793          	li	a5,9
    80005444:	0527e063          	bltu	a5,s2,80005484 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80005448:	00003517          	auipc	a0,0x3
    8000544c:	e1050513          	addi	a0,a0,-496 # 80008258 <CONSOLE_STATUS+0x248>
    80005450:	fffff097          	auipc	ra,0xfffff
    80005454:	240080e7          	jalr	576(ra) # 80004690 <_Z11printStringPKc>
    80005458:	00000613          	li	a2,0
    8000545c:	00a00593          	li	a1,10
    80005460:	0009051b          	sext.w	a0,s2
    80005464:	fffff097          	auipc	ra,0xfffff
    80005468:	3dc080e7          	jalr	988(ra) # 80004840 <_Z8printIntiii>
    8000546c:	00003517          	auipc	a0,0x3
    80005470:	06c50513          	addi	a0,a0,108 # 800084d8 <CONSOLE_STATUS+0x4c8>
    80005474:	fffff097          	auipc	ra,0xfffff
    80005478:	21c080e7          	jalr	540(ra) # 80004690 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000547c:	00000493          	li	s1,0
    80005480:	f99ff06f          	j	80005418 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80005484:	00003517          	auipc	a0,0x3
    80005488:	ddc50513          	addi	a0,a0,-548 # 80008260 <CONSOLE_STATUS+0x250>
    8000548c:	fffff097          	auipc	ra,0xfffff
    80005490:	204080e7          	jalr	516(ra) # 80004690 <_Z11printStringPKc>
    finishedA = true;
    80005494:	00100793          	li	a5,1
    80005498:	00005717          	auipc	a4,0x5
    8000549c:	eef702a3          	sb	a5,-283(a4) # 8000a37d <_ZL9finishedA>
}
    800054a0:	01813083          	ld	ra,24(sp)
    800054a4:	01013403          	ld	s0,16(sp)
    800054a8:	00813483          	ld	s1,8(sp)
    800054ac:	00013903          	ld	s2,0(sp)
    800054b0:	02010113          	addi	sp,sp,32
    800054b4:	00008067          	ret

00000000800054b8 <_Z16System_Mode_testv>:


void System_Mode_test() {
    800054b8:	fd010113          	addi	sp,sp,-48
    800054bc:	02113423          	sd	ra,40(sp)
    800054c0:	02813023          	sd	s0,32(sp)
    800054c4:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800054c8:	00000613          	li	a2,0
    800054cc:	00000597          	auipc	a1,0x0
    800054d0:	f2058593          	addi	a1,a1,-224 # 800053ec <_ZL11workerBodyAPv>
    800054d4:	fd040513          	addi	a0,s0,-48
    800054d8:	ffffc097          	auipc	ra,0xffffc
    800054dc:	e54080e7          	jalr	-428(ra) # 8000132c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    800054e0:	00003517          	auipc	a0,0x3
    800054e4:	e1050513          	addi	a0,a0,-496 # 800082f0 <CONSOLE_STATUS+0x2e0>
    800054e8:	fffff097          	auipc	ra,0xfffff
    800054ec:	1a8080e7          	jalr	424(ra) # 80004690 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800054f0:	00000613          	li	a2,0
    800054f4:	00000597          	auipc	a1,0x0
    800054f8:	e1458593          	addi	a1,a1,-492 # 80005308 <_ZL11workerBodyBPv>
    800054fc:	fd840513          	addi	a0,s0,-40
    80005500:	ffffc097          	auipc	ra,0xffffc
    80005504:	e2c080e7          	jalr	-468(ra) # 8000132c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80005508:	00003517          	auipc	a0,0x3
    8000550c:	e0050513          	addi	a0,a0,-512 # 80008308 <CONSOLE_STATUS+0x2f8>
    80005510:	fffff097          	auipc	ra,0xfffff
    80005514:	180080e7          	jalr	384(ra) # 80004690 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80005518:	00000613          	li	a2,0
    8000551c:	00000597          	auipc	a1,0x0
    80005520:	c6c58593          	addi	a1,a1,-916 # 80005188 <_ZL11workerBodyCPv>
    80005524:	fe040513          	addi	a0,s0,-32
    80005528:	ffffc097          	auipc	ra,0xffffc
    8000552c:	e04080e7          	jalr	-508(ra) # 8000132c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80005530:	00003517          	auipc	a0,0x3
    80005534:	df050513          	addi	a0,a0,-528 # 80008320 <CONSOLE_STATUS+0x310>
    80005538:	fffff097          	auipc	ra,0xfffff
    8000553c:	158080e7          	jalr	344(ra) # 80004690 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80005540:	00000613          	li	a2,0
    80005544:	00000597          	auipc	a1,0x0
    80005548:	afc58593          	addi	a1,a1,-1284 # 80005040 <_ZL11workerBodyDPv>
    8000554c:	fe840513          	addi	a0,s0,-24
    80005550:	ffffc097          	auipc	ra,0xffffc
    80005554:	ddc080e7          	jalr	-548(ra) # 8000132c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80005558:	00003517          	auipc	a0,0x3
    8000555c:	de050513          	addi	a0,a0,-544 # 80008338 <CONSOLE_STATUS+0x328>
    80005560:	fffff097          	auipc	ra,0xfffff
    80005564:	130080e7          	jalr	304(ra) # 80004690 <_Z11printStringPKc>
    80005568:	00c0006f          	j	80005574 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    8000556c:	ffffc097          	auipc	ra,0xffffc
    80005570:	e80080e7          	jalr	-384(ra) # 800013ec <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80005574:	00005797          	auipc	a5,0x5
    80005578:	e097c783          	lbu	a5,-503(a5) # 8000a37d <_ZL9finishedA>
    8000557c:	fe0788e3          	beqz	a5,8000556c <_Z16System_Mode_testv+0xb4>
    80005580:	00005797          	auipc	a5,0x5
    80005584:	dfc7c783          	lbu	a5,-516(a5) # 8000a37c <_ZL9finishedB>
    80005588:	fe0782e3          	beqz	a5,8000556c <_Z16System_Mode_testv+0xb4>
    8000558c:	00005797          	auipc	a5,0x5
    80005590:	def7c783          	lbu	a5,-529(a5) # 8000a37b <_ZL9finishedC>
    80005594:	fc078ce3          	beqz	a5,8000556c <_Z16System_Mode_testv+0xb4>
    80005598:	00005797          	auipc	a5,0x5
    8000559c:	de27c783          	lbu	a5,-542(a5) # 8000a37a <_ZL9finishedD>
    800055a0:	fc0786e3          	beqz	a5,8000556c <_Z16System_Mode_testv+0xb4>
    }

}
    800055a4:	02813083          	ld	ra,40(sp)
    800055a8:	02013403          	ld	s0,32(sp)
    800055ac:	03010113          	addi	sp,sp,48
    800055b0:	00008067          	ret

00000000800055b4 <_ZN6BufferC1Ei>:
#include "buffer.hpp"
#include "../lib/console.h"
Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800055b4:	fe010113          	addi	sp,sp,-32
    800055b8:	00113c23          	sd	ra,24(sp)
    800055bc:	00813823          	sd	s0,16(sp)
    800055c0:	00913423          	sd	s1,8(sp)
    800055c4:	01213023          	sd	s2,0(sp)
    800055c8:	02010413          	addi	s0,sp,32
    800055cc:	00050493          	mv	s1,a0
    800055d0:	00058913          	mv	s2,a1
    800055d4:	0015879b          	addiw	a5,a1,1
    800055d8:	0007851b          	sext.w	a0,a5
    800055dc:	00f4a023          	sw	a5,0(s1)
    800055e0:	0004a823          	sw	zero,16(s1)
    800055e4:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800055e8:	00251513          	slli	a0,a0,0x2
    800055ec:	ffffc097          	auipc	ra,0xffffc
    800055f0:	cb4080e7          	jalr	-844(ra) # 800012a0 <_Z9mem_allocm>
    800055f4:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    800055f8:	00000593          	li	a1,0
    800055fc:	02048513          	addi	a0,s1,32
    80005600:	ffffc097          	auipc	ra,0xffffc
    80005604:	e28080e7          	jalr	-472(ra) # 80001428 <_Z8sem_openPP10KSemaphorej>
    sem_open(&spaceAvailable, _cap);
    80005608:	00090593          	mv	a1,s2
    8000560c:	01848513          	addi	a0,s1,24
    80005610:	ffffc097          	auipc	ra,0xffffc
    80005614:	e18080e7          	jalr	-488(ra) # 80001428 <_Z8sem_openPP10KSemaphorej>
    sem_open(&mutexHead, 1);
    80005618:	00100593          	li	a1,1
    8000561c:	02848513          	addi	a0,s1,40
    80005620:	ffffc097          	auipc	ra,0xffffc
    80005624:	e08080e7          	jalr	-504(ra) # 80001428 <_Z8sem_openPP10KSemaphorej>
    sem_open(&mutexTail, 1);
    80005628:	00100593          	li	a1,1
    8000562c:	03048513          	addi	a0,s1,48
    80005630:	ffffc097          	auipc	ra,0xffffc
    80005634:	df8080e7          	jalr	-520(ra) # 80001428 <_Z8sem_openPP10KSemaphorej>
}
    80005638:	01813083          	ld	ra,24(sp)
    8000563c:	01013403          	ld	s0,16(sp)
    80005640:	00813483          	ld	s1,8(sp)
    80005644:	00013903          	ld	s2,0(sp)
    80005648:	02010113          	addi	sp,sp,32
    8000564c:	00008067          	ret

0000000080005650 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80005650:	fe010113          	addi	sp,sp,-32
    80005654:	00113c23          	sd	ra,24(sp)
    80005658:	00813823          	sd	s0,16(sp)
    8000565c:	00913423          	sd	s1,8(sp)
    80005660:	01213023          	sd	s2,0(sp)
    80005664:	02010413          	addi	s0,sp,32
    80005668:	00050493          	mv	s1,a0
    8000566c:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80005670:	01853503          	ld	a0,24(a0)
    80005674:	ffffc097          	auipc	ra,0xffffc
    80005678:	e38080e7          	jalr	-456(ra) # 800014ac <_Z8sem_waitP10KSemaphore>

    sem_wait(mutexTail);
    8000567c:	0304b503          	ld	a0,48(s1)
    80005680:	ffffc097          	auipc	ra,0xffffc
    80005684:	e2c080e7          	jalr	-468(ra) # 800014ac <_Z8sem_waitP10KSemaphore>
    buffer[tail] = val;
    80005688:	0084b783          	ld	a5,8(s1)
    8000568c:	0144a703          	lw	a4,20(s1)
    80005690:	00271713          	slli	a4,a4,0x2
    80005694:	00e787b3          	add	a5,a5,a4
    80005698:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    8000569c:	0144a783          	lw	a5,20(s1)
    800056a0:	0017879b          	addiw	a5,a5,1
    800056a4:	0004a703          	lw	a4,0(s1)
    800056a8:	02e7e7bb          	remw	a5,a5,a4
    800056ac:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    800056b0:	0304b503          	ld	a0,48(s1)
    800056b4:	ffffc097          	auipc	ra,0xffffc
    800056b8:	e38080e7          	jalr	-456(ra) # 800014ec <_Z10sem_signalP10KSemaphore>

    sem_signal(itemAvailable);
    800056bc:	0204b503          	ld	a0,32(s1)
    800056c0:	ffffc097          	auipc	ra,0xffffc
    800056c4:	e2c080e7          	jalr	-468(ra) # 800014ec <_Z10sem_signalP10KSemaphore>

}
    800056c8:	01813083          	ld	ra,24(sp)
    800056cc:	01013403          	ld	s0,16(sp)
    800056d0:	00813483          	ld	s1,8(sp)
    800056d4:	00013903          	ld	s2,0(sp)
    800056d8:	02010113          	addi	sp,sp,32
    800056dc:	00008067          	ret

00000000800056e0 <_ZN6Buffer3getEv>:

int Buffer::get() {
    800056e0:	fe010113          	addi	sp,sp,-32
    800056e4:	00113c23          	sd	ra,24(sp)
    800056e8:	00813823          	sd	s0,16(sp)
    800056ec:	00913423          	sd	s1,8(sp)
    800056f0:	01213023          	sd	s2,0(sp)
    800056f4:	02010413          	addi	s0,sp,32
    800056f8:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    800056fc:	02053503          	ld	a0,32(a0)
    80005700:	ffffc097          	auipc	ra,0xffffc
    80005704:	dac080e7          	jalr	-596(ra) # 800014ac <_Z8sem_waitP10KSemaphore>

    sem_wait(mutexHead);
    80005708:	0284b503          	ld	a0,40(s1)
    8000570c:	ffffc097          	auipc	ra,0xffffc
    80005710:	da0080e7          	jalr	-608(ra) # 800014ac <_Z8sem_waitP10KSemaphore>

    int ret = buffer[head];
    80005714:	0084b703          	ld	a4,8(s1)
    80005718:	0104a783          	lw	a5,16(s1)
    8000571c:	00279693          	slli	a3,a5,0x2
    80005720:	00d70733          	add	a4,a4,a3
    80005724:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005728:	0017879b          	addiw	a5,a5,1
    8000572c:	0004a703          	lw	a4,0(s1)
    80005730:	02e7e7bb          	remw	a5,a5,a4
    80005734:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80005738:	0284b503          	ld	a0,40(s1)
    8000573c:	ffffc097          	auipc	ra,0xffffc
    80005740:	db0080e7          	jalr	-592(ra) # 800014ec <_Z10sem_signalP10KSemaphore>

    sem_signal(spaceAvailable);
    80005744:	0184b503          	ld	a0,24(s1)
    80005748:	ffffc097          	auipc	ra,0xffffc
    8000574c:	da4080e7          	jalr	-604(ra) # 800014ec <_Z10sem_signalP10KSemaphore>

    return ret;
}
    80005750:	00090513          	mv	a0,s2
    80005754:	01813083          	ld	ra,24(sp)
    80005758:	01013403          	ld	s0,16(sp)
    8000575c:	00813483          	ld	s1,8(sp)
    80005760:	00013903          	ld	s2,0(sp)
    80005764:	02010113          	addi	sp,sp,32
    80005768:	00008067          	ret

000000008000576c <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    8000576c:	fe010113          	addi	sp,sp,-32
    80005770:	00113c23          	sd	ra,24(sp)
    80005774:	00813823          	sd	s0,16(sp)
    80005778:	00913423          	sd	s1,8(sp)
    8000577c:	01213023          	sd	s2,0(sp)
    80005780:	02010413          	addi	s0,sp,32
    80005784:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80005788:	02853503          	ld	a0,40(a0)
    8000578c:	ffffc097          	auipc	ra,0xffffc
    80005790:	d20080e7          	jalr	-736(ra) # 800014ac <_Z8sem_waitP10KSemaphore>
    sem_wait(mutexTail);
    80005794:	0304b503          	ld	a0,48(s1)
    80005798:	ffffc097          	auipc	ra,0xffffc
    8000579c:	d14080e7          	jalr	-748(ra) # 800014ac <_Z8sem_waitP10KSemaphore>

    if (tail >= head) {
    800057a0:	0144a783          	lw	a5,20(s1)
    800057a4:	0104a903          	lw	s2,16(s1)
    800057a8:	0327ce63          	blt	a5,s2,800057e4 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    800057ac:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    800057b0:	0304b503          	ld	a0,48(s1)
    800057b4:	ffffc097          	auipc	ra,0xffffc
    800057b8:	d38080e7          	jalr	-712(ra) # 800014ec <_Z10sem_signalP10KSemaphore>
    sem_signal(mutexHead);
    800057bc:	0284b503          	ld	a0,40(s1)
    800057c0:	ffffc097          	auipc	ra,0xffffc
    800057c4:	d2c080e7          	jalr	-724(ra) # 800014ec <_Z10sem_signalP10KSemaphore>

    return ret;
}
    800057c8:	00090513          	mv	a0,s2
    800057cc:	01813083          	ld	ra,24(sp)
    800057d0:	01013403          	ld	s0,16(sp)
    800057d4:	00813483          	ld	s1,8(sp)
    800057d8:	00013903          	ld	s2,0(sp)
    800057dc:	02010113          	addi	sp,sp,32
    800057e0:	00008067          	ret
        ret = cap - head + tail;
    800057e4:	0004a703          	lw	a4,0(s1)
    800057e8:	4127093b          	subw	s2,a4,s2
    800057ec:	00f9093b          	addw	s2,s2,a5
    800057f0:	fc1ff06f          	j	800057b0 <_ZN6Buffer6getCntEv+0x44>

00000000800057f4 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    800057f4:	fe010113          	addi	sp,sp,-32
    800057f8:	00113c23          	sd	ra,24(sp)
    800057fc:	00813823          	sd	s0,16(sp)
    80005800:	00913423          	sd	s1,8(sp)
    80005804:	02010413          	addi	s0,sp,32
    80005808:	00050493          	mv	s1,a0
    __putc('\n');
    8000580c:	00a00513          	li	a0,10
    80005810:	00002097          	auipc	ra,0x2
    80005814:	3b0080e7          	jalr	944(ra) # 80007bc0 <__putc>
    printString("Buffer deleted!\n");
    80005818:	00003517          	auipc	a0,0x3
    8000581c:	b3850513          	addi	a0,a0,-1224 # 80008350 <CONSOLE_STATUS+0x340>
    80005820:	fffff097          	auipc	ra,0xfffff
    80005824:	e70080e7          	jalr	-400(ra) # 80004690 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80005828:	00048513          	mv	a0,s1
    8000582c:	00000097          	auipc	ra,0x0
    80005830:	f40080e7          	jalr	-192(ra) # 8000576c <_ZN6Buffer6getCntEv>
    80005834:	02a05c63          	blez	a0,8000586c <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80005838:	0084b783          	ld	a5,8(s1)
    8000583c:	0104a703          	lw	a4,16(s1)
    80005840:	00271713          	slli	a4,a4,0x2
    80005844:	00e787b3          	add	a5,a5,a4
        __putc(ch);
    80005848:	0007c503          	lbu	a0,0(a5)
    8000584c:	00002097          	auipc	ra,0x2
    80005850:	374080e7          	jalr	884(ra) # 80007bc0 <__putc>
        head = (head + 1) % cap;
    80005854:	0104a783          	lw	a5,16(s1)
    80005858:	0017879b          	addiw	a5,a5,1
    8000585c:	0004a703          	lw	a4,0(s1)
    80005860:	02e7e7bb          	remw	a5,a5,a4
    80005864:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80005868:	fc1ff06f          	j	80005828 <_ZN6BufferD1Ev+0x34>
    __putc('!');
    8000586c:	02100513          	li	a0,33
    80005870:	00002097          	auipc	ra,0x2
    80005874:	350080e7          	jalr	848(ra) # 80007bc0 <__putc>
    __putc('\n');
    80005878:	00a00513          	li	a0,10
    8000587c:	00002097          	auipc	ra,0x2
    80005880:	344080e7          	jalr	836(ra) # 80007bc0 <__putc>
    mem_free(buffer);
    80005884:	0084b503          	ld	a0,8(s1)
    80005888:	ffffc097          	auipc	ra,0xffffc
    8000588c:	a64080e7          	jalr	-1436(ra) # 800012ec <_Z8mem_freePv>
    sem_close(itemAvailable);
    80005890:	0204b503          	ld	a0,32(s1)
    80005894:	ffffc097          	auipc	ra,0xffffc
    80005898:	bd8080e7          	jalr	-1064(ra) # 8000146c <_Z9sem_closeP10KSemaphore>
    sem_close(spaceAvailable);
    8000589c:	0184b503          	ld	a0,24(s1)
    800058a0:	ffffc097          	auipc	ra,0xffffc
    800058a4:	bcc080e7          	jalr	-1076(ra) # 8000146c <_Z9sem_closeP10KSemaphore>
    sem_close(mutexTail);
    800058a8:	0304b503          	ld	a0,48(s1)
    800058ac:	ffffc097          	auipc	ra,0xffffc
    800058b0:	bc0080e7          	jalr	-1088(ra) # 8000146c <_Z9sem_closeP10KSemaphore>
    sem_close(mutexHead);
    800058b4:	0284b503          	ld	a0,40(s1)
    800058b8:	ffffc097          	auipc	ra,0xffffc
    800058bc:	bb4080e7          	jalr	-1100(ra) # 8000146c <_Z9sem_closeP10KSemaphore>
}
    800058c0:	01813083          	ld	ra,24(sp)
    800058c4:	01013403          	ld	s0,16(sp)
    800058c8:	00813483          	ld	s1,8(sp)
    800058cc:	02010113          	addi	sp,sp,32
    800058d0:	00008067          	ret

00000000800058d4 <start>:
    800058d4:	ff010113          	addi	sp,sp,-16
    800058d8:	00813423          	sd	s0,8(sp)
    800058dc:	01010413          	addi	s0,sp,16
    800058e0:	300027f3          	csrr	a5,mstatus
    800058e4:	ffffe737          	lui	a4,0xffffe
    800058e8:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff320f>
    800058ec:	00e7f7b3          	and	a5,a5,a4
    800058f0:	00001737          	lui	a4,0x1
    800058f4:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800058f8:	00e7e7b3          	or	a5,a5,a4
    800058fc:	30079073          	csrw	mstatus,a5
    80005900:	00000797          	auipc	a5,0x0
    80005904:	16078793          	addi	a5,a5,352 # 80005a60 <system_main>
    80005908:	34179073          	csrw	mepc,a5
    8000590c:	00000793          	li	a5,0
    80005910:	18079073          	csrw	satp,a5
    80005914:	000107b7          	lui	a5,0x10
    80005918:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000591c:	30279073          	csrw	medeleg,a5
    80005920:	30379073          	csrw	mideleg,a5
    80005924:	104027f3          	csrr	a5,sie
    80005928:	2227e793          	ori	a5,a5,546
    8000592c:	10479073          	csrw	sie,a5
    80005930:	fff00793          	li	a5,-1
    80005934:	00a7d793          	srli	a5,a5,0xa
    80005938:	3b079073          	csrw	pmpaddr0,a5
    8000593c:	00f00793          	li	a5,15
    80005940:	3a079073          	csrw	pmpcfg0,a5
    80005944:	f14027f3          	csrr	a5,mhartid
    80005948:	0200c737          	lui	a4,0x200c
    8000594c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80005950:	0007869b          	sext.w	a3,a5
    80005954:	00269713          	slli	a4,a3,0x2
    80005958:	000f4637          	lui	a2,0xf4
    8000595c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80005960:	00d70733          	add	a4,a4,a3
    80005964:	0037979b          	slliw	a5,a5,0x3
    80005968:	020046b7          	lui	a3,0x2004
    8000596c:	00d787b3          	add	a5,a5,a3
    80005970:	00c585b3          	add	a1,a1,a2
    80005974:	00371693          	slli	a3,a4,0x3
    80005978:	00005717          	auipc	a4,0x5
    8000597c:	a0870713          	addi	a4,a4,-1528 # 8000a380 <timer_scratch>
    80005980:	00b7b023          	sd	a1,0(a5)
    80005984:	00d70733          	add	a4,a4,a3
    80005988:	00f73c23          	sd	a5,24(a4)
    8000598c:	02c73023          	sd	a2,32(a4)
    80005990:	34071073          	csrw	mscratch,a4
    80005994:	00000797          	auipc	a5,0x0
    80005998:	6ec78793          	addi	a5,a5,1772 # 80006080 <timervec>
    8000599c:	30579073          	csrw	mtvec,a5
    800059a0:	300027f3          	csrr	a5,mstatus
    800059a4:	0087e793          	ori	a5,a5,8
    800059a8:	30079073          	csrw	mstatus,a5
    800059ac:	304027f3          	csrr	a5,mie
    800059b0:	0807e793          	ori	a5,a5,128
    800059b4:	30479073          	csrw	mie,a5
    800059b8:	f14027f3          	csrr	a5,mhartid
    800059bc:	0007879b          	sext.w	a5,a5
    800059c0:	00078213          	mv	tp,a5
    800059c4:	30200073          	mret
    800059c8:	00813403          	ld	s0,8(sp)
    800059cc:	01010113          	addi	sp,sp,16
    800059d0:	00008067          	ret

00000000800059d4 <timerinit>:
    800059d4:	ff010113          	addi	sp,sp,-16
    800059d8:	00813423          	sd	s0,8(sp)
    800059dc:	01010413          	addi	s0,sp,16
    800059e0:	f14027f3          	csrr	a5,mhartid
    800059e4:	0200c737          	lui	a4,0x200c
    800059e8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800059ec:	0007869b          	sext.w	a3,a5
    800059f0:	00269713          	slli	a4,a3,0x2
    800059f4:	000f4637          	lui	a2,0xf4
    800059f8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800059fc:	00d70733          	add	a4,a4,a3
    80005a00:	0037979b          	slliw	a5,a5,0x3
    80005a04:	020046b7          	lui	a3,0x2004
    80005a08:	00d787b3          	add	a5,a5,a3
    80005a0c:	00c585b3          	add	a1,a1,a2
    80005a10:	00371693          	slli	a3,a4,0x3
    80005a14:	00005717          	auipc	a4,0x5
    80005a18:	96c70713          	addi	a4,a4,-1684 # 8000a380 <timer_scratch>
    80005a1c:	00b7b023          	sd	a1,0(a5)
    80005a20:	00d70733          	add	a4,a4,a3
    80005a24:	00f73c23          	sd	a5,24(a4)
    80005a28:	02c73023          	sd	a2,32(a4)
    80005a2c:	34071073          	csrw	mscratch,a4
    80005a30:	00000797          	auipc	a5,0x0
    80005a34:	65078793          	addi	a5,a5,1616 # 80006080 <timervec>
    80005a38:	30579073          	csrw	mtvec,a5
    80005a3c:	300027f3          	csrr	a5,mstatus
    80005a40:	0087e793          	ori	a5,a5,8
    80005a44:	30079073          	csrw	mstatus,a5
    80005a48:	304027f3          	csrr	a5,mie
    80005a4c:	0807e793          	ori	a5,a5,128
    80005a50:	30479073          	csrw	mie,a5
    80005a54:	00813403          	ld	s0,8(sp)
    80005a58:	01010113          	addi	sp,sp,16
    80005a5c:	00008067          	ret

0000000080005a60 <system_main>:
    80005a60:	fe010113          	addi	sp,sp,-32
    80005a64:	00813823          	sd	s0,16(sp)
    80005a68:	00913423          	sd	s1,8(sp)
    80005a6c:	00113c23          	sd	ra,24(sp)
    80005a70:	02010413          	addi	s0,sp,32
    80005a74:	00000097          	auipc	ra,0x0
    80005a78:	0c4080e7          	jalr	196(ra) # 80005b38 <cpuid>
    80005a7c:	00005497          	auipc	s1,0x5
    80005a80:	86448493          	addi	s1,s1,-1948 # 8000a2e0 <started>
    80005a84:	02050263          	beqz	a0,80005aa8 <system_main+0x48>
    80005a88:	0004a783          	lw	a5,0(s1)
    80005a8c:	0007879b          	sext.w	a5,a5
    80005a90:	fe078ce3          	beqz	a5,80005a88 <system_main+0x28>
    80005a94:	0ff0000f          	fence
    80005a98:	00003517          	auipc	a0,0x3
    80005a9c:	b4850513          	addi	a0,a0,-1208 # 800085e0 <CONSOLE_STATUS+0x5d0>
    80005aa0:	00001097          	auipc	ra,0x1
    80005aa4:	a7c080e7          	jalr	-1412(ra) # 8000651c <panic>
    80005aa8:	00001097          	auipc	ra,0x1
    80005aac:	9d0080e7          	jalr	-1584(ra) # 80006478 <consoleinit>
    80005ab0:	00001097          	auipc	ra,0x1
    80005ab4:	15c080e7          	jalr	348(ra) # 80006c0c <printfinit>
    80005ab8:	00003517          	auipc	a0,0x3
    80005abc:	a2050513          	addi	a0,a0,-1504 # 800084d8 <CONSOLE_STATUS+0x4c8>
    80005ac0:	00001097          	auipc	ra,0x1
    80005ac4:	ab8080e7          	jalr	-1352(ra) # 80006578 <__printf>
    80005ac8:	00003517          	auipc	a0,0x3
    80005acc:	ae850513          	addi	a0,a0,-1304 # 800085b0 <CONSOLE_STATUS+0x5a0>
    80005ad0:	00001097          	auipc	ra,0x1
    80005ad4:	aa8080e7          	jalr	-1368(ra) # 80006578 <__printf>
    80005ad8:	00003517          	auipc	a0,0x3
    80005adc:	a0050513          	addi	a0,a0,-1536 # 800084d8 <CONSOLE_STATUS+0x4c8>
    80005ae0:	00001097          	auipc	ra,0x1
    80005ae4:	a98080e7          	jalr	-1384(ra) # 80006578 <__printf>
    80005ae8:	00001097          	auipc	ra,0x1
    80005aec:	4b0080e7          	jalr	1200(ra) # 80006f98 <kinit>
    80005af0:	00000097          	auipc	ra,0x0
    80005af4:	148080e7          	jalr	328(ra) # 80005c38 <trapinit>
    80005af8:	00000097          	auipc	ra,0x0
    80005afc:	16c080e7          	jalr	364(ra) # 80005c64 <trapinithart>
    80005b00:	00000097          	auipc	ra,0x0
    80005b04:	5c0080e7          	jalr	1472(ra) # 800060c0 <plicinit>
    80005b08:	00000097          	auipc	ra,0x0
    80005b0c:	5e0080e7          	jalr	1504(ra) # 800060e8 <plicinithart>
    80005b10:	00000097          	auipc	ra,0x0
    80005b14:	078080e7          	jalr	120(ra) # 80005b88 <userinit>
    80005b18:	0ff0000f          	fence
    80005b1c:	00100793          	li	a5,1
    80005b20:	00003517          	auipc	a0,0x3
    80005b24:	aa850513          	addi	a0,a0,-1368 # 800085c8 <CONSOLE_STATUS+0x5b8>
    80005b28:	00f4a023          	sw	a5,0(s1)
    80005b2c:	00001097          	auipc	ra,0x1
    80005b30:	a4c080e7          	jalr	-1460(ra) # 80006578 <__printf>
    80005b34:	0000006f          	j	80005b34 <system_main+0xd4>

0000000080005b38 <cpuid>:
    80005b38:	ff010113          	addi	sp,sp,-16
    80005b3c:	00813423          	sd	s0,8(sp)
    80005b40:	01010413          	addi	s0,sp,16
    80005b44:	00020513          	mv	a0,tp
    80005b48:	00813403          	ld	s0,8(sp)
    80005b4c:	0005051b          	sext.w	a0,a0
    80005b50:	01010113          	addi	sp,sp,16
    80005b54:	00008067          	ret

0000000080005b58 <mycpu>:
    80005b58:	ff010113          	addi	sp,sp,-16
    80005b5c:	00813423          	sd	s0,8(sp)
    80005b60:	01010413          	addi	s0,sp,16
    80005b64:	00020793          	mv	a5,tp
    80005b68:	00813403          	ld	s0,8(sp)
    80005b6c:	0007879b          	sext.w	a5,a5
    80005b70:	00779793          	slli	a5,a5,0x7
    80005b74:	00006517          	auipc	a0,0x6
    80005b78:	83c50513          	addi	a0,a0,-1988 # 8000b3b0 <cpus>
    80005b7c:	00f50533          	add	a0,a0,a5
    80005b80:	01010113          	addi	sp,sp,16
    80005b84:	00008067          	ret

0000000080005b88 <userinit>:
    80005b88:	ff010113          	addi	sp,sp,-16
    80005b8c:	00813423          	sd	s0,8(sp)
    80005b90:	01010413          	addi	s0,sp,16
    80005b94:	00813403          	ld	s0,8(sp)
    80005b98:	01010113          	addi	sp,sp,16
    80005b9c:	ffffc317          	auipc	t1,0xffffc
    80005ba0:	bd430067          	jr	-1068(t1) # 80001770 <main>

0000000080005ba4 <either_copyout>:
    80005ba4:	ff010113          	addi	sp,sp,-16
    80005ba8:	00813023          	sd	s0,0(sp)
    80005bac:	00113423          	sd	ra,8(sp)
    80005bb0:	01010413          	addi	s0,sp,16
    80005bb4:	02051663          	bnez	a0,80005be0 <either_copyout+0x3c>
    80005bb8:	00058513          	mv	a0,a1
    80005bbc:	00060593          	mv	a1,a2
    80005bc0:	0006861b          	sext.w	a2,a3
    80005bc4:	00002097          	auipc	ra,0x2
    80005bc8:	c60080e7          	jalr	-928(ra) # 80007824 <__memmove>
    80005bcc:	00813083          	ld	ra,8(sp)
    80005bd0:	00013403          	ld	s0,0(sp)
    80005bd4:	00000513          	li	a0,0
    80005bd8:	01010113          	addi	sp,sp,16
    80005bdc:	00008067          	ret
    80005be0:	00003517          	auipc	a0,0x3
    80005be4:	a2850513          	addi	a0,a0,-1496 # 80008608 <CONSOLE_STATUS+0x5f8>
    80005be8:	00001097          	auipc	ra,0x1
    80005bec:	934080e7          	jalr	-1740(ra) # 8000651c <panic>

0000000080005bf0 <either_copyin>:
    80005bf0:	ff010113          	addi	sp,sp,-16
    80005bf4:	00813023          	sd	s0,0(sp)
    80005bf8:	00113423          	sd	ra,8(sp)
    80005bfc:	01010413          	addi	s0,sp,16
    80005c00:	02059463          	bnez	a1,80005c28 <either_copyin+0x38>
    80005c04:	00060593          	mv	a1,a2
    80005c08:	0006861b          	sext.w	a2,a3
    80005c0c:	00002097          	auipc	ra,0x2
    80005c10:	c18080e7          	jalr	-1000(ra) # 80007824 <__memmove>
    80005c14:	00813083          	ld	ra,8(sp)
    80005c18:	00013403          	ld	s0,0(sp)
    80005c1c:	00000513          	li	a0,0
    80005c20:	01010113          	addi	sp,sp,16
    80005c24:	00008067          	ret
    80005c28:	00003517          	auipc	a0,0x3
    80005c2c:	a0850513          	addi	a0,a0,-1528 # 80008630 <CONSOLE_STATUS+0x620>
    80005c30:	00001097          	auipc	ra,0x1
    80005c34:	8ec080e7          	jalr	-1812(ra) # 8000651c <panic>

0000000080005c38 <trapinit>:
    80005c38:	ff010113          	addi	sp,sp,-16
    80005c3c:	00813423          	sd	s0,8(sp)
    80005c40:	01010413          	addi	s0,sp,16
    80005c44:	00813403          	ld	s0,8(sp)
    80005c48:	00003597          	auipc	a1,0x3
    80005c4c:	a1058593          	addi	a1,a1,-1520 # 80008658 <CONSOLE_STATUS+0x648>
    80005c50:	00005517          	auipc	a0,0x5
    80005c54:	7e050513          	addi	a0,a0,2016 # 8000b430 <tickslock>
    80005c58:	01010113          	addi	sp,sp,16
    80005c5c:	00001317          	auipc	t1,0x1
    80005c60:	5cc30067          	jr	1484(t1) # 80007228 <initlock>

0000000080005c64 <trapinithart>:
    80005c64:	ff010113          	addi	sp,sp,-16
    80005c68:	00813423          	sd	s0,8(sp)
    80005c6c:	01010413          	addi	s0,sp,16
    80005c70:	00000797          	auipc	a5,0x0
    80005c74:	30078793          	addi	a5,a5,768 # 80005f70 <kernelvec>
    80005c78:	10579073          	csrw	stvec,a5
    80005c7c:	00813403          	ld	s0,8(sp)
    80005c80:	01010113          	addi	sp,sp,16
    80005c84:	00008067          	ret

0000000080005c88 <usertrap>:
    80005c88:	ff010113          	addi	sp,sp,-16
    80005c8c:	00813423          	sd	s0,8(sp)
    80005c90:	01010413          	addi	s0,sp,16
    80005c94:	00813403          	ld	s0,8(sp)
    80005c98:	01010113          	addi	sp,sp,16
    80005c9c:	00008067          	ret

0000000080005ca0 <usertrapret>:
    80005ca0:	ff010113          	addi	sp,sp,-16
    80005ca4:	00813423          	sd	s0,8(sp)
    80005ca8:	01010413          	addi	s0,sp,16
    80005cac:	00813403          	ld	s0,8(sp)
    80005cb0:	01010113          	addi	sp,sp,16
    80005cb4:	00008067          	ret

0000000080005cb8 <kerneltrap>:
    80005cb8:	fe010113          	addi	sp,sp,-32
    80005cbc:	00813823          	sd	s0,16(sp)
    80005cc0:	00113c23          	sd	ra,24(sp)
    80005cc4:	00913423          	sd	s1,8(sp)
    80005cc8:	02010413          	addi	s0,sp,32
    80005ccc:	142025f3          	csrr	a1,scause
    80005cd0:	100027f3          	csrr	a5,sstatus
    80005cd4:	0027f793          	andi	a5,a5,2
    80005cd8:	10079c63          	bnez	a5,80005df0 <kerneltrap+0x138>
    80005cdc:	142027f3          	csrr	a5,scause
    80005ce0:	0207ce63          	bltz	a5,80005d1c <kerneltrap+0x64>
    80005ce4:	00003517          	auipc	a0,0x3
    80005ce8:	9bc50513          	addi	a0,a0,-1604 # 800086a0 <CONSOLE_STATUS+0x690>
    80005cec:	00001097          	auipc	ra,0x1
    80005cf0:	88c080e7          	jalr	-1908(ra) # 80006578 <__printf>
    80005cf4:	141025f3          	csrr	a1,sepc
    80005cf8:	14302673          	csrr	a2,stval
    80005cfc:	00003517          	auipc	a0,0x3
    80005d00:	9b450513          	addi	a0,a0,-1612 # 800086b0 <CONSOLE_STATUS+0x6a0>
    80005d04:	00001097          	auipc	ra,0x1
    80005d08:	874080e7          	jalr	-1932(ra) # 80006578 <__printf>
    80005d0c:	00003517          	auipc	a0,0x3
    80005d10:	9bc50513          	addi	a0,a0,-1604 # 800086c8 <CONSOLE_STATUS+0x6b8>
    80005d14:	00001097          	auipc	ra,0x1
    80005d18:	808080e7          	jalr	-2040(ra) # 8000651c <panic>
    80005d1c:	0ff7f713          	andi	a4,a5,255
    80005d20:	00900693          	li	a3,9
    80005d24:	04d70063          	beq	a4,a3,80005d64 <kerneltrap+0xac>
    80005d28:	fff00713          	li	a4,-1
    80005d2c:	03f71713          	slli	a4,a4,0x3f
    80005d30:	00170713          	addi	a4,a4,1
    80005d34:	fae798e3          	bne	a5,a4,80005ce4 <kerneltrap+0x2c>
    80005d38:	00000097          	auipc	ra,0x0
    80005d3c:	e00080e7          	jalr	-512(ra) # 80005b38 <cpuid>
    80005d40:	06050663          	beqz	a0,80005dac <kerneltrap+0xf4>
    80005d44:	144027f3          	csrr	a5,sip
    80005d48:	ffd7f793          	andi	a5,a5,-3
    80005d4c:	14479073          	csrw	sip,a5
    80005d50:	01813083          	ld	ra,24(sp)
    80005d54:	01013403          	ld	s0,16(sp)
    80005d58:	00813483          	ld	s1,8(sp)
    80005d5c:	02010113          	addi	sp,sp,32
    80005d60:	00008067          	ret
    80005d64:	00000097          	auipc	ra,0x0
    80005d68:	3d0080e7          	jalr	976(ra) # 80006134 <plic_claim>
    80005d6c:	00a00793          	li	a5,10
    80005d70:	00050493          	mv	s1,a0
    80005d74:	06f50863          	beq	a0,a5,80005de4 <kerneltrap+0x12c>
    80005d78:	fc050ce3          	beqz	a0,80005d50 <kerneltrap+0x98>
    80005d7c:	00050593          	mv	a1,a0
    80005d80:	00003517          	auipc	a0,0x3
    80005d84:	90050513          	addi	a0,a0,-1792 # 80008680 <CONSOLE_STATUS+0x670>
    80005d88:	00000097          	auipc	ra,0x0
    80005d8c:	7f0080e7          	jalr	2032(ra) # 80006578 <__printf>
    80005d90:	01013403          	ld	s0,16(sp)
    80005d94:	01813083          	ld	ra,24(sp)
    80005d98:	00048513          	mv	a0,s1
    80005d9c:	00813483          	ld	s1,8(sp)
    80005da0:	02010113          	addi	sp,sp,32
    80005da4:	00000317          	auipc	t1,0x0
    80005da8:	3c830067          	jr	968(t1) # 8000616c <plic_complete>
    80005dac:	00005517          	auipc	a0,0x5
    80005db0:	68450513          	addi	a0,a0,1668 # 8000b430 <tickslock>
    80005db4:	00001097          	auipc	ra,0x1
    80005db8:	498080e7          	jalr	1176(ra) # 8000724c <acquire>
    80005dbc:	00004717          	auipc	a4,0x4
    80005dc0:	52870713          	addi	a4,a4,1320 # 8000a2e4 <ticks>
    80005dc4:	00072783          	lw	a5,0(a4)
    80005dc8:	00005517          	auipc	a0,0x5
    80005dcc:	66850513          	addi	a0,a0,1640 # 8000b430 <tickslock>
    80005dd0:	0017879b          	addiw	a5,a5,1
    80005dd4:	00f72023          	sw	a5,0(a4)
    80005dd8:	00001097          	auipc	ra,0x1
    80005ddc:	540080e7          	jalr	1344(ra) # 80007318 <release>
    80005de0:	f65ff06f          	j	80005d44 <kerneltrap+0x8c>
    80005de4:	00001097          	auipc	ra,0x1
    80005de8:	09c080e7          	jalr	156(ra) # 80006e80 <uartintr>
    80005dec:	fa5ff06f          	j	80005d90 <kerneltrap+0xd8>
    80005df0:	00003517          	auipc	a0,0x3
    80005df4:	87050513          	addi	a0,a0,-1936 # 80008660 <CONSOLE_STATUS+0x650>
    80005df8:	00000097          	auipc	ra,0x0
    80005dfc:	724080e7          	jalr	1828(ra) # 8000651c <panic>

0000000080005e00 <clockintr>:
    80005e00:	fe010113          	addi	sp,sp,-32
    80005e04:	00813823          	sd	s0,16(sp)
    80005e08:	00913423          	sd	s1,8(sp)
    80005e0c:	00113c23          	sd	ra,24(sp)
    80005e10:	02010413          	addi	s0,sp,32
    80005e14:	00005497          	auipc	s1,0x5
    80005e18:	61c48493          	addi	s1,s1,1564 # 8000b430 <tickslock>
    80005e1c:	00048513          	mv	a0,s1
    80005e20:	00001097          	auipc	ra,0x1
    80005e24:	42c080e7          	jalr	1068(ra) # 8000724c <acquire>
    80005e28:	00004717          	auipc	a4,0x4
    80005e2c:	4bc70713          	addi	a4,a4,1212 # 8000a2e4 <ticks>
    80005e30:	00072783          	lw	a5,0(a4)
    80005e34:	01013403          	ld	s0,16(sp)
    80005e38:	01813083          	ld	ra,24(sp)
    80005e3c:	00048513          	mv	a0,s1
    80005e40:	0017879b          	addiw	a5,a5,1
    80005e44:	00813483          	ld	s1,8(sp)
    80005e48:	00f72023          	sw	a5,0(a4)
    80005e4c:	02010113          	addi	sp,sp,32
    80005e50:	00001317          	auipc	t1,0x1
    80005e54:	4c830067          	jr	1224(t1) # 80007318 <release>

0000000080005e58 <devintr>:
    80005e58:	142027f3          	csrr	a5,scause
    80005e5c:	00000513          	li	a0,0
    80005e60:	0007c463          	bltz	a5,80005e68 <devintr+0x10>
    80005e64:	00008067          	ret
    80005e68:	fe010113          	addi	sp,sp,-32
    80005e6c:	00813823          	sd	s0,16(sp)
    80005e70:	00113c23          	sd	ra,24(sp)
    80005e74:	00913423          	sd	s1,8(sp)
    80005e78:	02010413          	addi	s0,sp,32
    80005e7c:	0ff7f713          	andi	a4,a5,255
    80005e80:	00900693          	li	a3,9
    80005e84:	04d70c63          	beq	a4,a3,80005edc <devintr+0x84>
    80005e88:	fff00713          	li	a4,-1
    80005e8c:	03f71713          	slli	a4,a4,0x3f
    80005e90:	00170713          	addi	a4,a4,1
    80005e94:	00e78c63          	beq	a5,a4,80005eac <devintr+0x54>
    80005e98:	01813083          	ld	ra,24(sp)
    80005e9c:	01013403          	ld	s0,16(sp)
    80005ea0:	00813483          	ld	s1,8(sp)
    80005ea4:	02010113          	addi	sp,sp,32
    80005ea8:	00008067          	ret
    80005eac:	00000097          	auipc	ra,0x0
    80005eb0:	c8c080e7          	jalr	-884(ra) # 80005b38 <cpuid>
    80005eb4:	06050663          	beqz	a0,80005f20 <devintr+0xc8>
    80005eb8:	144027f3          	csrr	a5,sip
    80005ebc:	ffd7f793          	andi	a5,a5,-3
    80005ec0:	14479073          	csrw	sip,a5
    80005ec4:	01813083          	ld	ra,24(sp)
    80005ec8:	01013403          	ld	s0,16(sp)
    80005ecc:	00813483          	ld	s1,8(sp)
    80005ed0:	00200513          	li	a0,2
    80005ed4:	02010113          	addi	sp,sp,32
    80005ed8:	00008067          	ret
    80005edc:	00000097          	auipc	ra,0x0
    80005ee0:	258080e7          	jalr	600(ra) # 80006134 <plic_claim>
    80005ee4:	00a00793          	li	a5,10
    80005ee8:	00050493          	mv	s1,a0
    80005eec:	06f50663          	beq	a0,a5,80005f58 <devintr+0x100>
    80005ef0:	00100513          	li	a0,1
    80005ef4:	fa0482e3          	beqz	s1,80005e98 <devintr+0x40>
    80005ef8:	00048593          	mv	a1,s1
    80005efc:	00002517          	auipc	a0,0x2
    80005f00:	78450513          	addi	a0,a0,1924 # 80008680 <CONSOLE_STATUS+0x670>
    80005f04:	00000097          	auipc	ra,0x0
    80005f08:	674080e7          	jalr	1652(ra) # 80006578 <__printf>
    80005f0c:	00048513          	mv	a0,s1
    80005f10:	00000097          	auipc	ra,0x0
    80005f14:	25c080e7          	jalr	604(ra) # 8000616c <plic_complete>
    80005f18:	00100513          	li	a0,1
    80005f1c:	f7dff06f          	j	80005e98 <devintr+0x40>
    80005f20:	00005517          	auipc	a0,0x5
    80005f24:	51050513          	addi	a0,a0,1296 # 8000b430 <tickslock>
    80005f28:	00001097          	auipc	ra,0x1
    80005f2c:	324080e7          	jalr	804(ra) # 8000724c <acquire>
    80005f30:	00004717          	auipc	a4,0x4
    80005f34:	3b470713          	addi	a4,a4,948 # 8000a2e4 <ticks>
    80005f38:	00072783          	lw	a5,0(a4)
    80005f3c:	00005517          	auipc	a0,0x5
    80005f40:	4f450513          	addi	a0,a0,1268 # 8000b430 <tickslock>
    80005f44:	0017879b          	addiw	a5,a5,1
    80005f48:	00f72023          	sw	a5,0(a4)
    80005f4c:	00001097          	auipc	ra,0x1
    80005f50:	3cc080e7          	jalr	972(ra) # 80007318 <release>
    80005f54:	f65ff06f          	j	80005eb8 <devintr+0x60>
    80005f58:	00001097          	auipc	ra,0x1
    80005f5c:	f28080e7          	jalr	-216(ra) # 80006e80 <uartintr>
    80005f60:	fadff06f          	j	80005f0c <devintr+0xb4>
	...

0000000080005f70 <kernelvec>:
    80005f70:	f0010113          	addi	sp,sp,-256
    80005f74:	00113023          	sd	ra,0(sp)
    80005f78:	00213423          	sd	sp,8(sp)
    80005f7c:	00313823          	sd	gp,16(sp)
    80005f80:	00413c23          	sd	tp,24(sp)
    80005f84:	02513023          	sd	t0,32(sp)
    80005f88:	02613423          	sd	t1,40(sp)
    80005f8c:	02713823          	sd	t2,48(sp)
    80005f90:	02813c23          	sd	s0,56(sp)
    80005f94:	04913023          	sd	s1,64(sp)
    80005f98:	04a13423          	sd	a0,72(sp)
    80005f9c:	04b13823          	sd	a1,80(sp)
    80005fa0:	04c13c23          	sd	a2,88(sp)
    80005fa4:	06d13023          	sd	a3,96(sp)
    80005fa8:	06e13423          	sd	a4,104(sp)
    80005fac:	06f13823          	sd	a5,112(sp)
    80005fb0:	07013c23          	sd	a6,120(sp)
    80005fb4:	09113023          	sd	a7,128(sp)
    80005fb8:	09213423          	sd	s2,136(sp)
    80005fbc:	09313823          	sd	s3,144(sp)
    80005fc0:	09413c23          	sd	s4,152(sp)
    80005fc4:	0b513023          	sd	s5,160(sp)
    80005fc8:	0b613423          	sd	s6,168(sp)
    80005fcc:	0b713823          	sd	s7,176(sp)
    80005fd0:	0b813c23          	sd	s8,184(sp)
    80005fd4:	0d913023          	sd	s9,192(sp)
    80005fd8:	0da13423          	sd	s10,200(sp)
    80005fdc:	0db13823          	sd	s11,208(sp)
    80005fe0:	0dc13c23          	sd	t3,216(sp)
    80005fe4:	0fd13023          	sd	t4,224(sp)
    80005fe8:	0fe13423          	sd	t5,232(sp)
    80005fec:	0ff13823          	sd	t6,240(sp)
    80005ff0:	cc9ff0ef          	jal	ra,80005cb8 <kerneltrap>
    80005ff4:	00013083          	ld	ra,0(sp)
    80005ff8:	00813103          	ld	sp,8(sp)
    80005ffc:	01013183          	ld	gp,16(sp)
    80006000:	02013283          	ld	t0,32(sp)
    80006004:	02813303          	ld	t1,40(sp)
    80006008:	03013383          	ld	t2,48(sp)
    8000600c:	03813403          	ld	s0,56(sp)
    80006010:	04013483          	ld	s1,64(sp)
    80006014:	04813503          	ld	a0,72(sp)
    80006018:	05013583          	ld	a1,80(sp)
    8000601c:	05813603          	ld	a2,88(sp)
    80006020:	06013683          	ld	a3,96(sp)
    80006024:	06813703          	ld	a4,104(sp)
    80006028:	07013783          	ld	a5,112(sp)
    8000602c:	07813803          	ld	a6,120(sp)
    80006030:	08013883          	ld	a7,128(sp)
    80006034:	08813903          	ld	s2,136(sp)
    80006038:	09013983          	ld	s3,144(sp)
    8000603c:	09813a03          	ld	s4,152(sp)
    80006040:	0a013a83          	ld	s5,160(sp)
    80006044:	0a813b03          	ld	s6,168(sp)
    80006048:	0b013b83          	ld	s7,176(sp)
    8000604c:	0b813c03          	ld	s8,184(sp)
    80006050:	0c013c83          	ld	s9,192(sp)
    80006054:	0c813d03          	ld	s10,200(sp)
    80006058:	0d013d83          	ld	s11,208(sp)
    8000605c:	0d813e03          	ld	t3,216(sp)
    80006060:	0e013e83          	ld	t4,224(sp)
    80006064:	0e813f03          	ld	t5,232(sp)
    80006068:	0f013f83          	ld	t6,240(sp)
    8000606c:	10010113          	addi	sp,sp,256
    80006070:	10200073          	sret
    80006074:	00000013          	nop
    80006078:	00000013          	nop
    8000607c:	00000013          	nop

0000000080006080 <timervec>:
    80006080:	34051573          	csrrw	a0,mscratch,a0
    80006084:	00b53023          	sd	a1,0(a0)
    80006088:	00c53423          	sd	a2,8(a0)
    8000608c:	00d53823          	sd	a3,16(a0)
    80006090:	01853583          	ld	a1,24(a0)
    80006094:	02053603          	ld	a2,32(a0)
    80006098:	0005b683          	ld	a3,0(a1)
    8000609c:	00c686b3          	add	a3,a3,a2
    800060a0:	00d5b023          	sd	a3,0(a1)
    800060a4:	00200593          	li	a1,2
    800060a8:	14459073          	csrw	sip,a1
    800060ac:	01053683          	ld	a3,16(a0)
    800060b0:	00853603          	ld	a2,8(a0)
    800060b4:	00053583          	ld	a1,0(a0)
    800060b8:	34051573          	csrrw	a0,mscratch,a0
    800060bc:	30200073          	mret

00000000800060c0 <plicinit>:
    800060c0:	ff010113          	addi	sp,sp,-16
    800060c4:	00813423          	sd	s0,8(sp)
    800060c8:	01010413          	addi	s0,sp,16
    800060cc:	00813403          	ld	s0,8(sp)
    800060d0:	0c0007b7          	lui	a5,0xc000
    800060d4:	00100713          	li	a4,1
    800060d8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800060dc:	00e7a223          	sw	a4,4(a5)
    800060e0:	01010113          	addi	sp,sp,16
    800060e4:	00008067          	ret

00000000800060e8 <plicinithart>:
    800060e8:	ff010113          	addi	sp,sp,-16
    800060ec:	00813023          	sd	s0,0(sp)
    800060f0:	00113423          	sd	ra,8(sp)
    800060f4:	01010413          	addi	s0,sp,16
    800060f8:	00000097          	auipc	ra,0x0
    800060fc:	a40080e7          	jalr	-1472(ra) # 80005b38 <cpuid>
    80006100:	0085171b          	slliw	a4,a0,0x8
    80006104:	0c0027b7          	lui	a5,0xc002
    80006108:	00e787b3          	add	a5,a5,a4
    8000610c:	40200713          	li	a4,1026
    80006110:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80006114:	00813083          	ld	ra,8(sp)
    80006118:	00013403          	ld	s0,0(sp)
    8000611c:	00d5151b          	slliw	a0,a0,0xd
    80006120:	0c2017b7          	lui	a5,0xc201
    80006124:	00a78533          	add	a0,a5,a0
    80006128:	00052023          	sw	zero,0(a0)
    8000612c:	01010113          	addi	sp,sp,16
    80006130:	00008067          	ret

0000000080006134 <plic_claim>:
    80006134:	ff010113          	addi	sp,sp,-16
    80006138:	00813023          	sd	s0,0(sp)
    8000613c:	00113423          	sd	ra,8(sp)
    80006140:	01010413          	addi	s0,sp,16
    80006144:	00000097          	auipc	ra,0x0
    80006148:	9f4080e7          	jalr	-1548(ra) # 80005b38 <cpuid>
    8000614c:	00813083          	ld	ra,8(sp)
    80006150:	00013403          	ld	s0,0(sp)
    80006154:	00d5151b          	slliw	a0,a0,0xd
    80006158:	0c2017b7          	lui	a5,0xc201
    8000615c:	00a78533          	add	a0,a5,a0
    80006160:	00452503          	lw	a0,4(a0)
    80006164:	01010113          	addi	sp,sp,16
    80006168:	00008067          	ret

000000008000616c <plic_complete>:
    8000616c:	fe010113          	addi	sp,sp,-32
    80006170:	00813823          	sd	s0,16(sp)
    80006174:	00913423          	sd	s1,8(sp)
    80006178:	00113c23          	sd	ra,24(sp)
    8000617c:	02010413          	addi	s0,sp,32
    80006180:	00050493          	mv	s1,a0
    80006184:	00000097          	auipc	ra,0x0
    80006188:	9b4080e7          	jalr	-1612(ra) # 80005b38 <cpuid>
    8000618c:	01813083          	ld	ra,24(sp)
    80006190:	01013403          	ld	s0,16(sp)
    80006194:	00d5179b          	slliw	a5,a0,0xd
    80006198:	0c201737          	lui	a4,0xc201
    8000619c:	00f707b3          	add	a5,a4,a5
    800061a0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800061a4:	00813483          	ld	s1,8(sp)
    800061a8:	02010113          	addi	sp,sp,32
    800061ac:	00008067          	ret

00000000800061b0 <consolewrite>:
    800061b0:	fb010113          	addi	sp,sp,-80
    800061b4:	04813023          	sd	s0,64(sp)
    800061b8:	04113423          	sd	ra,72(sp)
    800061bc:	02913c23          	sd	s1,56(sp)
    800061c0:	03213823          	sd	s2,48(sp)
    800061c4:	03313423          	sd	s3,40(sp)
    800061c8:	03413023          	sd	s4,32(sp)
    800061cc:	01513c23          	sd	s5,24(sp)
    800061d0:	05010413          	addi	s0,sp,80
    800061d4:	06c05c63          	blez	a2,8000624c <consolewrite+0x9c>
    800061d8:	00060993          	mv	s3,a2
    800061dc:	00050a13          	mv	s4,a0
    800061e0:	00058493          	mv	s1,a1
    800061e4:	00000913          	li	s2,0
    800061e8:	fff00a93          	li	s5,-1
    800061ec:	01c0006f          	j	80006208 <consolewrite+0x58>
    800061f0:	fbf44503          	lbu	a0,-65(s0)
    800061f4:	0019091b          	addiw	s2,s2,1
    800061f8:	00148493          	addi	s1,s1,1
    800061fc:	00001097          	auipc	ra,0x1
    80006200:	a9c080e7          	jalr	-1380(ra) # 80006c98 <uartputc>
    80006204:	03298063          	beq	s3,s2,80006224 <consolewrite+0x74>
    80006208:	00048613          	mv	a2,s1
    8000620c:	00100693          	li	a3,1
    80006210:	000a0593          	mv	a1,s4
    80006214:	fbf40513          	addi	a0,s0,-65
    80006218:	00000097          	auipc	ra,0x0
    8000621c:	9d8080e7          	jalr	-1576(ra) # 80005bf0 <either_copyin>
    80006220:	fd5518e3          	bne	a0,s5,800061f0 <consolewrite+0x40>
    80006224:	04813083          	ld	ra,72(sp)
    80006228:	04013403          	ld	s0,64(sp)
    8000622c:	03813483          	ld	s1,56(sp)
    80006230:	02813983          	ld	s3,40(sp)
    80006234:	02013a03          	ld	s4,32(sp)
    80006238:	01813a83          	ld	s5,24(sp)
    8000623c:	00090513          	mv	a0,s2
    80006240:	03013903          	ld	s2,48(sp)
    80006244:	05010113          	addi	sp,sp,80
    80006248:	00008067          	ret
    8000624c:	00000913          	li	s2,0
    80006250:	fd5ff06f          	j	80006224 <consolewrite+0x74>

0000000080006254 <consoleread>:
    80006254:	f9010113          	addi	sp,sp,-112
    80006258:	06813023          	sd	s0,96(sp)
    8000625c:	04913c23          	sd	s1,88(sp)
    80006260:	05213823          	sd	s2,80(sp)
    80006264:	05313423          	sd	s3,72(sp)
    80006268:	05413023          	sd	s4,64(sp)
    8000626c:	03513c23          	sd	s5,56(sp)
    80006270:	03613823          	sd	s6,48(sp)
    80006274:	03713423          	sd	s7,40(sp)
    80006278:	03813023          	sd	s8,32(sp)
    8000627c:	06113423          	sd	ra,104(sp)
    80006280:	01913c23          	sd	s9,24(sp)
    80006284:	07010413          	addi	s0,sp,112
    80006288:	00060b93          	mv	s7,a2
    8000628c:	00050913          	mv	s2,a0
    80006290:	00058c13          	mv	s8,a1
    80006294:	00060b1b          	sext.w	s6,a2
    80006298:	00005497          	auipc	s1,0x5
    8000629c:	1c048493          	addi	s1,s1,448 # 8000b458 <cons>
    800062a0:	00400993          	li	s3,4
    800062a4:	fff00a13          	li	s4,-1
    800062a8:	00a00a93          	li	s5,10
    800062ac:	05705e63          	blez	s7,80006308 <consoleread+0xb4>
    800062b0:	09c4a703          	lw	a4,156(s1)
    800062b4:	0984a783          	lw	a5,152(s1)
    800062b8:	0007071b          	sext.w	a4,a4
    800062bc:	08e78463          	beq	a5,a4,80006344 <consoleread+0xf0>
    800062c0:	07f7f713          	andi	a4,a5,127
    800062c4:	00e48733          	add	a4,s1,a4
    800062c8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800062cc:	0017869b          	addiw	a3,a5,1
    800062d0:	08d4ac23          	sw	a3,152(s1)
    800062d4:	00070c9b          	sext.w	s9,a4
    800062d8:	0b370663          	beq	a4,s3,80006384 <consoleread+0x130>
    800062dc:	00100693          	li	a3,1
    800062e0:	f9f40613          	addi	a2,s0,-97
    800062e4:	000c0593          	mv	a1,s8
    800062e8:	00090513          	mv	a0,s2
    800062ec:	f8e40fa3          	sb	a4,-97(s0)
    800062f0:	00000097          	auipc	ra,0x0
    800062f4:	8b4080e7          	jalr	-1868(ra) # 80005ba4 <either_copyout>
    800062f8:	01450863          	beq	a0,s4,80006308 <consoleread+0xb4>
    800062fc:	001c0c13          	addi	s8,s8,1
    80006300:	fffb8b9b          	addiw	s7,s7,-1
    80006304:	fb5c94e3          	bne	s9,s5,800062ac <consoleread+0x58>
    80006308:	000b851b          	sext.w	a0,s7
    8000630c:	06813083          	ld	ra,104(sp)
    80006310:	06013403          	ld	s0,96(sp)
    80006314:	05813483          	ld	s1,88(sp)
    80006318:	05013903          	ld	s2,80(sp)
    8000631c:	04813983          	ld	s3,72(sp)
    80006320:	04013a03          	ld	s4,64(sp)
    80006324:	03813a83          	ld	s5,56(sp)
    80006328:	02813b83          	ld	s7,40(sp)
    8000632c:	02013c03          	ld	s8,32(sp)
    80006330:	01813c83          	ld	s9,24(sp)
    80006334:	40ab053b          	subw	a0,s6,a0
    80006338:	03013b03          	ld	s6,48(sp)
    8000633c:	07010113          	addi	sp,sp,112
    80006340:	00008067          	ret
    80006344:	00001097          	auipc	ra,0x1
    80006348:	1d8080e7          	jalr	472(ra) # 8000751c <push_on>
    8000634c:	0984a703          	lw	a4,152(s1)
    80006350:	09c4a783          	lw	a5,156(s1)
    80006354:	0007879b          	sext.w	a5,a5
    80006358:	fef70ce3          	beq	a4,a5,80006350 <consoleread+0xfc>
    8000635c:	00001097          	auipc	ra,0x1
    80006360:	234080e7          	jalr	564(ra) # 80007590 <pop_on>
    80006364:	0984a783          	lw	a5,152(s1)
    80006368:	07f7f713          	andi	a4,a5,127
    8000636c:	00e48733          	add	a4,s1,a4
    80006370:	01874703          	lbu	a4,24(a4)
    80006374:	0017869b          	addiw	a3,a5,1
    80006378:	08d4ac23          	sw	a3,152(s1)
    8000637c:	00070c9b          	sext.w	s9,a4
    80006380:	f5371ee3          	bne	a4,s3,800062dc <consoleread+0x88>
    80006384:	000b851b          	sext.w	a0,s7
    80006388:	f96bf2e3          	bgeu	s7,s6,8000630c <consoleread+0xb8>
    8000638c:	08f4ac23          	sw	a5,152(s1)
    80006390:	f7dff06f          	j	8000630c <consoleread+0xb8>

0000000080006394 <consputc>:
    80006394:	10000793          	li	a5,256
    80006398:	00f50663          	beq	a0,a5,800063a4 <consputc+0x10>
    8000639c:	00001317          	auipc	t1,0x1
    800063a0:	9f430067          	jr	-1548(t1) # 80006d90 <uartputc_sync>
    800063a4:	ff010113          	addi	sp,sp,-16
    800063a8:	00113423          	sd	ra,8(sp)
    800063ac:	00813023          	sd	s0,0(sp)
    800063b0:	01010413          	addi	s0,sp,16
    800063b4:	00800513          	li	a0,8
    800063b8:	00001097          	auipc	ra,0x1
    800063bc:	9d8080e7          	jalr	-1576(ra) # 80006d90 <uartputc_sync>
    800063c0:	02000513          	li	a0,32
    800063c4:	00001097          	auipc	ra,0x1
    800063c8:	9cc080e7          	jalr	-1588(ra) # 80006d90 <uartputc_sync>
    800063cc:	00013403          	ld	s0,0(sp)
    800063d0:	00813083          	ld	ra,8(sp)
    800063d4:	00800513          	li	a0,8
    800063d8:	01010113          	addi	sp,sp,16
    800063dc:	00001317          	auipc	t1,0x1
    800063e0:	9b430067          	jr	-1612(t1) # 80006d90 <uartputc_sync>

00000000800063e4 <consoleintr>:
    800063e4:	fe010113          	addi	sp,sp,-32
    800063e8:	00813823          	sd	s0,16(sp)
    800063ec:	00913423          	sd	s1,8(sp)
    800063f0:	01213023          	sd	s2,0(sp)
    800063f4:	00113c23          	sd	ra,24(sp)
    800063f8:	02010413          	addi	s0,sp,32
    800063fc:	00005917          	auipc	s2,0x5
    80006400:	05c90913          	addi	s2,s2,92 # 8000b458 <cons>
    80006404:	00050493          	mv	s1,a0
    80006408:	00090513          	mv	a0,s2
    8000640c:	00001097          	auipc	ra,0x1
    80006410:	e40080e7          	jalr	-448(ra) # 8000724c <acquire>
    80006414:	02048c63          	beqz	s1,8000644c <consoleintr+0x68>
    80006418:	0a092783          	lw	a5,160(s2)
    8000641c:	09892703          	lw	a4,152(s2)
    80006420:	07f00693          	li	a3,127
    80006424:	40e7873b          	subw	a4,a5,a4
    80006428:	02e6e263          	bltu	a3,a4,8000644c <consoleintr+0x68>
    8000642c:	00d00713          	li	a4,13
    80006430:	04e48063          	beq	s1,a4,80006470 <consoleintr+0x8c>
    80006434:	07f7f713          	andi	a4,a5,127
    80006438:	00e90733          	add	a4,s2,a4
    8000643c:	0017879b          	addiw	a5,a5,1
    80006440:	0af92023          	sw	a5,160(s2)
    80006444:	00970c23          	sb	s1,24(a4)
    80006448:	08f92e23          	sw	a5,156(s2)
    8000644c:	01013403          	ld	s0,16(sp)
    80006450:	01813083          	ld	ra,24(sp)
    80006454:	00813483          	ld	s1,8(sp)
    80006458:	00013903          	ld	s2,0(sp)
    8000645c:	00005517          	auipc	a0,0x5
    80006460:	ffc50513          	addi	a0,a0,-4 # 8000b458 <cons>
    80006464:	02010113          	addi	sp,sp,32
    80006468:	00001317          	auipc	t1,0x1
    8000646c:	eb030067          	jr	-336(t1) # 80007318 <release>
    80006470:	00a00493          	li	s1,10
    80006474:	fc1ff06f          	j	80006434 <consoleintr+0x50>

0000000080006478 <consoleinit>:
    80006478:	fe010113          	addi	sp,sp,-32
    8000647c:	00113c23          	sd	ra,24(sp)
    80006480:	00813823          	sd	s0,16(sp)
    80006484:	00913423          	sd	s1,8(sp)
    80006488:	02010413          	addi	s0,sp,32
    8000648c:	00005497          	auipc	s1,0x5
    80006490:	fcc48493          	addi	s1,s1,-52 # 8000b458 <cons>
    80006494:	00048513          	mv	a0,s1
    80006498:	00002597          	auipc	a1,0x2
    8000649c:	24058593          	addi	a1,a1,576 # 800086d8 <CONSOLE_STATUS+0x6c8>
    800064a0:	00001097          	auipc	ra,0x1
    800064a4:	d88080e7          	jalr	-632(ra) # 80007228 <initlock>
    800064a8:	00000097          	auipc	ra,0x0
    800064ac:	7ac080e7          	jalr	1964(ra) # 80006c54 <uartinit>
    800064b0:	01813083          	ld	ra,24(sp)
    800064b4:	01013403          	ld	s0,16(sp)
    800064b8:	00000797          	auipc	a5,0x0
    800064bc:	d9c78793          	addi	a5,a5,-612 # 80006254 <consoleread>
    800064c0:	0af4bc23          	sd	a5,184(s1)
    800064c4:	00000797          	auipc	a5,0x0
    800064c8:	cec78793          	addi	a5,a5,-788 # 800061b0 <consolewrite>
    800064cc:	0cf4b023          	sd	a5,192(s1)
    800064d0:	00813483          	ld	s1,8(sp)
    800064d4:	02010113          	addi	sp,sp,32
    800064d8:	00008067          	ret

00000000800064dc <console_read>:
    800064dc:	ff010113          	addi	sp,sp,-16
    800064e0:	00813423          	sd	s0,8(sp)
    800064e4:	01010413          	addi	s0,sp,16
    800064e8:	00813403          	ld	s0,8(sp)
    800064ec:	00005317          	auipc	t1,0x5
    800064f0:	02433303          	ld	t1,36(t1) # 8000b510 <devsw+0x10>
    800064f4:	01010113          	addi	sp,sp,16
    800064f8:	00030067          	jr	t1

00000000800064fc <console_write>:
    800064fc:	ff010113          	addi	sp,sp,-16
    80006500:	00813423          	sd	s0,8(sp)
    80006504:	01010413          	addi	s0,sp,16
    80006508:	00813403          	ld	s0,8(sp)
    8000650c:	00005317          	auipc	t1,0x5
    80006510:	00c33303          	ld	t1,12(t1) # 8000b518 <devsw+0x18>
    80006514:	01010113          	addi	sp,sp,16
    80006518:	00030067          	jr	t1

000000008000651c <panic>:
    8000651c:	fe010113          	addi	sp,sp,-32
    80006520:	00113c23          	sd	ra,24(sp)
    80006524:	00813823          	sd	s0,16(sp)
    80006528:	00913423          	sd	s1,8(sp)
    8000652c:	02010413          	addi	s0,sp,32
    80006530:	00050493          	mv	s1,a0
    80006534:	00002517          	auipc	a0,0x2
    80006538:	1ac50513          	addi	a0,a0,428 # 800086e0 <CONSOLE_STATUS+0x6d0>
    8000653c:	00005797          	auipc	a5,0x5
    80006540:	0607ae23          	sw	zero,124(a5) # 8000b5b8 <pr+0x18>
    80006544:	00000097          	auipc	ra,0x0
    80006548:	034080e7          	jalr	52(ra) # 80006578 <__printf>
    8000654c:	00048513          	mv	a0,s1
    80006550:	00000097          	auipc	ra,0x0
    80006554:	028080e7          	jalr	40(ra) # 80006578 <__printf>
    80006558:	00002517          	auipc	a0,0x2
    8000655c:	f8050513          	addi	a0,a0,-128 # 800084d8 <CONSOLE_STATUS+0x4c8>
    80006560:	00000097          	auipc	ra,0x0
    80006564:	018080e7          	jalr	24(ra) # 80006578 <__printf>
    80006568:	00100793          	li	a5,1
    8000656c:	00004717          	auipc	a4,0x4
    80006570:	d6f72e23          	sw	a5,-644(a4) # 8000a2e8 <panicked>
    80006574:	0000006f          	j	80006574 <panic+0x58>

0000000080006578 <__printf>:
    80006578:	f3010113          	addi	sp,sp,-208
    8000657c:	08813023          	sd	s0,128(sp)
    80006580:	07313423          	sd	s3,104(sp)
    80006584:	09010413          	addi	s0,sp,144
    80006588:	05813023          	sd	s8,64(sp)
    8000658c:	08113423          	sd	ra,136(sp)
    80006590:	06913c23          	sd	s1,120(sp)
    80006594:	07213823          	sd	s2,112(sp)
    80006598:	07413023          	sd	s4,96(sp)
    8000659c:	05513c23          	sd	s5,88(sp)
    800065a0:	05613823          	sd	s6,80(sp)
    800065a4:	05713423          	sd	s7,72(sp)
    800065a8:	03913c23          	sd	s9,56(sp)
    800065ac:	03a13823          	sd	s10,48(sp)
    800065b0:	03b13423          	sd	s11,40(sp)
    800065b4:	00005317          	auipc	t1,0x5
    800065b8:	fec30313          	addi	t1,t1,-20 # 8000b5a0 <pr>
    800065bc:	01832c03          	lw	s8,24(t1)
    800065c0:	00b43423          	sd	a1,8(s0)
    800065c4:	00c43823          	sd	a2,16(s0)
    800065c8:	00d43c23          	sd	a3,24(s0)
    800065cc:	02e43023          	sd	a4,32(s0)
    800065d0:	02f43423          	sd	a5,40(s0)
    800065d4:	03043823          	sd	a6,48(s0)
    800065d8:	03143c23          	sd	a7,56(s0)
    800065dc:	00050993          	mv	s3,a0
    800065e0:	4a0c1663          	bnez	s8,80006a8c <__printf+0x514>
    800065e4:	60098c63          	beqz	s3,80006bfc <__printf+0x684>
    800065e8:	0009c503          	lbu	a0,0(s3)
    800065ec:	00840793          	addi	a5,s0,8
    800065f0:	f6f43c23          	sd	a5,-136(s0)
    800065f4:	00000493          	li	s1,0
    800065f8:	22050063          	beqz	a0,80006818 <__printf+0x2a0>
    800065fc:	00002a37          	lui	s4,0x2
    80006600:	00018ab7          	lui	s5,0x18
    80006604:	000f4b37          	lui	s6,0xf4
    80006608:	00989bb7          	lui	s7,0x989
    8000660c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80006610:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80006614:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80006618:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000661c:	00148c9b          	addiw	s9,s1,1
    80006620:	02500793          	li	a5,37
    80006624:	01998933          	add	s2,s3,s9
    80006628:	38f51263          	bne	a0,a5,800069ac <__printf+0x434>
    8000662c:	00094783          	lbu	a5,0(s2)
    80006630:	00078c9b          	sext.w	s9,a5
    80006634:	1e078263          	beqz	a5,80006818 <__printf+0x2a0>
    80006638:	0024849b          	addiw	s1,s1,2
    8000663c:	07000713          	li	a4,112
    80006640:	00998933          	add	s2,s3,s1
    80006644:	38e78a63          	beq	a5,a4,800069d8 <__printf+0x460>
    80006648:	20f76863          	bltu	a4,a5,80006858 <__printf+0x2e0>
    8000664c:	42a78863          	beq	a5,a0,80006a7c <__printf+0x504>
    80006650:	06400713          	li	a4,100
    80006654:	40e79663          	bne	a5,a4,80006a60 <__printf+0x4e8>
    80006658:	f7843783          	ld	a5,-136(s0)
    8000665c:	0007a603          	lw	a2,0(a5)
    80006660:	00878793          	addi	a5,a5,8
    80006664:	f6f43c23          	sd	a5,-136(s0)
    80006668:	42064a63          	bltz	a2,80006a9c <__printf+0x524>
    8000666c:	00a00713          	li	a4,10
    80006670:	02e677bb          	remuw	a5,a2,a4
    80006674:	00002d97          	auipc	s11,0x2
    80006678:	094d8d93          	addi	s11,s11,148 # 80008708 <digits>
    8000667c:	00900593          	li	a1,9
    80006680:	0006051b          	sext.w	a0,a2
    80006684:	00000c93          	li	s9,0
    80006688:	02079793          	slli	a5,a5,0x20
    8000668c:	0207d793          	srli	a5,a5,0x20
    80006690:	00fd87b3          	add	a5,s11,a5
    80006694:	0007c783          	lbu	a5,0(a5)
    80006698:	02e656bb          	divuw	a3,a2,a4
    8000669c:	f8f40023          	sb	a5,-128(s0)
    800066a0:	14c5d863          	bge	a1,a2,800067f0 <__printf+0x278>
    800066a4:	06300593          	li	a1,99
    800066a8:	00100c93          	li	s9,1
    800066ac:	02e6f7bb          	remuw	a5,a3,a4
    800066b0:	02079793          	slli	a5,a5,0x20
    800066b4:	0207d793          	srli	a5,a5,0x20
    800066b8:	00fd87b3          	add	a5,s11,a5
    800066bc:	0007c783          	lbu	a5,0(a5)
    800066c0:	02e6d73b          	divuw	a4,a3,a4
    800066c4:	f8f400a3          	sb	a5,-127(s0)
    800066c8:	12a5f463          	bgeu	a1,a0,800067f0 <__printf+0x278>
    800066cc:	00a00693          	li	a3,10
    800066d0:	00900593          	li	a1,9
    800066d4:	02d777bb          	remuw	a5,a4,a3
    800066d8:	02079793          	slli	a5,a5,0x20
    800066dc:	0207d793          	srli	a5,a5,0x20
    800066e0:	00fd87b3          	add	a5,s11,a5
    800066e4:	0007c503          	lbu	a0,0(a5)
    800066e8:	02d757bb          	divuw	a5,a4,a3
    800066ec:	f8a40123          	sb	a0,-126(s0)
    800066f0:	48e5f263          	bgeu	a1,a4,80006b74 <__printf+0x5fc>
    800066f4:	06300513          	li	a0,99
    800066f8:	02d7f5bb          	remuw	a1,a5,a3
    800066fc:	02059593          	slli	a1,a1,0x20
    80006700:	0205d593          	srli	a1,a1,0x20
    80006704:	00bd85b3          	add	a1,s11,a1
    80006708:	0005c583          	lbu	a1,0(a1)
    8000670c:	02d7d7bb          	divuw	a5,a5,a3
    80006710:	f8b401a3          	sb	a1,-125(s0)
    80006714:	48e57263          	bgeu	a0,a4,80006b98 <__printf+0x620>
    80006718:	3e700513          	li	a0,999
    8000671c:	02d7f5bb          	remuw	a1,a5,a3
    80006720:	02059593          	slli	a1,a1,0x20
    80006724:	0205d593          	srli	a1,a1,0x20
    80006728:	00bd85b3          	add	a1,s11,a1
    8000672c:	0005c583          	lbu	a1,0(a1)
    80006730:	02d7d7bb          	divuw	a5,a5,a3
    80006734:	f8b40223          	sb	a1,-124(s0)
    80006738:	46e57663          	bgeu	a0,a4,80006ba4 <__printf+0x62c>
    8000673c:	02d7f5bb          	remuw	a1,a5,a3
    80006740:	02059593          	slli	a1,a1,0x20
    80006744:	0205d593          	srli	a1,a1,0x20
    80006748:	00bd85b3          	add	a1,s11,a1
    8000674c:	0005c583          	lbu	a1,0(a1)
    80006750:	02d7d7bb          	divuw	a5,a5,a3
    80006754:	f8b402a3          	sb	a1,-123(s0)
    80006758:	46ea7863          	bgeu	s4,a4,80006bc8 <__printf+0x650>
    8000675c:	02d7f5bb          	remuw	a1,a5,a3
    80006760:	02059593          	slli	a1,a1,0x20
    80006764:	0205d593          	srli	a1,a1,0x20
    80006768:	00bd85b3          	add	a1,s11,a1
    8000676c:	0005c583          	lbu	a1,0(a1)
    80006770:	02d7d7bb          	divuw	a5,a5,a3
    80006774:	f8b40323          	sb	a1,-122(s0)
    80006778:	3eeaf863          	bgeu	s5,a4,80006b68 <__printf+0x5f0>
    8000677c:	02d7f5bb          	remuw	a1,a5,a3
    80006780:	02059593          	slli	a1,a1,0x20
    80006784:	0205d593          	srli	a1,a1,0x20
    80006788:	00bd85b3          	add	a1,s11,a1
    8000678c:	0005c583          	lbu	a1,0(a1)
    80006790:	02d7d7bb          	divuw	a5,a5,a3
    80006794:	f8b403a3          	sb	a1,-121(s0)
    80006798:	42eb7e63          	bgeu	s6,a4,80006bd4 <__printf+0x65c>
    8000679c:	02d7f5bb          	remuw	a1,a5,a3
    800067a0:	02059593          	slli	a1,a1,0x20
    800067a4:	0205d593          	srli	a1,a1,0x20
    800067a8:	00bd85b3          	add	a1,s11,a1
    800067ac:	0005c583          	lbu	a1,0(a1)
    800067b0:	02d7d7bb          	divuw	a5,a5,a3
    800067b4:	f8b40423          	sb	a1,-120(s0)
    800067b8:	42ebfc63          	bgeu	s7,a4,80006bf0 <__printf+0x678>
    800067bc:	02079793          	slli	a5,a5,0x20
    800067c0:	0207d793          	srli	a5,a5,0x20
    800067c4:	00fd8db3          	add	s11,s11,a5
    800067c8:	000dc703          	lbu	a4,0(s11)
    800067cc:	00a00793          	li	a5,10
    800067d0:	00900c93          	li	s9,9
    800067d4:	f8e404a3          	sb	a4,-119(s0)
    800067d8:	00065c63          	bgez	a2,800067f0 <__printf+0x278>
    800067dc:	f9040713          	addi	a4,s0,-112
    800067e0:	00f70733          	add	a4,a4,a5
    800067e4:	02d00693          	li	a3,45
    800067e8:	fed70823          	sb	a3,-16(a4)
    800067ec:	00078c93          	mv	s9,a5
    800067f0:	f8040793          	addi	a5,s0,-128
    800067f4:	01978cb3          	add	s9,a5,s9
    800067f8:	f7f40d13          	addi	s10,s0,-129
    800067fc:	000cc503          	lbu	a0,0(s9)
    80006800:	fffc8c93          	addi	s9,s9,-1
    80006804:	00000097          	auipc	ra,0x0
    80006808:	b90080e7          	jalr	-1136(ra) # 80006394 <consputc>
    8000680c:	ffac98e3          	bne	s9,s10,800067fc <__printf+0x284>
    80006810:	00094503          	lbu	a0,0(s2)
    80006814:	e00514e3          	bnez	a0,8000661c <__printf+0xa4>
    80006818:	1a0c1663          	bnez	s8,800069c4 <__printf+0x44c>
    8000681c:	08813083          	ld	ra,136(sp)
    80006820:	08013403          	ld	s0,128(sp)
    80006824:	07813483          	ld	s1,120(sp)
    80006828:	07013903          	ld	s2,112(sp)
    8000682c:	06813983          	ld	s3,104(sp)
    80006830:	06013a03          	ld	s4,96(sp)
    80006834:	05813a83          	ld	s5,88(sp)
    80006838:	05013b03          	ld	s6,80(sp)
    8000683c:	04813b83          	ld	s7,72(sp)
    80006840:	04013c03          	ld	s8,64(sp)
    80006844:	03813c83          	ld	s9,56(sp)
    80006848:	03013d03          	ld	s10,48(sp)
    8000684c:	02813d83          	ld	s11,40(sp)
    80006850:	0d010113          	addi	sp,sp,208
    80006854:	00008067          	ret
    80006858:	07300713          	li	a4,115
    8000685c:	1ce78a63          	beq	a5,a4,80006a30 <__printf+0x4b8>
    80006860:	07800713          	li	a4,120
    80006864:	1ee79e63          	bne	a5,a4,80006a60 <__printf+0x4e8>
    80006868:	f7843783          	ld	a5,-136(s0)
    8000686c:	0007a703          	lw	a4,0(a5)
    80006870:	00878793          	addi	a5,a5,8
    80006874:	f6f43c23          	sd	a5,-136(s0)
    80006878:	28074263          	bltz	a4,80006afc <__printf+0x584>
    8000687c:	00002d97          	auipc	s11,0x2
    80006880:	e8cd8d93          	addi	s11,s11,-372 # 80008708 <digits>
    80006884:	00f77793          	andi	a5,a4,15
    80006888:	00fd87b3          	add	a5,s11,a5
    8000688c:	0007c683          	lbu	a3,0(a5)
    80006890:	00f00613          	li	a2,15
    80006894:	0007079b          	sext.w	a5,a4
    80006898:	f8d40023          	sb	a3,-128(s0)
    8000689c:	0047559b          	srliw	a1,a4,0x4
    800068a0:	0047569b          	srliw	a3,a4,0x4
    800068a4:	00000c93          	li	s9,0
    800068a8:	0ee65063          	bge	a2,a4,80006988 <__printf+0x410>
    800068ac:	00f6f693          	andi	a3,a3,15
    800068b0:	00dd86b3          	add	a3,s11,a3
    800068b4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800068b8:	0087d79b          	srliw	a5,a5,0x8
    800068bc:	00100c93          	li	s9,1
    800068c0:	f8d400a3          	sb	a3,-127(s0)
    800068c4:	0cb67263          	bgeu	a2,a1,80006988 <__printf+0x410>
    800068c8:	00f7f693          	andi	a3,a5,15
    800068cc:	00dd86b3          	add	a3,s11,a3
    800068d0:	0006c583          	lbu	a1,0(a3)
    800068d4:	00f00613          	li	a2,15
    800068d8:	0047d69b          	srliw	a3,a5,0x4
    800068dc:	f8b40123          	sb	a1,-126(s0)
    800068e0:	0047d593          	srli	a1,a5,0x4
    800068e4:	28f67e63          	bgeu	a2,a5,80006b80 <__printf+0x608>
    800068e8:	00f6f693          	andi	a3,a3,15
    800068ec:	00dd86b3          	add	a3,s11,a3
    800068f0:	0006c503          	lbu	a0,0(a3)
    800068f4:	0087d813          	srli	a6,a5,0x8
    800068f8:	0087d69b          	srliw	a3,a5,0x8
    800068fc:	f8a401a3          	sb	a0,-125(s0)
    80006900:	28b67663          	bgeu	a2,a1,80006b8c <__printf+0x614>
    80006904:	00f6f693          	andi	a3,a3,15
    80006908:	00dd86b3          	add	a3,s11,a3
    8000690c:	0006c583          	lbu	a1,0(a3)
    80006910:	00c7d513          	srli	a0,a5,0xc
    80006914:	00c7d69b          	srliw	a3,a5,0xc
    80006918:	f8b40223          	sb	a1,-124(s0)
    8000691c:	29067a63          	bgeu	a2,a6,80006bb0 <__printf+0x638>
    80006920:	00f6f693          	andi	a3,a3,15
    80006924:	00dd86b3          	add	a3,s11,a3
    80006928:	0006c583          	lbu	a1,0(a3)
    8000692c:	0107d813          	srli	a6,a5,0x10
    80006930:	0107d69b          	srliw	a3,a5,0x10
    80006934:	f8b402a3          	sb	a1,-123(s0)
    80006938:	28a67263          	bgeu	a2,a0,80006bbc <__printf+0x644>
    8000693c:	00f6f693          	andi	a3,a3,15
    80006940:	00dd86b3          	add	a3,s11,a3
    80006944:	0006c683          	lbu	a3,0(a3)
    80006948:	0147d79b          	srliw	a5,a5,0x14
    8000694c:	f8d40323          	sb	a3,-122(s0)
    80006950:	21067663          	bgeu	a2,a6,80006b5c <__printf+0x5e4>
    80006954:	02079793          	slli	a5,a5,0x20
    80006958:	0207d793          	srli	a5,a5,0x20
    8000695c:	00fd8db3          	add	s11,s11,a5
    80006960:	000dc683          	lbu	a3,0(s11)
    80006964:	00800793          	li	a5,8
    80006968:	00700c93          	li	s9,7
    8000696c:	f8d403a3          	sb	a3,-121(s0)
    80006970:	00075c63          	bgez	a4,80006988 <__printf+0x410>
    80006974:	f9040713          	addi	a4,s0,-112
    80006978:	00f70733          	add	a4,a4,a5
    8000697c:	02d00693          	li	a3,45
    80006980:	fed70823          	sb	a3,-16(a4)
    80006984:	00078c93          	mv	s9,a5
    80006988:	f8040793          	addi	a5,s0,-128
    8000698c:	01978cb3          	add	s9,a5,s9
    80006990:	f7f40d13          	addi	s10,s0,-129
    80006994:	000cc503          	lbu	a0,0(s9)
    80006998:	fffc8c93          	addi	s9,s9,-1
    8000699c:	00000097          	auipc	ra,0x0
    800069a0:	9f8080e7          	jalr	-1544(ra) # 80006394 <consputc>
    800069a4:	ff9d18e3          	bne	s10,s9,80006994 <__printf+0x41c>
    800069a8:	0100006f          	j	800069b8 <__printf+0x440>
    800069ac:	00000097          	auipc	ra,0x0
    800069b0:	9e8080e7          	jalr	-1560(ra) # 80006394 <consputc>
    800069b4:	000c8493          	mv	s1,s9
    800069b8:	00094503          	lbu	a0,0(s2)
    800069bc:	c60510e3          	bnez	a0,8000661c <__printf+0xa4>
    800069c0:	e40c0ee3          	beqz	s8,8000681c <__printf+0x2a4>
    800069c4:	00005517          	auipc	a0,0x5
    800069c8:	bdc50513          	addi	a0,a0,-1060 # 8000b5a0 <pr>
    800069cc:	00001097          	auipc	ra,0x1
    800069d0:	94c080e7          	jalr	-1716(ra) # 80007318 <release>
    800069d4:	e49ff06f          	j	8000681c <__printf+0x2a4>
    800069d8:	f7843783          	ld	a5,-136(s0)
    800069dc:	03000513          	li	a0,48
    800069e0:	01000d13          	li	s10,16
    800069e4:	00878713          	addi	a4,a5,8
    800069e8:	0007bc83          	ld	s9,0(a5)
    800069ec:	f6e43c23          	sd	a4,-136(s0)
    800069f0:	00000097          	auipc	ra,0x0
    800069f4:	9a4080e7          	jalr	-1628(ra) # 80006394 <consputc>
    800069f8:	07800513          	li	a0,120
    800069fc:	00000097          	auipc	ra,0x0
    80006a00:	998080e7          	jalr	-1640(ra) # 80006394 <consputc>
    80006a04:	00002d97          	auipc	s11,0x2
    80006a08:	d04d8d93          	addi	s11,s11,-764 # 80008708 <digits>
    80006a0c:	03ccd793          	srli	a5,s9,0x3c
    80006a10:	00fd87b3          	add	a5,s11,a5
    80006a14:	0007c503          	lbu	a0,0(a5)
    80006a18:	fffd0d1b          	addiw	s10,s10,-1
    80006a1c:	004c9c93          	slli	s9,s9,0x4
    80006a20:	00000097          	auipc	ra,0x0
    80006a24:	974080e7          	jalr	-1676(ra) # 80006394 <consputc>
    80006a28:	fe0d12e3          	bnez	s10,80006a0c <__printf+0x494>
    80006a2c:	f8dff06f          	j	800069b8 <__printf+0x440>
    80006a30:	f7843783          	ld	a5,-136(s0)
    80006a34:	0007bc83          	ld	s9,0(a5)
    80006a38:	00878793          	addi	a5,a5,8
    80006a3c:	f6f43c23          	sd	a5,-136(s0)
    80006a40:	000c9a63          	bnez	s9,80006a54 <__printf+0x4dc>
    80006a44:	1080006f          	j	80006b4c <__printf+0x5d4>
    80006a48:	001c8c93          	addi	s9,s9,1
    80006a4c:	00000097          	auipc	ra,0x0
    80006a50:	948080e7          	jalr	-1720(ra) # 80006394 <consputc>
    80006a54:	000cc503          	lbu	a0,0(s9)
    80006a58:	fe0518e3          	bnez	a0,80006a48 <__printf+0x4d0>
    80006a5c:	f5dff06f          	j	800069b8 <__printf+0x440>
    80006a60:	02500513          	li	a0,37
    80006a64:	00000097          	auipc	ra,0x0
    80006a68:	930080e7          	jalr	-1744(ra) # 80006394 <consputc>
    80006a6c:	000c8513          	mv	a0,s9
    80006a70:	00000097          	auipc	ra,0x0
    80006a74:	924080e7          	jalr	-1756(ra) # 80006394 <consputc>
    80006a78:	f41ff06f          	j	800069b8 <__printf+0x440>
    80006a7c:	02500513          	li	a0,37
    80006a80:	00000097          	auipc	ra,0x0
    80006a84:	914080e7          	jalr	-1772(ra) # 80006394 <consputc>
    80006a88:	f31ff06f          	j	800069b8 <__printf+0x440>
    80006a8c:	00030513          	mv	a0,t1
    80006a90:	00000097          	auipc	ra,0x0
    80006a94:	7bc080e7          	jalr	1980(ra) # 8000724c <acquire>
    80006a98:	b4dff06f          	j	800065e4 <__printf+0x6c>
    80006a9c:	40c0053b          	negw	a0,a2
    80006aa0:	00a00713          	li	a4,10
    80006aa4:	02e576bb          	remuw	a3,a0,a4
    80006aa8:	00002d97          	auipc	s11,0x2
    80006aac:	c60d8d93          	addi	s11,s11,-928 # 80008708 <digits>
    80006ab0:	ff700593          	li	a1,-9
    80006ab4:	02069693          	slli	a3,a3,0x20
    80006ab8:	0206d693          	srli	a3,a3,0x20
    80006abc:	00dd86b3          	add	a3,s11,a3
    80006ac0:	0006c683          	lbu	a3,0(a3)
    80006ac4:	02e557bb          	divuw	a5,a0,a4
    80006ac8:	f8d40023          	sb	a3,-128(s0)
    80006acc:	10b65e63          	bge	a2,a1,80006be8 <__printf+0x670>
    80006ad0:	06300593          	li	a1,99
    80006ad4:	02e7f6bb          	remuw	a3,a5,a4
    80006ad8:	02069693          	slli	a3,a3,0x20
    80006adc:	0206d693          	srli	a3,a3,0x20
    80006ae0:	00dd86b3          	add	a3,s11,a3
    80006ae4:	0006c683          	lbu	a3,0(a3)
    80006ae8:	02e7d73b          	divuw	a4,a5,a4
    80006aec:	00200793          	li	a5,2
    80006af0:	f8d400a3          	sb	a3,-127(s0)
    80006af4:	bca5ece3          	bltu	a1,a0,800066cc <__printf+0x154>
    80006af8:	ce5ff06f          	j	800067dc <__printf+0x264>
    80006afc:	40e007bb          	negw	a5,a4
    80006b00:	00002d97          	auipc	s11,0x2
    80006b04:	c08d8d93          	addi	s11,s11,-1016 # 80008708 <digits>
    80006b08:	00f7f693          	andi	a3,a5,15
    80006b0c:	00dd86b3          	add	a3,s11,a3
    80006b10:	0006c583          	lbu	a1,0(a3)
    80006b14:	ff100613          	li	a2,-15
    80006b18:	0047d69b          	srliw	a3,a5,0x4
    80006b1c:	f8b40023          	sb	a1,-128(s0)
    80006b20:	0047d59b          	srliw	a1,a5,0x4
    80006b24:	0ac75e63          	bge	a4,a2,80006be0 <__printf+0x668>
    80006b28:	00f6f693          	andi	a3,a3,15
    80006b2c:	00dd86b3          	add	a3,s11,a3
    80006b30:	0006c603          	lbu	a2,0(a3)
    80006b34:	00f00693          	li	a3,15
    80006b38:	0087d79b          	srliw	a5,a5,0x8
    80006b3c:	f8c400a3          	sb	a2,-127(s0)
    80006b40:	d8b6e4e3          	bltu	a3,a1,800068c8 <__printf+0x350>
    80006b44:	00200793          	li	a5,2
    80006b48:	e2dff06f          	j	80006974 <__printf+0x3fc>
    80006b4c:	00002c97          	auipc	s9,0x2
    80006b50:	b9cc8c93          	addi	s9,s9,-1124 # 800086e8 <CONSOLE_STATUS+0x6d8>
    80006b54:	02800513          	li	a0,40
    80006b58:	ef1ff06f          	j	80006a48 <__printf+0x4d0>
    80006b5c:	00700793          	li	a5,7
    80006b60:	00600c93          	li	s9,6
    80006b64:	e0dff06f          	j	80006970 <__printf+0x3f8>
    80006b68:	00700793          	li	a5,7
    80006b6c:	00600c93          	li	s9,6
    80006b70:	c69ff06f          	j	800067d8 <__printf+0x260>
    80006b74:	00300793          	li	a5,3
    80006b78:	00200c93          	li	s9,2
    80006b7c:	c5dff06f          	j	800067d8 <__printf+0x260>
    80006b80:	00300793          	li	a5,3
    80006b84:	00200c93          	li	s9,2
    80006b88:	de9ff06f          	j	80006970 <__printf+0x3f8>
    80006b8c:	00400793          	li	a5,4
    80006b90:	00300c93          	li	s9,3
    80006b94:	dddff06f          	j	80006970 <__printf+0x3f8>
    80006b98:	00400793          	li	a5,4
    80006b9c:	00300c93          	li	s9,3
    80006ba0:	c39ff06f          	j	800067d8 <__printf+0x260>
    80006ba4:	00500793          	li	a5,5
    80006ba8:	00400c93          	li	s9,4
    80006bac:	c2dff06f          	j	800067d8 <__printf+0x260>
    80006bb0:	00500793          	li	a5,5
    80006bb4:	00400c93          	li	s9,4
    80006bb8:	db9ff06f          	j	80006970 <__printf+0x3f8>
    80006bbc:	00600793          	li	a5,6
    80006bc0:	00500c93          	li	s9,5
    80006bc4:	dadff06f          	j	80006970 <__printf+0x3f8>
    80006bc8:	00600793          	li	a5,6
    80006bcc:	00500c93          	li	s9,5
    80006bd0:	c09ff06f          	j	800067d8 <__printf+0x260>
    80006bd4:	00800793          	li	a5,8
    80006bd8:	00700c93          	li	s9,7
    80006bdc:	bfdff06f          	j	800067d8 <__printf+0x260>
    80006be0:	00100793          	li	a5,1
    80006be4:	d91ff06f          	j	80006974 <__printf+0x3fc>
    80006be8:	00100793          	li	a5,1
    80006bec:	bf1ff06f          	j	800067dc <__printf+0x264>
    80006bf0:	00900793          	li	a5,9
    80006bf4:	00800c93          	li	s9,8
    80006bf8:	be1ff06f          	j	800067d8 <__printf+0x260>
    80006bfc:	00002517          	auipc	a0,0x2
    80006c00:	af450513          	addi	a0,a0,-1292 # 800086f0 <CONSOLE_STATUS+0x6e0>
    80006c04:	00000097          	auipc	ra,0x0
    80006c08:	918080e7          	jalr	-1768(ra) # 8000651c <panic>

0000000080006c0c <printfinit>:
    80006c0c:	fe010113          	addi	sp,sp,-32
    80006c10:	00813823          	sd	s0,16(sp)
    80006c14:	00913423          	sd	s1,8(sp)
    80006c18:	00113c23          	sd	ra,24(sp)
    80006c1c:	02010413          	addi	s0,sp,32
    80006c20:	00005497          	auipc	s1,0x5
    80006c24:	98048493          	addi	s1,s1,-1664 # 8000b5a0 <pr>
    80006c28:	00048513          	mv	a0,s1
    80006c2c:	00002597          	auipc	a1,0x2
    80006c30:	ad458593          	addi	a1,a1,-1324 # 80008700 <CONSOLE_STATUS+0x6f0>
    80006c34:	00000097          	auipc	ra,0x0
    80006c38:	5f4080e7          	jalr	1524(ra) # 80007228 <initlock>
    80006c3c:	01813083          	ld	ra,24(sp)
    80006c40:	01013403          	ld	s0,16(sp)
    80006c44:	0004ac23          	sw	zero,24(s1)
    80006c48:	00813483          	ld	s1,8(sp)
    80006c4c:	02010113          	addi	sp,sp,32
    80006c50:	00008067          	ret

0000000080006c54 <uartinit>:
    80006c54:	ff010113          	addi	sp,sp,-16
    80006c58:	00813423          	sd	s0,8(sp)
    80006c5c:	01010413          	addi	s0,sp,16
    80006c60:	100007b7          	lui	a5,0x10000
    80006c64:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80006c68:	f8000713          	li	a4,-128
    80006c6c:	00e781a3          	sb	a4,3(a5)
    80006c70:	00300713          	li	a4,3
    80006c74:	00e78023          	sb	a4,0(a5)
    80006c78:	000780a3          	sb	zero,1(a5)
    80006c7c:	00e781a3          	sb	a4,3(a5)
    80006c80:	00700693          	li	a3,7
    80006c84:	00d78123          	sb	a3,2(a5)
    80006c88:	00e780a3          	sb	a4,1(a5)
    80006c8c:	00813403          	ld	s0,8(sp)
    80006c90:	01010113          	addi	sp,sp,16
    80006c94:	00008067          	ret

0000000080006c98 <uartputc>:
    80006c98:	00003797          	auipc	a5,0x3
    80006c9c:	6507a783          	lw	a5,1616(a5) # 8000a2e8 <panicked>
    80006ca0:	00078463          	beqz	a5,80006ca8 <uartputc+0x10>
    80006ca4:	0000006f          	j	80006ca4 <uartputc+0xc>
    80006ca8:	fd010113          	addi	sp,sp,-48
    80006cac:	02813023          	sd	s0,32(sp)
    80006cb0:	00913c23          	sd	s1,24(sp)
    80006cb4:	01213823          	sd	s2,16(sp)
    80006cb8:	01313423          	sd	s3,8(sp)
    80006cbc:	02113423          	sd	ra,40(sp)
    80006cc0:	03010413          	addi	s0,sp,48
    80006cc4:	00003917          	auipc	s2,0x3
    80006cc8:	62c90913          	addi	s2,s2,1580 # 8000a2f0 <uart_tx_r>
    80006ccc:	00093783          	ld	a5,0(s2)
    80006cd0:	00003497          	auipc	s1,0x3
    80006cd4:	62848493          	addi	s1,s1,1576 # 8000a2f8 <uart_tx_w>
    80006cd8:	0004b703          	ld	a4,0(s1)
    80006cdc:	02078693          	addi	a3,a5,32
    80006ce0:	00050993          	mv	s3,a0
    80006ce4:	02e69c63          	bne	a3,a4,80006d1c <uartputc+0x84>
    80006ce8:	00001097          	auipc	ra,0x1
    80006cec:	834080e7          	jalr	-1996(ra) # 8000751c <push_on>
    80006cf0:	00093783          	ld	a5,0(s2)
    80006cf4:	0004b703          	ld	a4,0(s1)
    80006cf8:	02078793          	addi	a5,a5,32
    80006cfc:	00e79463          	bne	a5,a4,80006d04 <uartputc+0x6c>
    80006d00:	0000006f          	j	80006d00 <uartputc+0x68>
    80006d04:	00001097          	auipc	ra,0x1
    80006d08:	88c080e7          	jalr	-1908(ra) # 80007590 <pop_on>
    80006d0c:	00093783          	ld	a5,0(s2)
    80006d10:	0004b703          	ld	a4,0(s1)
    80006d14:	02078693          	addi	a3,a5,32
    80006d18:	fce688e3          	beq	a3,a4,80006ce8 <uartputc+0x50>
    80006d1c:	01f77693          	andi	a3,a4,31
    80006d20:	00005597          	auipc	a1,0x5
    80006d24:	8a058593          	addi	a1,a1,-1888 # 8000b5c0 <uart_tx_buf>
    80006d28:	00d586b3          	add	a3,a1,a3
    80006d2c:	00170713          	addi	a4,a4,1
    80006d30:	01368023          	sb	s3,0(a3)
    80006d34:	00e4b023          	sd	a4,0(s1)
    80006d38:	10000637          	lui	a2,0x10000
    80006d3c:	02f71063          	bne	a4,a5,80006d5c <uartputc+0xc4>
    80006d40:	0340006f          	j	80006d74 <uartputc+0xdc>
    80006d44:	00074703          	lbu	a4,0(a4)
    80006d48:	00f93023          	sd	a5,0(s2)
    80006d4c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80006d50:	00093783          	ld	a5,0(s2)
    80006d54:	0004b703          	ld	a4,0(s1)
    80006d58:	00f70e63          	beq	a4,a5,80006d74 <uartputc+0xdc>
    80006d5c:	00564683          	lbu	a3,5(a2)
    80006d60:	01f7f713          	andi	a4,a5,31
    80006d64:	00e58733          	add	a4,a1,a4
    80006d68:	0206f693          	andi	a3,a3,32
    80006d6c:	00178793          	addi	a5,a5,1
    80006d70:	fc069ae3          	bnez	a3,80006d44 <uartputc+0xac>
    80006d74:	02813083          	ld	ra,40(sp)
    80006d78:	02013403          	ld	s0,32(sp)
    80006d7c:	01813483          	ld	s1,24(sp)
    80006d80:	01013903          	ld	s2,16(sp)
    80006d84:	00813983          	ld	s3,8(sp)
    80006d88:	03010113          	addi	sp,sp,48
    80006d8c:	00008067          	ret

0000000080006d90 <uartputc_sync>:
    80006d90:	ff010113          	addi	sp,sp,-16
    80006d94:	00813423          	sd	s0,8(sp)
    80006d98:	01010413          	addi	s0,sp,16
    80006d9c:	00003717          	auipc	a4,0x3
    80006da0:	54c72703          	lw	a4,1356(a4) # 8000a2e8 <panicked>
    80006da4:	02071663          	bnez	a4,80006dd0 <uartputc_sync+0x40>
    80006da8:	00050793          	mv	a5,a0
    80006dac:	100006b7          	lui	a3,0x10000
    80006db0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80006db4:	02077713          	andi	a4,a4,32
    80006db8:	fe070ce3          	beqz	a4,80006db0 <uartputc_sync+0x20>
    80006dbc:	0ff7f793          	andi	a5,a5,255
    80006dc0:	00f68023          	sb	a5,0(a3)
    80006dc4:	00813403          	ld	s0,8(sp)
    80006dc8:	01010113          	addi	sp,sp,16
    80006dcc:	00008067          	ret
    80006dd0:	0000006f          	j	80006dd0 <uartputc_sync+0x40>

0000000080006dd4 <uartstart>:
    80006dd4:	ff010113          	addi	sp,sp,-16
    80006dd8:	00813423          	sd	s0,8(sp)
    80006ddc:	01010413          	addi	s0,sp,16
    80006de0:	00003617          	auipc	a2,0x3
    80006de4:	51060613          	addi	a2,a2,1296 # 8000a2f0 <uart_tx_r>
    80006de8:	00003517          	auipc	a0,0x3
    80006dec:	51050513          	addi	a0,a0,1296 # 8000a2f8 <uart_tx_w>
    80006df0:	00063783          	ld	a5,0(a2)
    80006df4:	00053703          	ld	a4,0(a0)
    80006df8:	04f70263          	beq	a4,a5,80006e3c <uartstart+0x68>
    80006dfc:	100005b7          	lui	a1,0x10000
    80006e00:	00004817          	auipc	a6,0x4
    80006e04:	7c080813          	addi	a6,a6,1984 # 8000b5c0 <uart_tx_buf>
    80006e08:	01c0006f          	j	80006e24 <uartstart+0x50>
    80006e0c:	0006c703          	lbu	a4,0(a3)
    80006e10:	00f63023          	sd	a5,0(a2)
    80006e14:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006e18:	00063783          	ld	a5,0(a2)
    80006e1c:	00053703          	ld	a4,0(a0)
    80006e20:	00f70e63          	beq	a4,a5,80006e3c <uartstart+0x68>
    80006e24:	01f7f713          	andi	a4,a5,31
    80006e28:	00e806b3          	add	a3,a6,a4
    80006e2c:	0055c703          	lbu	a4,5(a1)
    80006e30:	00178793          	addi	a5,a5,1
    80006e34:	02077713          	andi	a4,a4,32
    80006e38:	fc071ae3          	bnez	a4,80006e0c <uartstart+0x38>
    80006e3c:	00813403          	ld	s0,8(sp)
    80006e40:	01010113          	addi	sp,sp,16
    80006e44:	00008067          	ret

0000000080006e48 <uartgetc>:
    80006e48:	ff010113          	addi	sp,sp,-16
    80006e4c:	00813423          	sd	s0,8(sp)
    80006e50:	01010413          	addi	s0,sp,16
    80006e54:	10000737          	lui	a4,0x10000
    80006e58:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80006e5c:	0017f793          	andi	a5,a5,1
    80006e60:	00078c63          	beqz	a5,80006e78 <uartgetc+0x30>
    80006e64:	00074503          	lbu	a0,0(a4)
    80006e68:	0ff57513          	andi	a0,a0,255
    80006e6c:	00813403          	ld	s0,8(sp)
    80006e70:	01010113          	addi	sp,sp,16
    80006e74:	00008067          	ret
    80006e78:	fff00513          	li	a0,-1
    80006e7c:	ff1ff06f          	j	80006e6c <uartgetc+0x24>

0000000080006e80 <uartintr>:
    80006e80:	100007b7          	lui	a5,0x10000
    80006e84:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80006e88:	0017f793          	andi	a5,a5,1
    80006e8c:	0a078463          	beqz	a5,80006f34 <uartintr+0xb4>
    80006e90:	fe010113          	addi	sp,sp,-32
    80006e94:	00813823          	sd	s0,16(sp)
    80006e98:	00913423          	sd	s1,8(sp)
    80006e9c:	00113c23          	sd	ra,24(sp)
    80006ea0:	02010413          	addi	s0,sp,32
    80006ea4:	100004b7          	lui	s1,0x10000
    80006ea8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80006eac:	0ff57513          	andi	a0,a0,255
    80006eb0:	fffff097          	auipc	ra,0xfffff
    80006eb4:	534080e7          	jalr	1332(ra) # 800063e4 <consoleintr>
    80006eb8:	0054c783          	lbu	a5,5(s1)
    80006ebc:	0017f793          	andi	a5,a5,1
    80006ec0:	fe0794e3          	bnez	a5,80006ea8 <uartintr+0x28>
    80006ec4:	00003617          	auipc	a2,0x3
    80006ec8:	42c60613          	addi	a2,a2,1068 # 8000a2f0 <uart_tx_r>
    80006ecc:	00003517          	auipc	a0,0x3
    80006ed0:	42c50513          	addi	a0,a0,1068 # 8000a2f8 <uart_tx_w>
    80006ed4:	00063783          	ld	a5,0(a2)
    80006ed8:	00053703          	ld	a4,0(a0)
    80006edc:	04f70263          	beq	a4,a5,80006f20 <uartintr+0xa0>
    80006ee0:	100005b7          	lui	a1,0x10000
    80006ee4:	00004817          	auipc	a6,0x4
    80006ee8:	6dc80813          	addi	a6,a6,1756 # 8000b5c0 <uart_tx_buf>
    80006eec:	01c0006f          	j	80006f08 <uartintr+0x88>
    80006ef0:	0006c703          	lbu	a4,0(a3)
    80006ef4:	00f63023          	sd	a5,0(a2)
    80006ef8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006efc:	00063783          	ld	a5,0(a2)
    80006f00:	00053703          	ld	a4,0(a0)
    80006f04:	00f70e63          	beq	a4,a5,80006f20 <uartintr+0xa0>
    80006f08:	01f7f713          	andi	a4,a5,31
    80006f0c:	00e806b3          	add	a3,a6,a4
    80006f10:	0055c703          	lbu	a4,5(a1)
    80006f14:	00178793          	addi	a5,a5,1
    80006f18:	02077713          	andi	a4,a4,32
    80006f1c:	fc071ae3          	bnez	a4,80006ef0 <uartintr+0x70>
    80006f20:	01813083          	ld	ra,24(sp)
    80006f24:	01013403          	ld	s0,16(sp)
    80006f28:	00813483          	ld	s1,8(sp)
    80006f2c:	02010113          	addi	sp,sp,32
    80006f30:	00008067          	ret
    80006f34:	00003617          	auipc	a2,0x3
    80006f38:	3bc60613          	addi	a2,a2,956 # 8000a2f0 <uart_tx_r>
    80006f3c:	00003517          	auipc	a0,0x3
    80006f40:	3bc50513          	addi	a0,a0,956 # 8000a2f8 <uart_tx_w>
    80006f44:	00063783          	ld	a5,0(a2)
    80006f48:	00053703          	ld	a4,0(a0)
    80006f4c:	04f70263          	beq	a4,a5,80006f90 <uartintr+0x110>
    80006f50:	100005b7          	lui	a1,0x10000
    80006f54:	00004817          	auipc	a6,0x4
    80006f58:	66c80813          	addi	a6,a6,1644 # 8000b5c0 <uart_tx_buf>
    80006f5c:	01c0006f          	j	80006f78 <uartintr+0xf8>
    80006f60:	0006c703          	lbu	a4,0(a3)
    80006f64:	00f63023          	sd	a5,0(a2)
    80006f68:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006f6c:	00063783          	ld	a5,0(a2)
    80006f70:	00053703          	ld	a4,0(a0)
    80006f74:	02f70063          	beq	a4,a5,80006f94 <uartintr+0x114>
    80006f78:	01f7f713          	andi	a4,a5,31
    80006f7c:	00e806b3          	add	a3,a6,a4
    80006f80:	0055c703          	lbu	a4,5(a1)
    80006f84:	00178793          	addi	a5,a5,1
    80006f88:	02077713          	andi	a4,a4,32
    80006f8c:	fc071ae3          	bnez	a4,80006f60 <uartintr+0xe0>
    80006f90:	00008067          	ret
    80006f94:	00008067          	ret

0000000080006f98 <kinit>:
    80006f98:	fc010113          	addi	sp,sp,-64
    80006f9c:	02913423          	sd	s1,40(sp)
    80006fa0:	fffff7b7          	lui	a5,0xfffff
    80006fa4:	00005497          	auipc	s1,0x5
    80006fa8:	64b48493          	addi	s1,s1,1611 # 8000c5ef <end+0xfff>
    80006fac:	02813823          	sd	s0,48(sp)
    80006fb0:	01313c23          	sd	s3,24(sp)
    80006fb4:	00f4f4b3          	and	s1,s1,a5
    80006fb8:	02113c23          	sd	ra,56(sp)
    80006fbc:	03213023          	sd	s2,32(sp)
    80006fc0:	01413823          	sd	s4,16(sp)
    80006fc4:	01513423          	sd	s5,8(sp)
    80006fc8:	04010413          	addi	s0,sp,64
    80006fcc:	000017b7          	lui	a5,0x1
    80006fd0:	01100993          	li	s3,17
    80006fd4:	00f487b3          	add	a5,s1,a5
    80006fd8:	01b99993          	slli	s3,s3,0x1b
    80006fdc:	06f9e063          	bltu	s3,a5,8000703c <kinit+0xa4>
    80006fe0:	00004a97          	auipc	s5,0x4
    80006fe4:	610a8a93          	addi	s5,s5,1552 # 8000b5f0 <end>
    80006fe8:	0754ec63          	bltu	s1,s5,80007060 <kinit+0xc8>
    80006fec:	0734fa63          	bgeu	s1,s3,80007060 <kinit+0xc8>
    80006ff0:	00088a37          	lui	s4,0x88
    80006ff4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80006ff8:	00003917          	auipc	s2,0x3
    80006ffc:	30890913          	addi	s2,s2,776 # 8000a300 <kmem>
    80007000:	00ca1a13          	slli	s4,s4,0xc
    80007004:	0140006f          	j	80007018 <kinit+0x80>
    80007008:	000017b7          	lui	a5,0x1
    8000700c:	00f484b3          	add	s1,s1,a5
    80007010:	0554e863          	bltu	s1,s5,80007060 <kinit+0xc8>
    80007014:	0534f663          	bgeu	s1,s3,80007060 <kinit+0xc8>
    80007018:	00001637          	lui	a2,0x1
    8000701c:	00100593          	li	a1,1
    80007020:	00048513          	mv	a0,s1
    80007024:	00000097          	auipc	ra,0x0
    80007028:	5e4080e7          	jalr	1508(ra) # 80007608 <__memset>
    8000702c:	00093783          	ld	a5,0(s2)
    80007030:	00f4b023          	sd	a5,0(s1)
    80007034:	00993023          	sd	s1,0(s2)
    80007038:	fd4498e3          	bne	s1,s4,80007008 <kinit+0x70>
    8000703c:	03813083          	ld	ra,56(sp)
    80007040:	03013403          	ld	s0,48(sp)
    80007044:	02813483          	ld	s1,40(sp)
    80007048:	02013903          	ld	s2,32(sp)
    8000704c:	01813983          	ld	s3,24(sp)
    80007050:	01013a03          	ld	s4,16(sp)
    80007054:	00813a83          	ld	s5,8(sp)
    80007058:	04010113          	addi	sp,sp,64
    8000705c:	00008067          	ret
    80007060:	00001517          	auipc	a0,0x1
    80007064:	6c050513          	addi	a0,a0,1728 # 80008720 <digits+0x18>
    80007068:	fffff097          	auipc	ra,0xfffff
    8000706c:	4b4080e7          	jalr	1204(ra) # 8000651c <panic>

0000000080007070 <freerange>:
    80007070:	fc010113          	addi	sp,sp,-64
    80007074:	000017b7          	lui	a5,0x1
    80007078:	02913423          	sd	s1,40(sp)
    8000707c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80007080:	009504b3          	add	s1,a0,s1
    80007084:	fffff537          	lui	a0,0xfffff
    80007088:	02813823          	sd	s0,48(sp)
    8000708c:	02113c23          	sd	ra,56(sp)
    80007090:	03213023          	sd	s2,32(sp)
    80007094:	01313c23          	sd	s3,24(sp)
    80007098:	01413823          	sd	s4,16(sp)
    8000709c:	01513423          	sd	s5,8(sp)
    800070a0:	01613023          	sd	s6,0(sp)
    800070a4:	04010413          	addi	s0,sp,64
    800070a8:	00a4f4b3          	and	s1,s1,a0
    800070ac:	00f487b3          	add	a5,s1,a5
    800070b0:	06f5e463          	bltu	a1,a5,80007118 <freerange+0xa8>
    800070b4:	00004a97          	auipc	s5,0x4
    800070b8:	53ca8a93          	addi	s5,s5,1340 # 8000b5f0 <end>
    800070bc:	0954e263          	bltu	s1,s5,80007140 <freerange+0xd0>
    800070c0:	01100993          	li	s3,17
    800070c4:	01b99993          	slli	s3,s3,0x1b
    800070c8:	0734fc63          	bgeu	s1,s3,80007140 <freerange+0xd0>
    800070cc:	00058a13          	mv	s4,a1
    800070d0:	00003917          	auipc	s2,0x3
    800070d4:	23090913          	addi	s2,s2,560 # 8000a300 <kmem>
    800070d8:	00002b37          	lui	s6,0x2
    800070dc:	0140006f          	j	800070f0 <freerange+0x80>
    800070e0:	000017b7          	lui	a5,0x1
    800070e4:	00f484b3          	add	s1,s1,a5
    800070e8:	0554ec63          	bltu	s1,s5,80007140 <freerange+0xd0>
    800070ec:	0534fa63          	bgeu	s1,s3,80007140 <freerange+0xd0>
    800070f0:	00001637          	lui	a2,0x1
    800070f4:	00100593          	li	a1,1
    800070f8:	00048513          	mv	a0,s1
    800070fc:	00000097          	auipc	ra,0x0
    80007100:	50c080e7          	jalr	1292(ra) # 80007608 <__memset>
    80007104:	00093703          	ld	a4,0(s2)
    80007108:	016487b3          	add	a5,s1,s6
    8000710c:	00e4b023          	sd	a4,0(s1)
    80007110:	00993023          	sd	s1,0(s2)
    80007114:	fcfa76e3          	bgeu	s4,a5,800070e0 <freerange+0x70>
    80007118:	03813083          	ld	ra,56(sp)
    8000711c:	03013403          	ld	s0,48(sp)
    80007120:	02813483          	ld	s1,40(sp)
    80007124:	02013903          	ld	s2,32(sp)
    80007128:	01813983          	ld	s3,24(sp)
    8000712c:	01013a03          	ld	s4,16(sp)
    80007130:	00813a83          	ld	s5,8(sp)
    80007134:	00013b03          	ld	s6,0(sp)
    80007138:	04010113          	addi	sp,sp,64
    8000713c:	00008067          	ret
    80007140:	00001517          	auipc	a0,0x1
    80007144:	5e050513          	addi	a0,a0,1504 # 80008720 <digits+0x18>
    80007148:	fffff097          	auipc	ra,0xfffff
    8000714c:	3d4080e7          	jalr	980(ra) # 8000651c <panic>

0000000080007150 <kfree>:
    80007150:	fe010113          	addi	sp,sp,-32
    80007154:	00813823          	sd	s0,16(sp)
    80007158:	00113c23          	sd	ra,24(sp)
    8000715c:	00913423          	sd	s1,8(sp)
    80007160:	02010413          	addi	s0,sp,32
    80007164:	03451793          	slli	a5,a0,0x34
    80007168:	04079c63          	bnez	a5,800071c0 <kfree+0x70>
    8000716c:	00004797          	auipc	a5,0x4
    80007170:	48478793          	addi	a5,a5,1156 # 8000b5f0 <end>
    80007174:	00050493          	mv	s1,a0
    80007178:	04f56463          	bltu	a0,a5,800071c0 <kfree+0x70>
    8000717c:	01100793          	li	a5,17
    80007180:	01b79793          	slli	a5,a5,0x1b
    80007184:	02f57e63          	bgeu	a0,a5,800071c0 <kfree+0x70>
    80007188:	00001637          	lui	a2,0x1
    8000718c:	00100593          	li	a1,1
    80007190:	00000097          	auipc	ra,0x0
    80007194:	478080e7          	jalr	1144(ra) # 80007608 <__memset>
    80007198:	00003797          	auipc	a5,0x3
    8000719c:	16878793          	addi	a5,a5,360 # 8000a300 <kmem>
    800071a0:	0007b703          	ld	a4,0(a5)
    800071a4:	01813083          	ld	ra,24(sp)
    800071a8:	01013403          	ld	s0,16(sp)
    800071ac:	00e4b023          	sd	a4,0(s1)
    800071b0:	0097b023          	sd	s1,0(a5)
    800071b4:	00813483          	ld	s1,8(sp)
    800071b8:	02010113          	addi	sp,sp,32
    800071bc:	00008067          	ret
    800071c0:	00001517          	auipc	a0,0x1
    800071c4:	56050513          	addi	a0,a0,1376 # 80008720 <digits+0x18>
    800071c8:	fffff097          	auipc	ra,0xfffff
    800071cc:	354080e7          	jalr	852(ra) # 8000651c <panic>

00000000800071d0 <kalloc>:
    800071d0:	fe010113          	addi	sp,sp,-32
    800071d4:	00813823          	sd	s0,16(sp)
    800071d8:	00913423          	sd	s1,8(sp)
    800071dc:	00113c23          	sd	ra,24(sp)
    800071e0:	02010413          	addi	s0,sp,32
    800071e4:	00003797          	auipc	a5,0x3
    800071e8:	11c78793          	addi	a5,a5,284 # 8000a300 <kmem>
    800071ec:	0007b483          	ld	s1,0(a5)
    800071f0:	02048063          	beqz	s1,80007210 <kalloc+0x40>
    800071f4:	0004b703          	ld	a4,0(s1)
    800071f8:	00001637          	lui	a2,0x1
    800071fc:	00500593          	li	a1,5
    80007200:	00048513          	mv	a0,s1
    80007204:	00e7b023          	sd	a4,0(a5)
    80007208:	00000097          	auipc	ra,0x0
    8000720c:	400080e7          	jalr	1024(ra) # 80007608 <__memset>
    80007210:	01813083          	ld	ra,24(sp)
    80007214:	01013403          	ld	s0,16(sp)
    80007218:	00048513          	mv	a0,s1
    8000721c:	00813483          	ld	s1,8(sp)
    80007220:	02010113          	addi	sp,sp,32
    80007224:	00008067          	ret

0000000080007228 <initlock>:
    80007228:	ff010113          	addi	sp,sp,-16
    8000722c:	00813423          	sd	s0,8(sp)
    80007230:	01010413          	addi	s0,sp,16
    80007234:	00813403          	ld	s0,8(sp)
    80007238:	00b53423          	sd	a1,8(a0)
    8000723c:	00052023          	sw	zero,0(a0)
    80007240:	00053823          	sd	zero,16(a0)
    80007244:	01010113          	addi	sp,sp,16
    80007248:	00008067          	ret

000000008000724c <acquire>:
    8000724c:	fe010113          	addi	sp,sp,-32
    80007250:	00813823          	sd	s0,16(sp)
    80007254:	00913423          	sd	s1,8(sp)
    80007258:	00113c23          	sd	ra,24(sp)
    8000725c:	01213023          	sd	s2,0(sp)
    80007260:	02010413          	addi	s0,sp,32
    80007264:	00050493          	mv	s1,a0
    80007268:	10002973          	csrr	s2,sstatus
    8000726c:	100027f3          	csrr	a5,sstatus
    80007270:	ffd7f793          	andi	a5,a5,-3
    80007274:	10079073          	csrw	sstatus,a5
    80007278:	fffff097          	auipc	ra,0xfffff
    8000727c:	8e0080e7          	jalr	-1824(ra) # 80005b58 <mycpu>
    80007280:	07852783          	lw	a5,120(a0)
    80007284:	06078e63          	beqz	a5,80007300 <acquire+0xb4>
    80007288:	fffff097          	auipc	ra,0xfffff
    8000728c:	8d0080e7          	jalr	-1840(ra) # 80005b58 <mycpu>
    80007290:	07852783          	lw	a5,120(a0)
    80007294:	0004a703          	lw	a4,0(s1)
    80007298:	0017879b          	addiw	a5,a5,1
    8000729c:	06f52c23          	sw	a5,120(a0)
    800072a0:	04071063          	bnez	a4,800072e0 <acquire+0x94>
    800072a4:	00100713          	li	a4,1
    800072a8:	00070793          	mv	a5,a4
    800072ac:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800072b0:	0007879b          	sext.w	a5,a5
    800072b4:	fe079ae3          	bnez	a5,800072a8 <acquire+0x5c>
    800072b8:	0ff0000f          	fence
    800072bc:	fffff097          	auipc	ra,0xfffff
    800072c0:	89c080e7          	jalr	-1892(ra) # 80005b58 <mycpu>
    800072c4:	01813083          	ld	ra,24(sp)
    800072c8:	01013403          	ld	s0,16(sp)
    800072cc:	00a4b823          	sd	a0,16(s1)
    800072d0:	00013903          	ld	s2,0(sp)
    800072d4:	00813483          	ld	s1,8(sp)
    800072d8:	02010113          	addi	sp,sp,32
    800072dc:	00008067          	ret
    800072e0:	0104b903          	ld	s2,16(s1)
    800072e4:	fffff097          	auipc	ra,0xfffff
    800072e8:	874080e7          	jalr	-1932(ra) # 80005b58 <mycpu>
    800072ec:	faa91ce3          	bne	s2,a0,800072a4 <acquire+0x58>
    800072f0:	00001517          	auipc	a0,0x1
    800072f4:	43850513          	addi	a0,a0,1080 # 80008728 <digits+0x20>
    800072f8:	fffff097          	auipc	ra,0xfffff
    800072fc:	224080e7          	jalr	548(ra) # 8000651c <panic>
    80007300:	00195913          	srli	s2,s2,0x1
    80007304:	fffff097          	auipc	ra,0xfffff
    80007308:	854080e7          	jalr	-1964(ra) # 80005b58 <mycpu>
    8000730c:	00197913          	andi	s2,s2,1
    80007310:	07252e23          	sw	s2,124(a0)
    80007314:	f75ff06f          	j	80007288 <acquire+0x3c>

0000000080007318 <release>:
    80007318:	fe010113          	addi	sp,sp,-32
    8000731c:	00813823          	sd	s0,16(sp)
    80007320:	00113c23          	sd	ra,24(sp)
    80007324:	00913423          	sd	s1,8(sp)
    80007328:	01213023          	sd	s2,0(sp)
    8000732c:	02010413          	addi	s0,sp,32
    80007330:	00052783          	lw	a5,0(a0)
    80007334:	00079a63          	bnez	a5,80007348 <release+0x30>
    80007338:	00001517          	auipc	a0,0x1
    8000733c:	3f850513          	addi	a0,a0,1016 # 80008730 <digits+0x28>
    80007340:	fffff097          	auipc	ra,0xfffff
    80007344:	1dc080e7          	jalr	476(ra) # 8000651c <panic>
    80007348:	01053903          	ld	s2,16(a0)
    8000734c:	00050493          	mv	s1,a0
    80007350:	fffff097          	auipc	ra,0xfffff
    80007354:	808080e7          	jalr	-2040(ra) # 80005b58 <mycpu>
    80007358:	fea910e3          	bne	s2,a0,80007338 <release+0x20>
    8000735c:	0004b823          	sd	zero,16(s1)
    80007360:	0ff0000f          	fence
    80007364:	0f50000f          	fence	iorw,ow
    80007368:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000736c:	ffffe097          	auipc	ra,0xffffe
    80007370:	7ec080e7          	jalr	2028(ra) # 80005b58 <mycpu>
    80007374:	100027f3          	csrr	a5,sstatus
    80007378:	0027f793          	andi	a5,a5,2
    8000737c:	04079a63          	bnez	a5,800073d0 <release+0xb8>
    80007380:	07852783          	lw	a5,120(a0)
    80007384:	02f05e63          	blez	a5,800073c0 <release+0xa8>
    80007388:	fff7871b          	addiw	a4,a5,-1
    8000738c:	06e52c23          	sw	a4,120(a0)
    80007390:	00071c63          	bnez	a4,800073a8 <release+0x90>
    80007394:	07c52783          	lw	a5,124(a0)
    80007398:	00078863          	beqz	a5,800073a8 <release+0x90>
    8000739c:	100027f3          	csrr	a5,sstatus
    800073a0:	0027e793          	ori	a5,a5,2
    800073a4:	10079073          	csrw	sstatus,a5
    800073a8:	01813083          	ld	ra,24(sp)
    800073ac:	01013403          	ld	s0,16(sp)
    800073b0:	00813483          	ld	s1,8(sp)
    800073b4:	00013903          	ld	s2,0(sp)
    800073b8:	02010113          	addi	sp,sp,32
    800073bc:	00008067          	ret
    800073c0:	00001517          	auipc	a0,0x1
    800073c4:	39050513          	addi	a0,a0,912 # 80008750 <digits+0x48>
    800073c8:	fffff097          	auipc	ra,0xfffff
    800073cc:	154080e7          	jalr	340(ra) # 8000651c <panic>
    800073d0:	00001517          	auipc	a0,0x1
    800073d4:	36850513          	addi	a0,a0,872 # 80008738 <digits+0x30>
    800073d8:	fffff097          	auipc	ra,0xfffff
    800073dc:	144080e7          	jalr	324(ra) # 8000651c <panic>

00000000800073e0 <holding>:
    800073e0:	00052783          	lw	a5,0(a0)
    800073e4:	00079663          	bnez	a5,800073f0 <holding+0x10>
    800073e8:	00000513          	li	a0,0
    800073ec:	00008067          	ret
    800073f0:	fe010113          	addi	sp,sp,-32
    800073f4:	00813823          	sd	s0,16(sp)
    800073f8:	00913423          	sd	s1,8(sp)
    800073fc:	00113c23          	sd	ra,24(sp)
    80007400:	02010413          	addi	s0,sp,32
    80007404:	01053483          	ld	s1,16(a0)
    80007408:	ffffe097          	auipc	ra,0xffffe
    8000740c:	750080e7          	jalr	1872(ra) # 80005b58 <mycpu>
    80007410:	01813083          	ld	ra,24(sp)
    80007414:	01013403          	ld	s0,16(sp)
    80007418:	40a48533          	sub	a0,s1,a0
    8000741c:	00153513          	seqz	a0,a0
    80007420:	00813483          	ld	s1,8(sp)
    80007424:	02010113          	addi	sp,sp,32
    80007428:	00008067          	ret

000000008000742c <push_off>:
    8000742c:	fe010113          	addi	sp,sp,-32
    80007430:	00813823          	sd	s0,16(sp)
    80007434:	00113c23          	sd	ra,24(sp)
    80007438:	00913423          	sd	s1,8(sp)
    8000743c:	02010413          	addi	s0,sp,32
    80007440:	100024f3          	csrr	s1,sstatus
    80007444:	100027f3          	csrr	a5,sstatus
    80007448:	ffd7f793          	andi	a5,a5,-3
    8000744c:	10079073          	csrw	sstatus,a5
    80007450:	ffffe097          	auipc	ra,0xffffe
    80007454:	708080e7          	jalr	1800(ra) # 80005b58 <mycpu>
    80007458:	07852783          	lw	a5,120(a0)
    8000745c:	02078663          	beqz	a5,80007488 <push_off+0x5c>
    80007460:	ffffe097          	auipc	ra,0xffffe
    80007464:	6f8080e7          	jalr	1784(ra) # 80005b58 <mycpu>
    80007468:	07852783          	lw	a5,120(a0)
    8000746c:	01813083          	ld	ra,24(sp)
    80007470:	01013403          	ld	s0,16(sp)
    80007474:	0017879b          	addiw	a5,a5,1
    80007478:	06f52c23          	sw	a5,120(a0)
    8000747c:	00813483          	ld	s1,8(sp)
    80007480:	02010113          	addi	sp,sp,32
    80007484:	00008067          	ret
    80007488:	0014d493          	srli	s1,s1,0x1
    8000748c:	ffffe097          	auipc	ra,0xffffe
    80007490:	6cc080e7          	jalr	1740(ra) # 80005b58 <mycpu>
    80007494:	0014f493          	andi	s1,s1,1
    80007498:	06952e23          	sw	s1,124(a0)
    8000749c:	fc5ff06f          	j	80007460 <push_off+0x34>

00000000800074a0 <pop_off>:
    800074a0:	ff010113          	addi	sp,sp,-16
    800074a4:	00813023          	sd	s0,0(sp)
    800074a8:	00113423          	sd	ra,8(sp)
    800074ac:	01010413          	addi	s0,sp,16
    800074b0:	ffffe097          	auipc	ra,0xffffe
    800074b4:	6a8080e7          	jalr	1704(ra) # 80005b58 <mycpu>
    800074b8:	100027f3          	csrr	a5,sstatus
    800074bc:	0027f793          	andi	a5,a5,2
    800074c0:	04079663          	bnez	a5,8000750c <pop_off+0x6c>
    800074c4:	07852783          	lw	a5,120(a0)
    800074c8:	02f05a63          	blez	a5,800074fc <pop_off+0x5c>
    800074cc:	fff7871b          	addiw	a4,a5,-1
    800074d0:	06e52c23          	sw	a4,120(a0)
    800074d4:	00071c63          	bnez	a4,800074ec <pop_off+0x4c>
    800074d8:	07c52783          	lw	a5,124(a0)
    800074dc:	00078863          	beqz	a5,800074ec <pop_off+0x4c>
    800074e0:	100027f3          	csrr	a5,sstatus
    800074e4:	0027e793          	ori	a5,a5,2
    800074e8:	10079073          	csrw	sstatus,a5
    800074ec:	00813083          	ld	ra,8(sp)
    800074f0:	00013403          	ld	s0,0(sp)
    800074f4:	01010113          	addi	sp,sp,16
    800074f8:	00008067          	ret
    800074fc:	00001517          	auipc	a0,0x1
    80007500:	25450513          	addi	a0,a0,596 # 80008750 <digits+0x48>
    80007504:	fffff097          	auipc	ra,0xfffff
    80007508:	018080e7          	jalr	24(ra) # 8000651c <panic>
    8000750c:	00001517          	auipc	a0,0x1
    80007510:	22c50513          	addi	a0,a0,556 # 80008738 <digits+0x30>
    80007514:	fffff097          	auipc	ra,0xfffff
    80007518:	008080e7          	jalr	8(ra) # 8000651c <panic>

000000008000751c <push_on>:
    8000751c:	fe010113          	addi	sp,sp,-32
    80007520:	00813823          	sd	s0,16(sp)
    80007524:	00113c23          	sd	ra,24(sp)
    80007528:	00913423          	sd	s1,8(sp)
    8000752c:	02010413          	addi	s0,sp,32
    80007530:	100024f3          	csrr	s1,sstatus
    80007534:	100027f3          	csrr	a5,sstatus
    80007538:	0027e793          	ori	a5,a5,2
    8000753c:	10079073          	csrw	sstatus,a5
    80007540:	ffffe097          	auipc	ra,0xffffe
    80007544:	618080e7          	jalr	1560(ra) # 80005b58 <mycpu>
    80007548:	07852783          	lw	a5,120(a0)
    8000754c:	02078663          	beqz	a5,80007578 <push_on+0x5c>
    80007550:	ffffe097          	auipc	ra,0xffffe
    80007554:	608080e7          	jalr	1544(ra) # 80005b58 <mycpu>
    80007558:	07852783          	lw	a5,120(a0)
    8000755c:	01813083          	ld	ra,24(sp)
    80007560:	01013403          	ld	s0,16(sp)
    80007564:	0017879b          	addiw	a5,a5,1
    80007568:	06f52c23          	sw	a5,120(a0)
    8000756c:	00813483          	ld	s1,8(sp)
    80007570:	02010113          	addi	sp,sp,32
    80007574:	00008067          	ret
    80007578:	0014d493          	srli	s1,s1,0x1
    8000757c:	ffffe097          	auipc	ra,0xffffe
    80007580:	5dc080e7          	jalr	1500(ra) # 80005b58 <mycpu>
    80007584:	0014f493          	andi	s1,s1,1
    80007588:	06952e23          	sw	s1,124(a0)
    8000758c:	fc5ff06f          	j	80007550 <push_on+0x34>

0000000080007590 <pop_on>:
    80007590:	ff010113          	addi	sp,sp,-16
    80007594:	00813023          	sd	s0,0(sp)
    80007598:	00113423          	sd	ra,8(sp)
    8000759c:	01010413          	addi	s0,sp,16
    800075a0:	ffffe097          	auipc	ra,0xffffe
    800075a4:	5b8080e7          	jalr	1464(ra) # 80005b58 <mycpu>
    800075a8:	100027f3          	csrr	a5,sstatus
    800075ac:	0027f793          	andi	a5,a5,2
    800075b0:	04078463          	beqz	a5,800075f8 <pop_on+0x68>
    800075b4:	07852783          	lw	a5,120(a0)
    800075b8:	02f05863          	blez	a5,800075e8 <pop_on+0x58>
    800075bc:	fff7879b          	addiw	a5,a5,-1
    800075c0:	06f52c23          	sw	a5,120(a0)
    800075c4:	07853783          	ld	a5,120(a0)
    800075c8:	00079863          	bnez	a5,800075d8 <pop_on+0x48>
    800075cc:	100027f3          	csrr	a5,sstatus
    800075d0:	ffd7f793          	andi	a5,a5,-3
    800075d4:	10079073          	csrw	sstatus,a5
    800075d8:	00813083          	ld	ra,8(sp)
    800075dc:	00013403          	ld	s0,0(sp)
    800075e0:	01010113          	addi	sp,sp,16
    800075e4:	00008067          	ret
    800075e8:	00001517          	auipc	a0,0x1
    800075ec:	19050513          	addi	a0,a0,400 # 80008778 <digits+0x70>
    800075f0:	fffff097          	auipc	ra,0xfffff
    800075f4:	f2c080e7          	jalr	-212(ra) # 8000651c <panic>
    800075f8:	00001517          	auipc	a0,0x1
    800075fc:	16050513          	addi	a0,a0,352 # 80008758 <digits+0x50>
    80007600:	fffff097          	auipc	ra,0xfffff
    80007604:	f1c080e7          	jalr	-228(ra) # 8000651c <panic>

0000000080007608 <__memset>:
    80007608:	ff010113          	addi	sp,sp,-16
    8000760c:	00813423          	sd	s0,8(sp)
    80007610:	01010413          	addi	s0,sp,16
    80007614:	1a060e63          	beqz	a2,800077d0 <__memset+0x1c8>
    80007618:	40a007b3          	neg	a5,a0
    8000761c:	0077f793          	andi	a5,a5,7
    80007620:	00778693          	addi	a3,a5,7
    80007624:	00b00813          	li	a6,11
    80007628:	0ff5f593          	andi	a1,a1,255
    8000762c:	fff6071b          	addiw	a4,a2,-1
    80007630:	1b06e663          	bltu	a3,a6,800077dc <__memset+0x1d4>
    80007634:	1cd76463          	bltu	a4,a3,800077fc <__memset+0x1f4>
    80007638:	1a078e63          	beqz	a5,800077f4 <__memset+0x1ec>
    8000763c:	00b50023          	sb	a1,0(a0)
    80007640:	00100713          	li	a4,1
    80007644:	1ae78463          	beq	a5,a4,800077ec <__memset+0x1e4>
    80007648:	00b500a3          	sb	a1,1(a0)
    8000764c:	00200713          	li	a4,2
    80007650:	1ae78a63          	beq	a5,a4,80007804 <__memset+0x1fc>
    80007654:	00b50123          	sb	a1,2(a0)
    80007658:	00300713          	li	a4,3
    8000765c:	18e78463          	beq	a5,a4,800077e4 <__memset+0x1dc>
    80007660:	00b501a3          	sb	a1,3(a0)
    80007664:	00400713          	li	a4,4
    80007668:	1ae78263          	beq	a5,a4,8000780c <__memset+0x204>
    8000766c:	00b50223          	sb	a1,4(a0)
    80007670:	00500713          	li	a4,5
    80007674:	1ae78063          	beq	a5,a4,80007814 <__memset+0x20c>
    80007678:	00b502a3          	sb	a1,5(a0)
    8000767c:	00700713          	li	a4,7
    80007680:	18e79e63          	bne	a5,a4,8000781c <__memset+0x214>
    80007684:	00b50323          	sb	a1,6(a0)
    80007688:	00700e93          	li	t4,7
    8000768c:	00859713          	slli	a4,a1,0x8
    80007690:	00e5e733          	or	a4,a1,a4
    80007694:	01059e13          	slli	t3,a1,0x10
    80007698:	01c76e33          	or	t3,a4,t3
    8000769c:	01859313          	slli	t1,a1,0x18
    800076a0:	006e6333          	or	t1,t3,t1
    800076a4:	02059893          	slli	a7,a1,0x20
    800076a8:	40f60e3b          	subw	t3,a2,a5
    800076ac:	011368b3          	or	a7,t1,a7
    800076b0:	02859813          	slli	a6,a1,0x28
    800076b4:	0108e833          	or	a6,a7,a6
    800076b8:	03059693          	slli	a3,a1,0x30
    800076bc:	003e589b          	srliw	a7,t3,0x3
    800076c0:	00d866b3          	or	a3,a6,a3
    800076c4:	03859713          	slli	a4,a1,0x38
    800076c8:	00389813          	slli	a6,a7,0x3
    800076cc:	00f507b3          	add	a5,a0,a5
    800076d0:	00e6e733          	or	a4,a3,a4
    800076d4:	000e089b          	sext.w	a7,t3
    800076d8:	00f806b3          	add	a3,a6,a5
    800076dc:	00e7b023          	sd	a4,0(a5)
    800076e0:	00878793          	addi	a5,a5,8
    800076e4:	fed79ce3          	bne	a5,a3,800076dc <__memset+0xd4>
    800076e8:	ff8e7793          	andi	a5,t3,-8
    800076ec:	0007871b          	sext.w	a4,a5
    800076f0:	01d787bb          	addw	a5,a5,t4
    800076f4:	0ce88e63          	beq	a7,a4,800077d0 <__memset+0x1c8>
    800076f8:	00f50733          	add	a4,a0,a5
    800076fc:	00b70023          	sb	a1,0(a4)
    80007700:	0017871b          	addiw	a4,a5,1
    80007704:	0cc77663          	bgeu	a4,a2,800077d0 <__memset+0x1c8>
    80007708:	00e50733          	add	a4,a0,a4
    8000770c:	00b70023          	sb	a1,0(a4)
    80007710:	0027871b          	addiw	a4,a5,2
    80007714:	0ac77e63          	bgeu	a4,a2,800077d0 <__memset+0x1c8>
    80007718:	00e50733          	add	a4,a0,a4
    8000771c:	00b70023          	sb	a1,0(a4)
    80007720:	0037871b          	addiw	a4,a5,3
    80007724:	0ac77663          	bgeu	a4,a2,800077d0 <__memset+0x1c8>
    80007728:	00e50733          	add	a4,a0,a4
    8000772c:	00b70023          	sb	a1,0(a4)
    80007730:	0047871b          	addiw	a4,a5,4
    80007734:	08c77e63          	bgeu	a4,a2,800077d0 <__memset+0x1c8>
    80007738:	00e50733          	add	a4,a0,a4
    8000773c:	00b70023          	sb	a1,0(a4)
    80007740:	0057871b          	addiw	a4,a5,5
    80007744:	08c77663          	bgeu	a4,a2,800077d0 <__memset+0x1c8>
    80007748:	00e50733          	add	a4,a0,a4
    8000774c:	00b70023          	sb	a1,0(a4)
    80007750:	0067871b          	addiw	a4,a5,6
    80007754:	06c77e63          	bgeu	a4,a2,800077d0 <__memset+0x1c8>
    80007758:	00e50733          	add	a4,a0,a4
    8000775c:	00b70023          	sb	a1,0(a4)
    80007760:	0077871b          	addiw	a4,a5,7
    80007764:	06c77663          	bgeu	a4,a2,800077d0 <__memset+0x1c8>
    80007768:	00e50733          	add	a4,a0,a4
    8000776c:	00b70023          	sb	a1,0(a4)
    80007770:	0087871b          	addiw	a4,a5,8
    80007774:	04c77e63          	bgeu	a4,a2,800077d0 <__memset+0x1c8>
    80007778:	00e50733          	add	a4,a0,a4
    8000777c:	00b70023          	sb	a1,0(a4)
    80007780:	0097871b          	addiw	a4,a5,9
    80007784:	04c77663          	bgeu	a4,a2,800077d0 <__memset+0x1c8>
    80007788:	00e50733          	add	a4,a0,a4
    8000778c:	00b70023          	sb	a1,0(a4)
    80007790:	00a7871b          	addiw	a4,a5,10
    80007794:	02c77e63          	bgeu	a4,a2,800077d0 <__memset+0x1c8>
    80007798:	00e50733          	add	a4,a0,a4
    8000779c:	00b70023          	sb	a1,0(a4)
    800077a0:	00b7871b          	addiw	a4,a5,11
    800077a4:	02c77663          	bgeu	a4,a2,800077d0 <__memset+0x1c8>
    800077a8:	00e50733          	add	a4,a0,a4
    800077ac:	00b70023          	sb	a1,0(a4)
    800077b0:	00c7871b          	addiw	a4,a5,12
    800077b4:	00c77e63          	bgeu	a4,a2,800077d0 <__memset+0x1c8>
    800077b8:	00e50733          	add	a4,a0,a4
    800077bc:	00b70023          	sb	a1,0(a4)
    800077c0:	00d7879b          	addiw	a5,a5,13
    800077c4:	00c7f663          	bgeu	a5,a2,800077d0 <__memset+0x1c8>
    800077c8:	00f507b3          	add	a5,a0,a5
    800077cc:	00b78023          	sb	a1,0(a5)
    800077d0:	00813403          	ld	s0,8(sp)
    800077d4:	01010113          	addi	sp,sp,16
    800077d8:	00008067          	ret
    800077dc:	00b00693          	li	a3,11
    800077e0:	e55ff06f          	j	80007634 <__memset+0x2c>
    800077e4:	00300e93          	li	t4,3
    800077e8:	ea5ff06f          	j	8000768c <__memset+0x84>
    800077ec:	00100e93          	li	t4,1
    800077f0:	e9dff06f          	j	8000768c <__memset+0x84>
    800077f4:	00000e93          	li	t4,0
    800077f8:	e95ff06f          	j	8000768c <__memset+0x84>
    800077fc:	00000793          	li	a5,0
    80007800:	ef9ff06f          	j	800076f8 <__memset+0xf0>
    80007804:	00200e93          	li	t4,2
    80007808:	e85ff06f          	j	8000768c <__memset+0x84>
    8000780c:	00400e93          	li	t4,4
    80007810:	e7dff06f          	j	8000768c <__memset+0x84>
    80007814:	00500e93          	li	t4,5
    80007818:	e75ff06f          	j	8000768c <__memset+0x84>
    8000781c:	00600e93          	li	t4,6
    80007820:	e6dff06f          	j	8000768c <__memset+0x84>

0000000080007824 <__memmove>:
    80007824:	ff010113          	addi	sp,sp,-16
    80007828:	00813423          	sd	s0,8(sp)
    8000782c:	01010413          	addi	s0,sp,16
    80007830:	0e060863          	beqz	a2,80007920 <__memmove+0xfc>
    80007834:	fff6069b          	addiw	a3,a2,-1
    80007838:	0006881b          	sext.w	a6,a3
    8000783c:	0ea5e863          	bltu	a1,a0,8000792c <__memmove+0x108>
    80007840:	00758713          	addi	a4,a1,7
    80007844:	00a5e7b3          	or	a5,a1,a0
    80007848:	40a70733          	sub	a4,a4,a0
    8000784c:	0077f793          	andi	a5,a5,7
    80007850:	00f73713          	sltiu	a4,a4,15
    80007854:	00174713          	xori	a4,a4,1
    80007858:	0017b793          	seqz	a5,a5
    8000785c:	00e7f7b3          	and	a5,a5,a4
    80007860:	10078863          	beqz	a5,80007970 <__memmove+0x14c>
    80007864:	00900793          	li	a5,9
    80007868:	1107f463          	bgeu	a5,a6,80007970 <__memmove+0x14c>
    8000786c:	0036581b          	srliw	a6,a2,0x3
    80007870:	fff8081b          	addiw	a6,a6,-1
    80007874:	02081813          	slli	a6,a6,0x20
    80007878:	01d85893          	srli	a7,a6,0x1d
    8000787c:	00858813          	addi	a6,a1,8
    80007880:	00058793          	mv	a5,a1
    80007884:	00050713          	mv	a4,a0
    80007888:	01088833          	add	a6,a7,a6
    8000788c:	0007b883          	ld	a7,0(a5)
    80007890:	00878793          	addi	a5,a5,8
    80007894:	00870713          	addi	a4,a4,8
    80007898:	ff173c23          	sd	a7,-8(a4)
    8000789c:	ff0798e3          	bne	a5,a6,8000788c <__memmove+0x68>
    800078a0:	ff867713          	andi	a4,a2,-8
    800078a4:	02071793          	slli	a5,a4,0x20
    800078a8:	0207d793          	srli	a5,a5,0x20
    800078ac:	00f585b3          	add	a1,a1,a5
    800078b0:	40e686bb          	subw	a3,a3,a4
    800078b4:	00f507b3          	add	a5,a0,a5
    800078b8:	06e60463          	beq	a2,a4,80007920 <__memmove+0xfc>
    800078bc:	0005c703          	lbu	a4,0(a1)
    800078c0:	00e78023          	sb	a4,0(a5)
    800078c4:	04068e63          	beqz	a3,80007920 <__memmove+0xfc>
    800078c8:	0015c603          	lbu	a2,1(a1)
    800078cc:	00100713          	li	a4,1
    800078d0:	00c780a3          	sb	a2,1(a5)
    800078d4:	04e68663          	beq	a3,a4,80007920 <__memmove+0xfc>
    800078d8:	0025c603          	lbu	a2,2(a1)
    800078dc:	00200713          	li	a4,2
    800078e0:	00c78123          	sb	a2,2(a5)
    800078e4:	02e68e63          	beq	a3,a4,80007920 <__memmove+0xfc>
    800078e8:	0035c603          	lbu	a2,3(a1)
    800078ec:	00300713          	li	a4,3
    800078f0:	00c781a3          	sb	a2,3(a5)
    800078f4:	02e68663          	beq	a3,a4,80007920 <__memmove+0xfc>
    800078f8:	0045c603          	lbu	a2,4(a1)
    800078fc:	00400713          	li	a4,4
    80007900:	00c78223          	sb	a2,4(a5)
    80007904:	00e68e63          	beq	a3,a4,80007920 <__memmove+0xfc>
    80007908:	0055c603          	lbu	a2,5(a1)
    8000790c:	00500713          	li	a4,5
    80007910:	00c782a3          	sb	a2,5(a5)
    80007914:	00e68663          	beq	a3,a4,80007920 <__memmove+0xfc>
    80007918:	0065c703          	lbu	a4,6(a1)
    8000791c:	00e78323          	sb	a4,6(a5)
    80007920:	00813403          	ld	s0,8(sp)
    80007924:	01010113          	addi	sp,sp,16
    80007928:	00008067          	ret
    8000792c:	02061713          	slli	a4,a2,0x20
    80007930:	02075713          	srli	a4,a4,0x20
    80007934:	00e587b3          	add	a5,a1,a4
    80007938:	f0f574e3          	bgeu	a0,a5,80007840 <__memmove+0x1c>
    8000793c:	02069613          	slli	a2,a3,0x20
    80007940:	02065613          	srli	a2,a2,0x20
    80007944:	fff64613          	not	a2,a2
    80007948:	00e50733          	add	a4,a0,a4
    8000794c:	00c78633          	add	a2,a5,a2
    80007950:	fff7c683          	lbu	a3,-1(a5)
    80007954:	fff78793          	addi	a5,a5,-1
    80007958:	fff70713          	addi	a4,a4,-1
    8000795c:	00d70023          	sb	a3,0(a4)
    80007960:	fec798e3          	bne	a5,a2,80007950 <__memmove+0x12c>
    80007964:	00813403          	ld	s0,8(sp)
    80007968:	01010113          	addi	sp,sp,16
    8000796c:	00008067          	ret
    80007970:	02069713          	slli	a4,a3,0x20
    80007974:	02075713          	srli	a4,a4,0x20
    80007978:	00170713          	addi	a4,a4,1
    8000797c:	00e50733          	add	a4,a0,a4
    80007980:	00050793          	mv	a5,a0
    80007984:	0005c683          	lbu	a3,0(a1)
    80007988:	00178793          	addi	a5,a5,1
    8000798c:	00158593          	addi	a1,a1,1
    80007990:	fed78fa3          	sb	a3,-1(a5)
    80007994:	fee798e3          	bne	a5,a4,80007984 <__memmove+0x160>
    80007998:	f89ff06f          	j	80007920 <__memmove+0xfc>

000000008000799c <__mem_free>:
    8000799c:	ff010113          	addi	sp,sp,-16
    800079a0:	00813423          	sd	s0,8(sp)
    800079a4:	01010413          	addi	s0,sp,16
    800079a8:	00003597          	auipc	a1,0x3
    800079ac:	96058593          	addi	a1,a1,-1696 # 8000a308 <freep>
    800079b0:	0005b783          	ld	a5,0(a1)
    800079b4:	ff050693          	addi	a3,a0,-16
    800079b8:	0007b703          	ld	a4,0(a5)
    800079bc:	00d7fc63          	bgeu	a5,a3,800079d4 <__mem_free+0x38>
    800079c0:	00e6ee63          	bltu	a3,a4,800079dc <__mem_free+0x40>
    800079c4:	00e7fc63          	bgeu	a5,a4,800079dc <__mem_free+0x40>
    800079c8:	00070793          	mv	a5,a4
    800079cc:	0007b703          	ld	a4,0(a5)
    800079d0:	fed7e8e3          	bltu	a5,a3,800079c0 <__mem_free+0x24>
    800079d4:	fee7eae3          	bltu	a5,a4,800079c8 <__mem_free+0x2c>
    800079d8:	fee6f8e3          	bgeu	a3,a4,800079c8 <__mem_free+0x2c>
    800079dc:	ff852803          	lw	a6,-8(a0)
    800079e0:	02081613          	slli	a2,a6,0x20
    800079e4:	01c65613          	srli	a2,a2,0x1c
    800079e8:	00c68633          	add	a2,a3,a2
    800079ec:	02c70a63          	beq	a4,a2,80007a20 <__mem_free+0x84>
    800079f0:	fee53823          	sd	a4,-16(a0)
    800079f4:	0087a503          	lw	a0,8(a5)
    800079f8:	02051613          	slli	a2,a0,0x20
    800079fc:	01c65613          	srli	a2,a2,0x1c
    80007a00:	00c78633          	add	a2,a5,a2
    80007a04:	04c68263          	beq	a3,a2,80007a48 <__mem_free+0xac>
    80007a08:	00813403          	ld	s0,8(sp)
    80007a0c:	00d7b023          	sd	a3,0(a5)
    80007a10:	00f5b023          	sd	a5,0(a1)
    80007a14:	00000513          	li	a0,0
    80007a18:	01010113          	addi	sp,sp,16
    80007a1c:	00008067          	ret
    80007a20:	00872603          	lw	a2,8(a4)
    80007a24:	00073703          	ld	a4,0(a4)
    80007a28:	0106083b          	addw	a6,a2,a6
    80007a2c:	ff052c23          	sw	a6,-8(a0)
    80007a30:	fee53823          	sd	a4,-16(a0)
    80007a34:	0087a503          	lw	a0,8(a5)
    80007a38:	02051613          	slli	a2,a0,0x20
    80007a3c:	01c65613          	srli	a2,a2,0x1c
    80007a40:	00c78633          	add	a2,a5,a2
    80007a44:	fcc692e3          	bne	a3,a2,80007a08 <__mem_free+0x6c>
    80007a48:	00813403          	ld	s0,8(sp)
    80007a4c:	0105053b          	addw	a0,a0,a6
    80007a50:	00a7a423          	sw	a0,8(a5)
    80007a54:	00e7b023          	sd	a4,0(a5)
    80007a58:	00f5b023          	sd	a5,0(a1)
    80007a5c:	00000513          	li	a0,0
    80007a60:	01010113          	addi	sp,sp,16
    80007a64:	00008067          	ret

0000000080007a68 <__mem_alloc>:
    80007a68:	fc010113          	addi	sp,sp,-64
    80007a6c:	02813823          	sd	s0,48(sp)
    80007a70:	02913423          	sd	s1,40(sp)
    80007a74:	03213023          	sd	s2,32(sp)
    80007a78:	01513423          	sd	s5,8(sp)
    80007a7c:	02113c23          	sd	ra,56(sp)
    80007a80:	01313c23          	sd	s3,24(sp)
    80007a84:	01413823          	sd	s4,16(sp)
    80007a88:	01613023          	sd	s6,0(sp)
    80007a8c:	04010413          	addi	s0,sp,64
    80007a90:	00003a97          	auipc	s5,0x3
    80007a94:	878a8a93          	addi	s5,s5,-1928 # 8000a308 <freep>
    80007a98:	00f50913          	addi	s2,a0,15
    80007a9c:	000ab683          	ld	a3,0(s5)
    80007aa0:	00495913          	srli	s2,s2,0x4
    80007aa4:	0019049b          	addiw	s1,s2,1
    80007aa8:	00048913          	mv	s2,s1
    80007aac:	0c068c63          	beqz	a3,80007b84 <__mem_alloc+0x11c>
    80007ab0:	0006b503          	ld	a0,0(a3)
    80007ab4:	00852703          	lw	a4,8(a0)
    80007ab8:	10977063          	bgeu	a4,s1,80007bb8 <__mem_alloc+0x150>
    80007abc:	000017b7          	lui	a5,0x1
    80007ac0:	0009099b          	sext.w	s3,s2
    80007ac4:	0af4e863          	bltu	s1,a5,80007b74 <__mem_alloc+0x10c>
    80007ac8:	02099a13          	slli	s4,s3,0x20
    80007acc:	01ca5a13          	srli	s4,s4,0x1c
    80007ad0:	fff00b13          	li	s6,-1
    80007ad4:	0100006f          	j	80007ae4 <__mem_alloc+0x7c>
    80007ad8:	0007b503          	ld	a0,0(a5) # 1000 <_entry-0x7ffff000>
    80007adc:	00852703          	lw	a4,8(a0)
    80007ae0:	04977463          	bgeu	a4,s1,80007b28 <__mem_alloc+0xc0>
    80007ae4:	00050793          	mv	a5,a0
    80007ae8:	fea698e3          	bne	a3,a0,80007ad8 <__mem_alloc+0x70>
    80007aec:	000a0513          	mv	a0,s4
    80007af0:	00000097          	auipc	ra,0x0
    80007af4:	1f0080e7          	jalr	496(ra) # 80007ce0 <kvmincrease>
    80007af8:	00050793          	mv	a5,a0
    80007afc:	01050513          	addi	a0,a0,16
    80007b00:	07678e63          	beq	a5,s6,80007b7c <__mem_alloc+0x114>
    80007b04:	0137a423          	sw	s3,8(a5)
    80007b08:	00000097          	auipc	ra,0x0
    80007b0c:	e94080e7          	jalr	-364(ra) # 8000799c <__mem_free>
    80007b10:	000ab783          	ld	a5,0(s5)
    80007b14:	06078463          	beqz	a5,80007b7c <__mem_alloc+0x114>
    80007b18:	0007b503          	ld	a0,0(a5)
    80007b1c:	00078693          	mv	a3,a5
    80007b20:	00852703          	lw	a4,8(a0)
    80007b24:	fc9760e3          	bltu	a4,s1,80007ae4 <__mem_alloc+0x7c>
    80007b28:	08e48263          	beq	s1,a4,80007bac <__mem_alloc+0x144>
    80007b2c:	4127073b          	subw	a4,a4,s2
    80007b30:	02071693          	slli	a3,a4,0x20
    80007b34:	01c6d693          	srli	a3,a3,0x1c
    80007b38:	00e52423          	sw	a4,8(a0)
    80007b3c:	00d50533          	add	a0,a0,a3
    80007b40:	01252423          	sw	s2,8(a0)
    80007b44:	00fab023          	sd	a5,0(s5)
    80007b48:	01050513          	addi	a0,a0,16
    80007b4c:	03813083          	ld	ra,56(sp)
    80007b50:	03013403          	ld	s0,48(sp)
    80007b54:	02813483          	ld	s1,40(sp)
    80007b58:	02013903          	ld	s2,32(sp)
    80007b5c:	01813983          	ld	s3,24(sp)
    80007b60:	01013a03          	ld	s4,16(sp)
    80007b64:	00813a83          	ld	s5,8(sp)
    80007b68:	00013b03          	ld	s6,0(sp)
    80007b6c:	04010113          	addi	sp,sp,64
    80007b70:	00008067          	ret
    80007b74:	000019b7          	lui	s3,0x1
    80007b78:	f51ff06f          	j	80007ac8 <__mem_alloc+0x60>
    80007b7c:	00000513          	li	a0,0
    80007b80:	fcdff06f          	j	80007b4c <__mem_alloc+0xe4>
    80007b84:	00004797          	auipc	a5,0x4
    80007b88:	a5c78793          	addi	a5,a5,-1444 # 8000b5e0 <base>
    80007b8c:	00078513          	mv	a0,a5
    80007b90:	00fab023          	sd	a5,0(s5)
    80007b94:	00f7b023          	sd	a5,0(a5)
    80007b98:	00000713          	li	a4,0
    80007b9c:	00004797          	auipc	a5,0x4
    80007ba0:	a407a623          	sw	zero,-1460(a5) # 8000b5e8 <base+0x8>
    80007ba4:	00050693          	mv	a3,a0
    80007ba8:	f11ff06f          	j	80007ab8 <__mem_alloc+0x50>
    80007bac:	00053703          	ld	a4,0(a0)
    80007bb0:	00e7b023          	sd	a4,0(a5)
    80007bb4:	f91ff06f          	j	80007b44 <__mem_alloc+0xdc>
    80007bb8:	00068793          	mv	a5,a3
    80007bbc:	f6dff06f          	j	80007b28 <__mem_alloc+0xc0>

0000000080007bc0 <__putc>:
    80007bc0:	fe010113          	addi	sp,sp,-32
    80007bc4:	00813823          	sd	s0,16(sp)
    80007bc8:	00113c23          	sd	ra,24(sp)
    80007bcc:	02010413          	addi	s0,sp,32
    80007bd0:	00050793          	mv	a5,a0
    80007bd4:	fef40593          	addi	a1,s0,-17
    80007bd8:	00100613          	li	a2,1
    80007bdc:	00000513          	li	a0,0
    80007be0:	fef407a3          	sb	a5,-17(s0)
    80007be4:	fffff097          	auipc	ra,0xfffff
    80007be8:	918080e7          	jalr	-1768(ra) # 800064fc <console_write>
    80007bec:	01813083          	ld	ra,24(sp)
    80007bf0:	01013403          	ld	s0,16(sp)
    80007bf4:	02010113          	addi	sp,sp,32
    80007bf8:	00008067          	ret

0000000080007bfc <__getc>:
    80007bfc:	fe010113          	addi	sp,sp,-32
    80007c00:	00813823          	sd	s0,16(sp)
    80007c04:	00113c23          	sd	ra,24(sp)
    80007c08:	02010413          	addi	s0,sp,32
    80007c0c:	fe840593          	addi	a1,s0,-24
    80007c10:	00100613          	li	a2,1
    80007c14:	00000513          	li	a0,0
    80007c18:	fffff097          	auipc	ra,0xfffff
    80007c1c:	8c4080e7          	jalr	-1852(ra) # 800064dc <console_read>
    80007c20:	fe844503          	lbu	a0,-24(s0)
    80007c24:	01813083          	ld	ra,24(sp)
    80007c28:	01013403          	ld	s0,16(sp)
    80007c2c:	02010113          	addi	sp,sp,32
    80007c30:	00008067          	ret

0000000080007c34 <console_handler>:
    80007c34:	fe010113          	addi	sp,sp,-32
    80007c38:	00813823          	sd	s0,16(sp)
    80007c3c:	00113c23          	sd	ra,24(sp)
    80007c40:	00913423          	sd	s1,8(sp)
    80007c44:	02010413          	addi	s0,sp,32
    80007c48:	14202773          	csrr	a4,scause
    80007c4c:	100027f3          	csrr	a5,sstatus
    80007c50:	0027f793          	andi	a5,a5,2
    80007c54:	06079e63          	bnez	a5,80007cd0 <console_handler+0x9c>
    80007c58:	00074c63          	bltz	a4,80007c70 <console_handler+0x3c>
    80007c5c:	01813083          	ld	ra,24(sp)
    80007c60:	01013403          	ld	s0,16(sp)
    80007c64:	00813483          	ld	s1,8(sp)
    80007c68:	02010113          	addi	sp,sp,32
    80007c6c:	00008067          	ret
    80007c70:	0ff77713          	andi	a4,a4,255
    80007c74:	00900793          	li	a5,9
    80007c78:	fef712e3          	bne	a4,a5,80007c5c <console_handler+0x28>
    80007c7c:	ffffe097          	auipc	ra,0xffffe
    80007c80:	4b8080e7          	jalr	1208(ra) # 80006134 <plic_claim>
    80007c84:	00a00793          	li	a5,10
    80007c88:	00050493          	mv	s1,a0
    80007c8c:	02f50c63          	beq	a0,a5,80007cc4 <console_handler+0x90>
    80007c90:	fc0506e3          	beqz	a0,80007c5c <console_handler+0x28>
    80007c94:	00050593          	mv	a1,a0
    80007c98:	00001517          	auipc	a0,0x1
    80007c9c:	9e850513          	addi	a0,a0,-1560 # 80008680 <CONSOLE_STATUS+0x670>
    80007ca0:	fffff097          	auipc	ra,0xfffff
    80007ca4:	8d8080e7          	jalr	-1832(ra) # 80006578 <__printf>
    80007ca8:	01013403          	ld	s0,16(sp)
    80007cac:	01813083          	ld	ra,24(sp)
    80007cb0:	00048513          	mv	a0,s1
    80007cb4:	00813483          	ld	s1,8(sp)
    80007cb8:	02010113          	addi	sp,sp,32
    80007cbc:	ffffe317          	auipc	t1,0xffffe
    80007cc0:	4b030067          	jr	1200(t1) # 8000616c <plic_complete>
    80007cc4:	fffff097          	auipc	ra,0xfffff
    80007cc8:	1bc080e7          	jalr	444(ra) # 80006e80 <uartintr>
    80007ccc:	fddff06f          	j	80007ca8 <console_handler+0x74>
    80007cd0:	00001517          	auipc	a0,0x1
    80007cd4:	ab050513          	addi	a0,a0,-1360 # 80008780 <digits+0x78>
    80007cd8:	fffff097          	auipc	ra,0xfffff
    80007cdc:	844080e7          	jalr	-1980(ra) # 8000651c <panic>

0000000080007ce0 <kvmincrease>:
    80007ce0:	fe010113          	addi	sp,sp,-32
    80007ce4:	01213023          	sd	s2,0(sp)
    80007ce8:	00001937          	lui	s2,0x1
    80007cec:	fff90913          	addi	s2,s2,-1 # fff <_entry-0x7ffff001>
    80007cf0:	00813823          	sd	s0,16(sp)
    80007cf4:	00113c23          	sd	ra,24(sp)
    80007cf8:	00913423          	sd	s1,8(sp)
    80007cfc:	02010413          	addi	s0,sp,32
    80007d00:	01250933          	add	s2,a0,s2
    80007d04:	00c95913          	srli	s2,s2,0xc
    80007d08:	02090863          	beqz	s2,80007d38 <kvmincrease+0x58>
    80007d0c:	00000493          	li	s1,0
    80007d10:	00148493          	addi	s1,s1,1
    80007d14:	fffff097          	auipc	ra,0xfffff
    80007d18:	4bc080e7          	jalr	1212(ra) # 800071d0 <kalloc>
    80007d1c:	fe991ae3          	bne	s2,s1,80007d10 <kvmincrease+0x30>
    80007d20:	01813083          	ld	ra,24(sp)
    80007d24:	01013403          	ld	s0,16(sp)
    80007d28:	00813483          	ld	s1,8(sp)
    80007d2c:	00013903          	ld	s2,0(sp)
    80007d30:	02010113          	addi	sp,sp,32
    80007d34:	00008067          	ret
    80007d38:	01813083          	ld	ra,24(sp)
    80007d3c:	01013403          	ld	s0,16(sp)
    80007d40:	00813483          	ld	s1,8(sp)
    80007d44:	00013903          	ld	s2,0(sp)
    80007d48:	00000513          	li	a0,0
    80007d4c:	02010113          	addi	sp,sp,32
    80007d50:	00008067          	ret
	...
