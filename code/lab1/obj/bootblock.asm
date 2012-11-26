
obj/bootblock.o:     file format elf32-i386


Disassembly of section .text:

00007c00 <start>:

# start address should be 0:7c00, in real mode, the beginning address of the running bootloader
.globl start
start:
.code16                                             # Assemble for 16-bit mode
    cli                                             # Disable interrupts
    7c00:	fa                   	cli    
    cld                                             # String operations increment
    7c01:	fc                   	cld    

    # Set up the important data segment registers (DS, ES, SS).
    xorw %ax, %ax                                   # Segment number zero
    7c02:	31 c0                	xor    %eax,%eax
    movw %ax, %ds                                   # -> Data Segment
    7c04:	8e d8                	mov    %eax,%ds
    movw %ax, %es                                   # -> Extra Segment
    7c06:	8e c0                	mov    %eax,%es
    movw %ax, %ss                                   # -> Stack Segment
    7c08:	8e d0                	mov    %eax,%ss

00007c0a <seta20.1>:
    # Enable A20:
    #  For backwards compatibility with the earliest PCs, physical
    #  address line 20 is tied low, so that addresses higher than
    #  1MB wrap around to zero by default. This code undoes this.
seta20.1:
    inb $0x64, %al                                  # Wait for not busy(8042 input buffer empty).
    7c0a:	e4 64                	in     $0x64,%al
    testb $0x2, %al
    7c0c:	a8 02                	test   $0x2,%al
    jnz seta20.1
    7c0e:	75 fa                	jne    7c0a <seta20.1>

    movb $0xd1, %al                                 # 0xd1 -> port 0x64
    7c10:	b0 d1                	mov    $0xd1,%al
    outb %al, $0x64                                 # 0xd1 means: write data to 8042's P2 port
    7c12:	e6 64                	out    %al,$0x64

00007c14 <seta20.2>:

seta20.2:
    inb $0x64, %al                                  # Wait for not busy(8042 input buffer empty).
    7c14:	e4 64                	in     $0x64,%al
    testb $0x2, %al
    7c16:	a8 02                	test   $0x2,%al
    jnz seta20.2
    7c18:	75 fa                	jne    7c14 <seta20.2>

    movb $0xdf, %al                                 # 0xdf -> port 0x60
    7c1a:	b0 df                	mov    $0xdf,%al
    outb %al, $0x60                                 # 0xdf = 11011111, means set P2's A20 bit(the 1 bit) to 1
    7c1c:	e6 60                	out    %al,$0x60

    movb $0xdf, %al                                 # 0xdf -> port 0x60, do it again!
    7c1e:	b0 df                	mov    $0xdf,%al
    outb %al, $0x60                                 # 0xdf = 11011111, means set P2's A20 bit(the 1 bit) to 1
    7c20:	e6 60                	out    %al,$0x60

    # Switch from real to protected mode, using a bootstrap GDT
    # and segment translation that makes virtual addresses
    # identical to physical addresses, so that the
    # effective memory map does not change during the switch.
    lgdt gdtdesc
    7c22:	0f 01 16             	lgdtl  (%esi)
    7c25:	70 7c                	jo     7ca3 <readseg+0x2b>
    movl %cr0, %eax
    7c27:	0f 20 c0             	mov    %cr0,%eax
    orl $CR0_PE_ON, %eax
    7c2a:	66 83 c8 01          	or     $0x1,%ax
    movl %eax, %cr0
    7c2e:	0f 22 c0             	mov    %eax,%cr0

    # Jump to next instruction, but in 32-bit code segment.
    # Switches processor into 32-bit mode.
    ljmp $PROT_MODE_CSEG, $protcseg
    7c31:	ea 36 7c 08 00 66 b8 	ljmp   $0xb866,$0x87c36

00007c36 <protcseg>:

.code32                                             # Assemble for 32-bit mode
protcseg:
    # Set up the protected-mode data segment registers
    movw $PROT_MODE_DSEG, %ax                       # Our data segment selector
    7c36:	66 b8 10 00          	mov    $0x10,%ax
    movw %ax, %ds                                   # -> DS: Data Segment
    7c3a:	8e d8                	mov    %eax,%ds
    movw %ax, %es                                   # -> ES: Extra Segment
    7c3c:	8e c0                	mov    %eax,%es
    movw %ax, %fs                                   # -> FS
    7c3e:	8e e0                	mov    %eax,%fs
    movw %ax, %gs                                   # -> GS
    7c40:	8e e8                	mov    %eax,%gs
    movw %ax, %ss                                   # -> SS: Stack Segment
    7c42:	8e d0                	mov    %eax,%ss

    # Set up the stack pointer and call into C. The stack region is from 0--start(0x7c00)
    movl $0x0, %ebp
    7c44:	bd 00 00 00 00       	mov    $0x0,%ebp
    movl $start, %esp
    7c49:	bc 00 7c 00 00       	mov    $0x7c00,%esp
    call bootmain
    7c4e:	e8 be 00 00 00       	call   7d11 <bootmain>

00007c53 <spin>:

    # If bootmain returns (it shouldn't), loop.
spin:
    jmp spin
    7c53:	eb fe                	jmp    7c53 <spin>
    7c55:	8d 76 00             	lea    0x0(%esi),%esi

00007c58 <gdt>:
	...
    7c60:	ff                   	(bad)  
    7c61:	ff 00                	incl   (%eax)
    7c63:	00 00                	add    %al,(%eax)
    7c65:	9a cf 00 ff ff 00 00 	lcall  $0x0,$0xffff00cf
    7c6c:	00 92 cf 00 17 00    	add    %dl,0x1700cf(%edx)

00007c70 <gdtdesc>:
    7c70:	17                   	pop    %ss
    7c71:	00 58 7c             	add    %bl,0x7c(%eax)
    7c74:	00 00                	add    %al,(%eax)
    7c76:	90                   	nop
    7c77:	90                   	nop

00007c78 <readseg>:
/* *
 * readseg - read @count bytes at @offset from kernel into virtual address @va,
 * might copy more than asked.
 * */
static void
readseg(uintptr_t va, uint32_t count, uint32_t offset) {
    7c78:	55                   	push   %ebp
    uintptr_t end_va = va + count;
    7c79:	01 c2                	add    %eax,%edx
/* *
 * readseg - read @count bytes at @offset from kernel into virtual address @va,
 * might copy more than asked.
 * */
static void
readseg(uintptr_t va, uint32_t count, uint32_t offset) {
    7c7b:	89 e5                	mov    %esp,%ebp
    7c7d:	57                   	push   %edi
    7c7e:	56                   	push   %esi
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
    7c7f:	be f7 01 00 00       	mov    $0x1f7,%esi
    7c84:	53                   	push   %ebx
    7c85:	83 ec 08             	sub    $0x8,%esp
    uintptr_t end_va = va + count;
    7c88:	89 55 ec             	mov    %edx,-0x14(%ebp)

    // round down to sector boundary
    va -= offset % SECTSIZE;
    7c8b:	89 ca                	mov    %ecx,%edx
    7c8d:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
    7c93:	29 d0                	sub    %edx,%eax

    // translate from bytes to sectors; kernel starts at sector 1
    uint32_t secno = (offset / SECTSIZE) + 1;
    7c95:	c1 e9 09             	shr    $0x9,%ecx
static void
readseg(uintptr_t va, uint32_t count, uint32_t offset) {
    uintptr_t end_va = va + count;

    // round down to sector boundary
    va -= offset % SECTSIZE;
    7c98:	89 45 f0             	mov    %eax,-0x10(%ebp)

    // translate from bytes to sectors; kernel starts at sector 1
    uint32_t secno = (offset / SECTSIZE) + 1;
    7c9b:	8d 59 01             	lea    0x1(%ecx),%ebx

    // If this is too slow, we could read lots of sectors at a time.
    // We'd write more to memory than asked, but it doesn't matter --
    // we load in increasing order.
    for (; va < end_va; va += SECTSIZE, secno ++) {
    7c9e:	eb 62                	jmp    7d02 <readseg+0x8a>
    7ca0:	89 f2                	mov    %esi,%edx
    7ca2:	ec                   	in     (%dx),%al
#define ELFHDR          ((struct elfhdr *)0x10000)      // scratch space

/* waitdisk - wait for disk ready */
static void
waitdisk(void) {
    while ((inb(0x1F7) & 0xC0) != 0x40)
    7ca3:	25 c0 00 00 00       	and    $0xc0,%eax
    7ca8:	83 f8 40             	cmp    $0x40,%eax
    7cab:	75 f3                	jne    7ca0 <readseg+0x28>
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
    7cad:	ba f2 01 00 00       	mov    $0x1f2,%edx
    7cb2:	b0 01                	mov    $0x1,%al
    7cb4:	ee                   	out    %al,(%dx)
    7cb5:	b2 f3                	mov    $0xf3,%dl
    7cb7:	88 d8                	mov    %bl,%al
    7cb9:	ee                   	out    %al,(%dx)
    // wait for disk to be ready
    waitdisk();

    outb(0x1F2, 1);                         // count = 1
    outb(0x1F3, secno & 0xFF);
    outb(0x1F4, (secno >> 8) & 0xFF);
    7cba:	89 d8                	mov    %ebx,%eax
    7cbc:	b2 f4                	mov    $0xf4,%dl
    7cbe:	c1 e8 08             	shr    $0x8,%eax
    7cc1:	ee                   	out    %al,(%dx)
    outb(0x1F5, (secno >> 16) & 0xFF);
    7cc2:	89 d8                	mov    %ebx,%eax
    7cc4:	b2 f5                	mov    $0xf5,%dl
    7cc6:	c1 e8 10             	shr    $0x10,%eax
    7cc9:	ee                   	out    %al,(%dx)
    outb(0x1F6, ((secno >> 24) & 0xF) | 0xE0);
    7cca:	89 d8                	mov    %ebx,%eax
    7ccc:	b2 f6                	mov    $0xf6,%dl
    7cce:	c1 e8 18             	shr    $0x18,%eax
    7cd1:	83 e0 0f             	and    $0xf,%eax
    7cd4:	83 c8 e0             	or     $0xffffffe0,%eax
    7cd7:	ee                   	out    %al,(%dx)
    7cd8:	b0 20                	mov    $0x20,%al
    7cda:	89 f2                	mov    %esi,%edx
    7cdc:	ee                   	out    %al,(%dx)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
    7cdd:	89 f2                	mov    %esi,%edx
    7cdf:	ec                   	in     (%dx),%al
#define ELFHDR          ((struct elfhdr *)0x10000)      // scratch space

/* waitdisk - wait for disk ready */
static void
waitdisk(void) {
    while ((inb(0x1F7) & 0xC0) != 0x40)
    7ce0:	25 c0 00 00 00       	and    $0xc0,%eax
    7ce5:	83 f8 40             	cmp    $0x40,%eax
    7ce8:	75 f3                	jne    7cdd <readseg+0x65>
    return data;
}

static inline void
insl(uint32_t port, void *addr, int cnt) {
    asm volatile (
    7cea:	8b 7d f0             	mov    -0x10(%ebp),%edi
    7ced:	b9 80 00 00 00       	mov    $0x80,%ecx
    7cf2:	ba f0 01 00 00       	mov    $0x1f0,%edx
    7cf7:	fc                   	cld    
    7cf8:	f2 6d                	repnz insl (%dx),%es:(%edi)
    uint32_t secno = (offset / SECTSIZE) + 1;

    // If this is too slow, we could read lots of sectors at a time.
    // We'd write more to memory than asked, but it doesn't matter --
    // we load in increasing order.
    for (; va < end_va; va += SECTSIZE, secno ++) {
    7cfa:	81 45 f0 00 02 00 00 	addl   $0x200,-0x10(%ebp)
    7d01:	43                   	inc    %ebx
    7d02:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7d05:	39 45 f0             	cmp    %eax,-0x10(%ebp)
    7d08:	72 96                	jb     7ca0 <readseg+0x28>
        readsect((void *)va, secno);
    }
}
    7d0a:	58                   	pop    %eax
    7d0b:	5a                   	pop    %edx
    7d0c:	5b                   	pop    %ebx
    7d0d:	5e                   	pop    %esi
    7d0e:	5f                   	pop    %edi
    7d0f:	5d                   	pop    %ebp
    7d10:	c3                   	ret    

00007d11 <bootmain>:

/* bootmain - the entry of bootloader */
void
bootmain(void) {
    7d11:	55                   	push   %ebp
    // read the 1st page off disk
    readseg((uintptr_t)ELFHDR, SECTSIZE * 8, 0);
    7d12:	31 c9                	xor    %ecx,%ecx
    }
}

/* bootmain - the entry of bootloader */
void
bootmain(void) {
    7d14:	89 e5                	mov    %esp,%ebp
    // read the 1st page off disk
    readseg((uintptr_t)ELFHDR, SECTSIZE * 8, 0);
    7d16:	ba 00 10 00 00       	mov    $0x1000,%edx
    }
}

/* bootmain - the entry of bootloader */
void
bootmain(void) {
    7d1b:	56                   	push   %esi
    // read the 1st page off disk
    readseg((uintptr_t)ELFHDR, SECTSIZE * 8, 0);
    7d1c:	b8 00 00 01 00       	mov    $0x10000,%eax
    }
}

/* bootmain - the entry of bootloader */
void
bootmain(void) {
    7d21:	53                   	push   %ebx
    // read the 1st page off disk
    readseg((uintptr_t)ELFHDR, SECTSIZE * 8, 0);
    7d22:	e8 51 ff ff ff       	call   7c78 <readseg>

    // is this a valid ELF?
    if (ELFHDR->e_magic != ELF_MAGIC) {
    7d27:	81 3d 00 00 01 00 7f 	cmpl   $0x464c457f,0x10000
    7d2e:	45 4c 46 
    7d31:	75 40                	jne    7d73 <bootmain+0x62>
    }

    struct proghdr *ph, *eph;

    // load each program segment (ignores ph flags)
    ph = (struct proghdr *)((uintptr_t)ELFHDR + ELFHDR->e_phoff);
    7d33:	8b 1d 1c 00 01 00    	mov    0x1001c,%ebx
    eph = ph + ELFHDR->e_phnum;
    7d39:	0f b7 35 2c 00 01 00 	movzwl 0x1002c,%esi
    }

    struct proghdr *ph, *eph;

    // load each program segment (ignores ph flags)
    ph = (struct proghdr *)((uintptr_t)ELFHDR + ELFHDR->e_phoff);
    7d40:	81 c3 00 00 01 00    	add    $0x10000,%ebx
    eph = ph + ELFHDR->e_phnum;
    7d46:	c1 e6 05             	shl    $0x5,%esi
    7d49:	01 de                	add    %ebx,%esi
    for (; ph < eph; ph ++) {
    7d4b:	eb 16                	jmp    7d63 <bootmain+0x52>
        readseg(ph->p_va & 0xFFFFFF, ph->p_memsz, ph->p_offset);
    7d4d:	8b 43 08             	mov    0x8(%ebx),%eax
    7d50:	8b 4b 04             	mov    0x4(%ebx),%ecx
    7d53:	8b 53 14             	mov    0x14(%ebx),%edx
    struct proghdr *ph, *eph;

    // load each program segment (ignores ph flags)
    ph = (struct proghdr *)((uintptr_t)ELFHDR + ELFHDR->e_phoff);
    eph = ph + ELFHDR->e_phnum;
    for (; ph < eph; ph ++) {
    7d56:	83 c3 20             	add    $0x20,%ebx
        readseg(ph->p_va & 0xFFFFFF, ph->p_memsz, ph->p_offset);
    7d59:	25 ff ff ff 00       	and    $0xffffff,%eax
    7d5e:	e8 15 ff ff ff       	call   7c78 <readseg>
    struct proghdr *ph, *eph;

    // load each program segment (ignores ph flags)
    ph = (struct proghdr *)((uintptr_t)ELFHDR + ELFHDR->e_phoff);
    eph = ph + ELFHDR->e_phnum;
    for (; ph < eph; ph ++) {
    7d63:	39 f3                	cmp    %esi,%ebx
    7d65:	72 e6                	jb     7d4d <bootmain+0x3c>
        readseg(ph->p_va & 0xFFFFFF, ph->p_memsz, ph->p_offset);
    }

    // call the entry point from the ELF header
    // note: does not return
    ((void (*)(void))(ELFHDR->e_entry & 0xFFFFFF))();
    7d67:	a1 18 00 01 00       	mov    0x10018,%eax
    7d6c:	25 ff ff ff 00       	and    $0xffffff,%eax
    7d71:	ff d0                	call   *%eax
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
}

static inline void
outw(uint16_t port, uint16_t data) {
    asm volatile ("outw %0, %1" :: "a" (data), "d" (port));
    7d73:	ba 00 8a ff ff       	mov    $0xffff8a00,%edx
    7d78:	89 d0                	mov    %edx,%eax
    7d7a:	66 ef                	out    %ax,(%dx)
    7d7c:	b8 00 8e ff ff       	mov    $0xffff8e00,%eax
    7d81:	66 ef                	out    %ax,(%dx)
    7d83:	eb fe                	jmp    7d83 <bootmain+0x72>
