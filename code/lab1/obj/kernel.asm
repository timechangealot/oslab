
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 20 fd 10 00       	mov    $0x10fd20,%edx
  10000b:	b8 18 ea 10 00       	mov    $0x10ea18,%eax
  100010:	89 d1                	mov    %edx,%ecx
  100012:	29 c1                	sub    %eax,%ecx
  100014:	89 c8                	mov    %ecx,%eax
  100016:	89 44 24 08          	mov    %eax,0x8(%esp)
  10001a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100021:	00 
  100022:	c7 04 24 18 ea 10 00 	movl   $0x10ea18,(%esp)
  100029:	e8 81 34 00 00       	call   1034af <memset>

    cons_init();                // init the console
  10002e:	e8 9b 15 00 00       	call   1015ce <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100033:	c7 45 f4 80 36 10 00 	movl   $0x103680,-0xc(%ebp)
    cprintf("%s\n\n", message);
  10003a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100041:	c7 04 24 9c 36 10 00 	movl   $0x10369c,(%esp)
  100048:	e8 d6 02 00 00       	call   100323 <cprintf>

    print_kerninfo();
  10004d:	e8 e0 07 00 00       	call   100832 <print_kerninfo>

    grade_backtrace();
  100052:	e8 8b 00 00 00       	call   1000e2 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100057:	e8 45 2a 00 00       	call   102aa1 <pmm_init>

    pic_init();                 // init interrupt controller
  10005c:	e8 b8 16 00 00       	call   101719 <pic_init>
    idt_init();                 // init interrupt descriptor table
  100061:	e8 0a 18 00 00       	call   101870 <idt_init>

    clock_init();               // init clock interrupt
  100066:	e8 b5 0c 00 00       	call   100d20 <clock_init>
    intr_enable();              // enable irq interrupt
  10006b:	e8 10 16 00 00       	call   101680 <intr_enable>

    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    lab1_switch_test();
  100070:	e8 66 01 00 00       	call   1001db <lab1_switch_test>

    /* do nothing */
    while (1);
  100075:	eb fe                	jmp    100075 <kern_init+0x75>

00100077 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100077:	55                   	push   %ebp
  100078:	89 e5                	mov    %esp,%ebp
  10007a:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  10007d:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  100084:	00 
  100085:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10008c:	00 
  10008d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100094:	e8 b1 0b 00 00       	call   100c4a <mon_backtrace>
}
  100099:	c9                   	leave  
  10009a:	c3                   	ret    

0010009b <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  10009b:	55                   	push   %ebp
  10009c:	89 e5                	mov    %esp,%ebp
  10009e:	53                   	push   %ebx
  10009f:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000a2:	8d 5d 0c             	lea    0xc(%ebp),%ebx
  1000a5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1000a8:	8d 55 08             	lea    0x8(%ebp),%edx
  1000ab:	8b 45 08             	mov    0x8(%ebp),%eax
  1000ae:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  1000b2:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  1000b6:	89 54 24 04          	mov    %edx,0x4(%esp)
  1000ba:	89 04 24             	mov    %eax,(%esp)
  1000bd:	e8 b5 ff ff ff       	call   100077 <grade_backtrace2>
}
  1000c2:	83 c4 14             	add    $0x14,%esp
  1000c5:	5b                   	pop    %ebx
  1000c6:	5d                   	pop    %ebp
  1000c7:	c3                   	ret    

001000c8 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c8:	55                   	push   %ebp
  1000c9:	89 e5                	mov    %esp,%ebp
  1000cb:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000ce:	8b 45 10             	mov    0x10(%ebp),%eax
  1000d1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000d5:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d8:	89 04 24             	mov    %eax,(%esp)
  1000db:	e8 bb ff ff ff       	call   10009b <grade_backtrace1>
}
  1000e0:	c9                   	leave  
  1000e1:	c3                   	ret    

001000e2 <grade_backtrace>:

void
grade_backtrace(void) {
  1000e2:	55                   	push   %ebp
  1000e3:	89 e5                	mov    %esp,%ebp
  1000e5:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e8:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000ed:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000f4:	ff 
  1000f5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000f9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100100:	e8 c3 ff ff ff       	call   1000c8 <grade_backtrace0>
}
  100105:	c9                   	leave  
  100106:	c3                   	ret    

00100107 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100107:	55                   	push   %ebp
  100108:	89 e5                	mov    %esp,%ebp
  10010a:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  10010d:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100110:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100113:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100116:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100119:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10011d:	0f b7 c0             	movzwl %ax,%eax
  100120:	89 c2                	mov    %eax,%edx
  100122:	83 e2 03             	and    $0x3,%edx
  100125:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  10012a:	89 54 24 08          	mov    %edx,0x8(%esp)
  10012e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100132:	c7 04 24 a1 36 10 00 	movl   $0x1036a1,(%esp)
  100139:	e8 e5 01 00 00       	call   100323 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  10013e:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100142:	0f b7 d0             	movzwl %ax,%edx
  100145:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  10014a:	89 54 24 08          	mov    %edx,0x8(%esp)
  10014e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100152:	c7 04 24 af 36 10 00 	movl   $0x1036af,(%esp)
  100159:	e8 c5 01 00 00       	call   100323 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  10015e:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100162:	0f b7 d0             	movzwl %ax,%edx
  100165:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  10016a:	89 54 24 08          	mov    %edx,0x8(%esp)
  10016e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100172:	c7 04 24 bd 36 10 00 	movl   $0x1036bd,(%esp)
  100179:	e8 a5 01 00 00       	call   100323 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  10017e:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100182:	0f b7 d0             	movzwl %ax,%edx
  100185:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  10018a:	89 54 24 08          	mov    %edx,0x8(%esp)
  10018e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100192:	c7 04 24 cb 36 10 00 	movl   $0x1036cb,(%esp)
  100199:	e8 85 01 00 00       	call   100323 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  10019e:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1001a2:	0f b7 d0             	movzwl %ax,%edx
  1001a5:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001aa:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001ae:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001b2:	c7 04 24 d9 36 10 00 	movl   $0x1036d9,(%esp)
  1001b9:	e8 65 01 00 00       	call   100323 <cprintf>
    round ++;
  1001be:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001c3:	83 c0 01             	add    $0x1,%eax
  1001c6:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001cb:	c9                   	leave  
  1001cc:	c3                   	ret    

001001cd <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001cd:	55                   	push   %ebp
  1001ce:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
    //T_SWITCH_TOU                120
    asm volatile ("int $0x78");
  1001d0:	cd 78                	int    $0x78
}
  1001d2:	5d                   	pop    %ebp
  1001d3:	c3                   	ret    

001001d4 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001d4:	55                   	push   %ebp
  1001d5:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
    asm volatile ("int $0x79");
  1001d7:	cd 79                	int    $0x79
}
  1001d9:	5d                   	pop    %ebp
  1001da:	c3                   	ret    

001001db <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001db:	55                   	push   %ebp
  1001dc:	89 e5                	mov    %esp,%ebp
  1001de:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001e1:	e8 21 ff ff ff       	call   100107 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001e6:	c7 04 24 e8 36 10 00 	movl   $0x1036e8,(%esp)
  1001ed:	e8 31 01 00 00       	call   100323 <cprintf>
    lab1_switch_to_user();
  1001f2:	e8 d6 ff ff ff       	call   1001cd <lab1_switch_to_user>
    lab1_print_cur_status();
  1001f7:	e8 0b ff ff ff       	call   100107 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001fc:	c7 04 24 08 37 10 00 	movl   $0x103708,(%esp)
  100203:	e8 1b 01 00 00       	call   100323 <cprintf>
    lab1_switch_to_kernel();
  100208:	e8 c7 ff ff ff       	call   1001d4 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  10020d:	e8 f5 fe ff ff       	call   100107 <lab1_print_cur_status>
}
  100212:	c9                   	leave  
  100213:	c3                   	ret    

00100214 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100214:	55                   	push   %ebp
  100215:	89 e5                	mov    %esp,%ebp
  100217:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  10021a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  10021e:	74 13                	je     100233 <readline+0x1f>
        cprintf("%s", prompt);
  100220:	8b 45 08             	mov    0x8(%ebp),%eax
  100223:	89 44 24 04          	mov    %eax,0x4(%esp)
  100227:	c7 04 24 27 37 10 00 	movl   $0x103727,(%esp)
  10022e:	e8 f0 00 00 00       	call   100323 <cprintf>
    }
    int i = 0, c;
  100233:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10023a:	eb 01                	jmp    10023d <readline+0x29>
        else if (c == '\n' || c == '\r') {
            cputchar(c);
            buf[i] = '\0';
            return buf;
        }
    }
  10023c:	90                   	nop
    if (prompt != NULL) {
        cprintf("%s", prompt);
    }
    int i = 0, c;
    while (1) {
        c = getchar();
  10023d:	e8 6e 01 00 00       	call   1003b0 <getchar>
  100242:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100245:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100249:	79 07                	jns    100252 <readline+0x3e>
            return NULL;
  10024b:	b8 00 00 00 00       	mov    $0x0,%eax
  100250:	eb 79                	jmp    1002cb <readline+0xb7>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100252:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100256:	7e 28                	jle    100280 <readline+0x6c>
  100258:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  10025f:	7f 1f                	jg     100280 <readline+0x6c>
            cputchar(c);
  100261:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100264:	89 04 24             	mov    %eax,(%esp)
  100267:	e8 df 00 00 00       	call   10034b <cputchar>
            buf[i ++] = c;
  10026c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10026f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100272:	81 c2 40 ea 10 00    	add    $0x10ea40,%edx
  100278:	88 02                	mov    %al,(%edx)
  10027a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10027e:	eb 46                	jmp    1002c6 <readline+0xb2>
        }
        else if (c == '\b' && i > 0) {
  100280:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  100284:	75 17                	jne    10029d <readline+0x89>
  100286:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10028a:	7e 11                	jle    10029d <readline+0x89>
            cputchar(c);
  10028c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10028f:	89 04 24             	mov    %eax,(%esp)
  100292:	e8 b4 00 00 00       	call   10034b <cputchar>
            i --;
  100297:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  10029b:	eb 29                	jmp    1002c6 <readline+0xb2>
        }
        else if (c == '\n' || c == '\r') {
  10029d:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  1002a1:	74 06                	je     1002a9 <readline+0x95>
  1002a3:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  1002a7:	75 93                	jne    10023c <readline+0x28>
            cputchar(c);
  1002a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1002ac:	89 04 24             	mov    %eax,(%esp)
  1002af:	e8 97 00 00 00       	call   10034b <cputchar>
            buf[i] = '\0';
  1002b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1002b7:	05 40 ea 10 00       	add    $0x10ea40,%eax
  1002bc:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1002bf:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1002c4:	eb 05                	jmp    1002cb <readline+0xb7>
        }
    }
  1002c6:	e9 71 ff ff ff       	jmp    10023c <readline+0x28>
}
  1002cb:	c9                   	leave  
  1002cc:	c3                   	ret    
  1002cd:	00 00                	add    %al,(%eax)
	...

001002d0 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1002d0:	55                   	push   %ebp
  1002d1:	89 e5                	mov    %esp,%ebp
  1002d3:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002d6:	8b 45 08             	mov    0x8(%ebp),%eax
  1002d9:	89 04 24             	mov    %eax,(%esp)
  1002dc:	e8 19 13 00 00       	call   1015fa <cons_putc>
    (*cnt) ++;
  1002e1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002e4:	8b 00                	mov    (%eax),%eax
  1002e6:	8d 50 01             	lea    0x1(%eax),%edx
  1002e9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002ec:	89 10                	mov    %edx,(%eax)
}
  1002ee:	c9                   	leave  
  1002ef:	c3                   	ret    

001002f0 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002f0:	55                   	push   %ebp
  1002f1:	89 e5                	mov    %esp,%ebp
  1002f3:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002f6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  1002fd:	8b 45 0c             	mov    0xc(%ebp),%eax
  100300:	89 44 24 0c          	mov    %eax,0xc(%esp)
  100304:	8b 45 08             	mov    0x8(%ebp),%eax
  100307:	89 44 24 08          	mov    %eax,0x8(%esp)
  10030b:	8d 45 f4             	lea    -0xc(%ebp),%eax
  10030e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100312:	c7 04 24 d0 02 10 00 	movl   $0x1002d0,(%esp)
  100319:	e8 94 29 00 00       	call   102cb2 <vprintfmt>
    return cnt;
  10031e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100321:	c9                   	leave  
  100322:	c3                   	ret    

00100323 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100323:	55                   	push   %ebp
  100324:	89 e5                	mov    %esp,%ebp
  100326:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100329:	8d 55 0c             	lea    0xc(%ebp),%edx
  10032c:	8d 45 f0             	lea    -0x10(%ebp),%eax
  10032f:	89 10                	mov    %edx,(%eax)
    cnt = vcprintf(fmt, ap);
  100331:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100334:	89 44 24 04          	mov    %eax,0x4(%esp)
  100338:	8b 45 08             	mov    0x8(%ebp),%eax
  10033b:	89 04 24             	mov    %eax,(%esp)
  10033e:	e8 ad ff ff ff       	call   1002f0 <vcprintf>
  100343:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  100346:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100349:	c9                   	leave  
  10034a:	c3                   	ret    

0010034b <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  10034b:	55                   	push   %ebp
  10034c:	89 e5                	mov    %esp,%ebp
  10034e:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100351:	8b 45 08             	mov    0x8(%ebp),%eax
  100354:	89 04 24             	mov    %eax,(%esp)
  100357:	e8 9e 12 00 00       	call   1015fa <cons_putc>
}
  10035c:	c9                   	leave  
  10035d:	c3                   	ret    

0010035e <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  10035e:	55                   	push   %ebp
  10035f:	89 e5                	mov    %esp,%ebp
  100361:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100364:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  10036b:	eb 13                	jmp    100380 <cputs+0x22>
        cputch(c, &cnt);
  10036d:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  100371:	8d 55 f0             	lea    -0x10(%ebp),%edx
  100374:	89 54 24 04          	mov    %edx,0x4(%esp)
  100378:	89 04 24             	mov    %eax,(%esp)
  10037b:	e8 50 ff ff ff       	call   1002d0 <cputch>
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  100380:	8b 45 08             	mov    0x8(%ebp),%eax
  100383:	0f b6 00             	movzbl (%eax),%eax
  100386:	88 45 f7             	mov    %al,-0x9(%ebp)
  100389:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  10038d:	0f 95 c0             	setne  %al
  100390:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  100394:	84 c0                	test   %al,%al
  100396:	75 d5                	jne    10036d <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  100398:	8d 45 f0             	lea    -0x10(%ebp),%eax
  10039b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10039f:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  1003a6:	e8 25 ff ff ff       	call   1002d0 <cputch>
    return cnt;
  1003ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1003ae:	c9                   	leave  
  1003af:	c3                   	ret    

001003b0 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1003b0:	55                   	push   %ebp
  1003b1:	89 e5                	mov    %esp,%ebp
  1003b3:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1003b6:	e8 68 12 00 00       	call   101623 <cons_getc>
  1003bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003be:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003c2:	74 f2                	je     1003b6 <getchar+0x6>
        /* do nothing */;
    return c;
  1003c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1003c7:	c9                   	leave  
  1003c8:	c3                   	ret    
  1003c9:	00 00                	add    %al,(%eax)
	...

001003cc <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1003cc:	55                   	push   %ebp
  1003cd:	89 e5                	mov    %esp,%ebp
  1003cf:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1003d2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003d5:	8b 00                	mov    (%eax),%eax
  1003d7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1003da:	8b 45 10             	mov    0x10(%ebp),%eax
  1003dd:	8b 00                	mov    (%eax),%eax
  1003df:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1003e2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1003e9:	e9 c6 00 00 00       	jmp    1004b4 <stab_binsearch+0xe8>
        int true_m = (l + r) / 2, m = true_m;
  1003ee:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1003f1:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1003f4:	01 d0                	add    %edx,%eax
  1003f6:	89 c2                	mov    %eax,%edx
  1003f8:	c1 ea 1f             	shr    $0x1f,%edx
  1003fb:	01 d0                	add    %edx,%eax
  1003fd:	d1 f8                	sar    %eax
  1003ff:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100402:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100405:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  100408:	eb 04                	jmp    10040e <stab_binsearch+0x42>
            m --;
  10040a:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  10040e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100411:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100414:	7c 1b                	jl     100431 <stab_binsearch+0x65>
  100416:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100419:	89 d0                	mov    %edx,%eax
  10041b:	01 c0                	add    %eax,%eax
  10041d:	01 d0                	add    %edx,%eax
  10041f:	c1 e0 02             	shl    $0x2,%eax
  100422:	03 45 08             	add    0x8(%ebp),%eax
  100425:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100429:	0f b6 c0             	movzbl %al,%eax
  10042c:	3b 45 14             	cmp    0x14(%ebp),%eax
  10042f:	75 d9                	jne    10040a <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  100431:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100434:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100437:	7d 0b                	jge    100444 <stab_binsearch+0x78>
            l = true_m + 1;
  100439:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10043c:	83 c0 01             	add    $0x1,%eax
  10043f:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100442:	eb 70                	jmp    1004b4 <stab_binsearch+0xe8>
        }

        // actual binary search
        any_matches = 1;
  100444:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  10044b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10044e:	89 d0                	mov    %edx,%eax
  100450:	01 c0                	add    %eax,%eax
  100452:	01 d0                	add    %edx,%eax
  100454:	c1 e0 02             	shl    $0x2,%eax
  100457:	03 45 08             	add    0x8(%ebp),%eax
  10045a:	8b 40 08             	mov    0x8(%eax),%eax
  10045d:	3b 45 18             	cmp    0x18(%ebp),%eax
  100460:	73 13                	jae    100475 <stab_binsearch+0xa9>
            *region_left = m;
  100462:	8b 45 0c             	mov    0xc(%ebp),%eax
  100465:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100468:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  10046a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10046d:	83 c0 01             	add    $0x1,%eax
  100470:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100473:	eb 3f                	jmp    1004b4 <stab_binsearch+0xe8>
        } else if (stabs[m].n_value > addr) {
  100475:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100478:	89 d0                	mov    %edx,%eax
  10047a:	01 c0                	add    %eax,%eax
  10047c:	01 d0                	add    %edx,%eax
  10047e:	c1 e0 02             	shl    $0x2,%eax
  100481:	03 45 08             	add    0x8(%ebp),%eax
  100484:	8b 40 08             	mov    0x8(%eax),%eax
  100487:	3b 45 18             	cmp    0x18(%ebp),%eax
  10048a:	76 16                	jbe    1004a2 <stab_binsearch+0xd6>
            *region_right = m - 1;
  10048c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10048f:	8d 50 ff             	lea    -0x1(%eax),%edx
  100492:	8b 45 10             	mov    0x10(%ebp),%eax
  100495:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  100497:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10049a:	83 e8 01             	sub    $0x1,%eax
  10049d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1004a0:	eb 12                	jmp    1004b4 <stab_binsearch+0xe8>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  1004a2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004a5:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004a8:	89 10                	mov    %edx,(%eax)
            l = m;
  1004aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004ad:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1004b0:	83 45 18 01          	addl   $0x1,0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  1004b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1004b7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1004ba:	0f 8e 2e ff ff ff    	jle    1003ee <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  1004c0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004c4:	75 0f                	jne    1004d5 <stab_binsearch+0x109>
        *region_right = *region_left - 1;
  1004c6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004c9:	8b 00                	mov    (%eax),%eax
  1004cb:	8d 50 ff             	lea    -0x1(%eax),%edx
  1004ce:	8b 45 10             	mov    0x10(%ebp),%eax
  1004d1:	89 10                	mov    %edx,(%eax)
  1004d3:	eb 3b                	jmp    100510 <stab_binsearch+0x144>
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  1004d5:	8b 45 10             	mov    0x10(%ebp),%eax
  1004d8:	8b 00                	mov    (%eax),%eax
  1004da:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1004dd:	eb 04                	jmp    1004e3 <stab_binsearch+0x117>
  1004df:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  1004e3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004e6:	8b 00                	mov    (%eax),%eax
  1004e8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004eb:	7d 1b                	jge    100508 <stab_binsearch+0x13c>
  1004ed:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004f0:	89 d0                	mov    %edx,%eax
  1004f2:	01 c0                	add    %eax,%eax
  1004f4:	01 d0                	add    %edx,%eax
  1004f6:	c1 e0 02             	shl    $0x2,%eax
  1004f9:	03 45 08             	add    0x8(%ebp),%eax
  1004fc:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100500:	0f b6 c0             	movzbl %al,%eax
  100503:	3b 45 14             	cmp    0x14(%ebp),%eax
  100506:	75 d7                	jne    1004df <stab_binsearch+0x113>
            /* do nothing */;
        *region_left = l;
  100508:	8b 45 0c             	mov    0xc(%ebp),%eax
  10050b:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10050e:	89 10                	mov    %edx,(%eax)
    }
}
  100510:	c9                   	leave  
  100511:	c3                   	ret    

00100512 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  100512:	55                   	push   %ebp
  100513:	89 e5                	mov    %esp,%ebp
  100515:	53                   	push   %ebx
  100516:	83 ec 54             	sub    $0x54,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  100519:	8b 45 0c             	mov    0xc(%ebp),%eax
  10051c:	c7 00 2c 37 10 00    	movl   $0x10372c,(%eax)
    info->eip_line = 0;
  100522:	8b 45 0c             	mov    0xc(%ebp),%eax
  100525:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  10052c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10052f:	c7 40 08 2c 37 10 00 	movl   $0x10372c,0x8(%eax)
    info->eip_fn_namelen = 9;
  100536:	8b 45 0c             	mov    0xc(%ebp),%eax
  100539:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  100540:	8b 45 0c             	mov    0xc(%ebp),%eax
  100543:	8b 55 08             	mov    0x8(%ebp),%edx
  100546:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100549:	8b 45 0c             	mov    0xc(%ebp),%eax
  10054c:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100553:	c7 45 f4 8c 3f 10 00 	movl   $0x103f8c,-0xc(%ebp)
    stab_end = __STAB_END__;
  10055a:	c7 45 f0 b8 b8 10 00 	movl   $0x10b8b8,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100561:	c7 45 ec b9 b8 10 00 	movl   $0x10b8b9,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100568:	c7 45 e8 7e d8 10 00 	movl   $0x10d87e,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10056f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100572:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100575:	76 0d                	jbe    100584 <debuginfo_eip+0x72>
  100577:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10057a:	83 e8 01             	sub    $0x1,%eax
  10057d:	0f b6 00             	movzbl (%eax),%eax
  100580:	84 c0                	test   %al,%al
  100582:	74 0a                	je     10058e <debuginfo_eip+0x7c>
        return -1;
  100584:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100589:	e9 9e 02 00 00       	jmp    10082c <debuginfo_eip+0x31a>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  10058e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100595:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100598:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10059b:	89 d1                	mov    %edx,%ecx
  10059d:	29 c1                	sub    %eax,%ecx
  10059f:	89 c8                	mov    %ecx,%eax
  1005a1:	c1 f8 02             	sar    $0x2,%eax
  1005a4:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  1005aa:	83 e8 01             	sub    $0x1,%eax
  1005ad:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1005b0:	8b 45 08             	mov    0x8(%ebp),%eax
  1005b3:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005b7:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1005be:	00 
  1005bf:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1005c2:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005c6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1005c9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1005cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005d0:	89 04 24             	mov    %eax,(%esp)
  1005d3:	e8 f4 fd ff ff       	call   1003cc <stab_binsearch>
    if (lfile == 0)
  1005d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005db:	85 c0                	test   %eax,%eax
  1005dd:	75 0a                	jne    1005e9 <debuginfo_eip+0xd7>
        return -1;
  1005df:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005e4:	e9 43 02 00 00       	jmp    10082c <debuginfo_eip+0x31a>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1005e9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005ec:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1005ef:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1005f2:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1005f5:	8b 45 08             	mov    0x8(%ebp),%eax
  1005f8:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005fc:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  100603:	00 
  100604:	8d 45 d8             	lea    -0x28(%ebp),%eax
  100607:	89 44 24 08          	mov    %eax,0x8(%esp)
  10060b:	8d 45 dc             	lea    -0x24(%ebp),%eax
  10060e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100612:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100615:	89 04 24             	mov    %eax,(%esp)
  100618:	e8 af fd ff ff       	call   1003cc <stab_binsearch>

    if (lfun <= rfun) {
  10061d:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100620:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100623:	39 c2                	cmp    %eax,%edx
  100625:	7f 72                	jg     100699 <debuginfo_eip+0x187>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  100627:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10062a:	89 c2                	mov    %eax,%edx
  10062c:	89 d0                	mov    %edx,%eax
  10062e:	01 c0                	add    %eax,%eax
  100630:	01 d0                	add    %edx,%eax
  100632:	c1 e0 02             	shl    $0x2,%eax
  100635:	03 45 f4             	add    -0xc(%ebp),%eax
  100638:	8b 10                	mov    (%eax),%edx
  10063a:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  10063d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100640:	89 cb                	mov    %ecx,%ebx
  100642:	29 c3                	sub    %eax,%ebx
  100644:	89 d8                	mov    %ebx,%eax
  100646:	39 c2                	cmp    %eax,%edx
  100648:	73 1e                	jae    100668 <debuginfo_eip+0x156>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  10064a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10064d:	89 c2                	mov    %eax,%edx
  10064f:	89 d0                	mov    %edx,%eax
  100651:	01 c0                	add    %eax,%eax
  100653:	01 d0                	add    %edx,%eax
  100655:	c1 e0 02             	shl    $0x2,%eax
  100658:	03 45 f4             	add    -0xc(%ebp),%eax
  10065b:	8b 00                	mov    (%eax),%eax
  10065d:	89 c2                	mov    %eax,%edx
  10065f:	03 55 ec             	add    -0x14(%ebp),%edx
  100662:	8b 45 0c             	mov    0xc(%ebp),%eax
  100665:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100668:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10066b:	89 c2                	mov    %eax,%edx
  10066d:	89 d0                	mov    %edx,%eax
  10066f:	01 c0                	add    %eax,%eax
  100671:	01 d0                	add    %edx,%eax
  100673:	c1 e0 02             	shl    $0x2,%eax
  100676:	03 45 f4             	add    -0xc(%ebp),%eax
  100679:	8b 50 08             	mov    0x8(%eax),%edx
  10067c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10067f:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100682:	8b 45 0c             	mov    0xc(%ebp),%eax
  100685:	8b 40 10             	mov    0x10(%eax),%eax
  100688:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  10068b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10068e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100691:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100694:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100697:	eb 15                	jmp    1006ae <debuginfo_eip+0x19c>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  100699:	8b 45 0c             	mov    0xc(%ebp),%eax
  10069c:	8b 55 08             	mov    0x8(%ebp),%edx
  10069f:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1006a2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006a5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1006a8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006ab:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1006ae:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006b1:	8b 40 08             	mov    0x8(%eax),%eax
  1006b4:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1006bb:	00 
  1006bc:	89 04 24             	mov    %eax,(%esp)
  1006bf:	e8 63 2c 00 00       	call   103327 <strfind>
  1006c4:	89 c2                	mov    %eax,%edx
  1006c6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006c9:	8b 40 08             	mov    0x8(%eax),%eax
  1006cc:	29 c2                	sub    %eax,%edx
  1006ce:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006d1:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1006d4:	8b 45 08             	mov    0x8(%ebp),%eax
  1006d7:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006db:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1006e2:	00 
  1006e3:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1006e6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006ea:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1006ed:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006f4:	89 04 24             	mov    %eax,(%esp)
  1006f7:	e8 d0 fc ff ff       	call   1003cc <stab_binsearch>
    if (lline <= rline) {
  1006fc:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1006ff:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100702:	39 c2                	cmp    %eax,%edx
  100704:	7f 20                	jg     100726 <debuginfo_eip+0x214>
        info->eip_line = stabs[rline].n_desc;
  100706:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100709:	89 c2                	mov    %eax,%edx
  10070b:	89 d0                	mov    %edx,%eax
  10070d:	01 c0                	add    %eax,%eax
  10070f:	01 d0                	add    %edx,%eax
  100711:	c1 e0 02             	shl    $0x2,%eax
  100714:	03 45 f4             	add    -0xc(%ebp),%eax
  100717:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  10071b:	0f b7 d0             	movzwl %ax,%edx
  10071e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100721:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100724:	eb 13                	jmp    100739 <debuginfo_eip+0x227>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  100726:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10072b:	e9 fc 00 00 00       	jmp    10082c <debuginfo_eip+0x31a>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100730:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100733:	83 e8 01             	sub    $0x1,%eax
  100736:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100739:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10073c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10073f:	39 c2                	cmp    %eax,%edx
  100741:	7c 4a                	jl     10078d <debuginfo_eip+0x27b>
           && stabs[lline].n_type != N_SOL
  100743:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100746:	89 c2                	mov    %eax,%edx
  100748:	89 d0                	mov    %edx,%eax
  10074a:	01 c0                	add    %eax,%eax
  10074c:	01 d0                	add    %edx,%eax
  10074e:	c1 e0 02             	shl    $0x2,%eax
  100751:	03 45 f4             	add    -0xc(%ebp),%eax
  100754:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100758:	3c 84                	cmp    $0x84,%al
  10075a:	74 31                	je     10078d <debuginfo_eip+0x27b>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  10075c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10075f:	89 c2                	mov    %eax,%edx
  100761:	89 d0                	mov    %edx,%eax
  100763:	01 c0                	add    %eax,%eax
  100765:	01 d0                	add    %edx,%eax
  100767:	c1 e0 02             	shl    $0x2,%eax
  10076a:	03 45 f4             	add    -0xc(%ebp),%eax
  10076d:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100771:	3c 64                	cmp    $0x64,%al
  100773:	75 bb                	jne    100730 <debuginfo_eip+0x21e>
  100775:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100778:	89 c2                	mov    %eax,%edx
  10077a:	89 d0                	mov    %edx,%eax
  10077c:	01 c0                	add    %eax,%eax
  10077e:	01 d0                	add    %edx,%eax
  100780:	c1 e0 02             	shl    $0x2,%eax
  100783:	03 45 f4             	add    -0xc(%ebp),%eax
  100786:	8b 40 08             	mov    0x8(%eax),%eax
  100789:	85 c0                	test   %eax,%eax
  10078b:	74 a3                	je     100730 <debuginfo_eip+0x21e>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10078d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100790:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100793:	39 c2                	cmp    %eax,%edx
  100795:	7c 40                	jl     1007d7 <debuginfo_eip+0x2c5>
  100797:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10079a:	89 c2                	mov    %eax,%edx
  10079c:	89 d0                	mov    %edx,%eax
  10079e:	01 c0                	add    %eax,%eax
  1007a0:	01 d0                	add    %edx,%eax
  1007a2:	c1 e0 02             	shl    $0x2,%eax
  1007a5:	03 45 f4             	add    -0xc(%ebp),%eax
  1007a8:	8b 10                	mov    (%eax),%edx
  1007aa:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1007ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007b0:	89 cb                	mov    %ecx,%ebx
  1007b2:	29 c3                	sub    %eax,%ebx
  1007b4:	89 d8                	mov    %ebx,%eax
  1007b6:	39 c2                	cmp    %eax,%edx
  1007b8:	73 1d                	jae    1007d7 <debuginfo_eip+0x2c5>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1007ba:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007bd:	89 c2                	mov    %eax,%edx
  1007bf:	89 d0                	mov    %edx,%eax
  1007c1:	01 c0                	add    %eax,%eax
  1007c3:	01 d0                	add    %edx,%eax
  1007c5:	c1 e0 02             	shl    $0x2,%eax
  1007c8:	03 45 f4             	add    -0xc(%ebp),%eax
  1007cb:	8b 00                	mov    (%eax),%eax
  1007cd:	89 c2                	mov    %eax,%edx
  1007cf:	03 55 ec             	add    -0x14(%ebp),%edx
  1007d2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007d5:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1007d7:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1007da:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007dd:	39 c2                	cmp    %eax,%edx
  1007df:	7d 46                	jge    100827 <debuginfo_eip+0x315>
        for (lline = lfun + 1;
  1007e1:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1007e4:	83 c0 01             	add    $0x1,%eax
  1007e7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1007ea:	eb 18                	jmp    100804 <debuginfo_eip+0x2f2>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1007ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007ef:	8b 40 14             	mov    0x14(%eax),%eax
  1007f2:	8d 50 01             	lea    0x1(%eax),%edx
  1007f5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007f8:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  1007fb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007fe:	83 c0 01             	add    $0x1,%eax
  100801:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100804:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100807:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  10080a:	39 c2                	cmp    %eax,%edx
  10080c:	7d 19                	jge    100827 <debuginfo_eip+0x315>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  10080e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100811:	89 c2                	mov    %eax,%edx
  100813:	89 d0                	mov    %edx,%eax
  100815:	01 c0                	add    %eax,%eax
  100817:	01 d0                	add    %edx,%eax
  100819:	c1 e0 02             	shl    $0x2,%eax
  10081c:	03 45 f4             	add    -0xc(%ebp),%eax
  10081f:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100823:	3c a0                	cmp    $0xa0,%al
  100825:	74 c5                	je     1007ec <debuginfo_eip+0x2da>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  100827:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10082c:	83 c4 54             	add    $0x54,%esp
  10082f:	5b                   	pop    %ebx
  100830:	5d                   	pop    %ebp
  100831:	c3                   	ret    

00100832 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100832:	55                   	push   %ebp
  100833:	89 e5                	mov    %esp,%ebp
  100835:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100838:	c7 04 24 36 37 10 00 	movl   $0x103736,(%esp)
  10083f:	e8 df fa ff ff       	call   100323 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100844:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10084b:	00 
  10084c:	c7 04 24 4f 37 10 00 	movl   $0x10374f,(%esp)
  100853:	e8 cb fa ff ff       	call   100323 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100858:	c7 44 24 04 67 36 10 	movl   $0x103667,0x4(%esp)
  10085f:	00 
  100860:	c7 04 24 67 37 10 00 	movl   $0x103767,(%esp)
  100867:	e8 b7 fa ff ff       	call   100323 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  10086c:	c7 44 24 04 18 ea 10 	movl   $0x10ea18,0x4(%esp)
  100873:	00 
  100874:	c7 04 24 7f 37 10 00 	movl   $0x10377f,(%esp)
  10087b:	e8 a3 fa ff ff       	call   100323 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100880:	c7 44 24 04 20 fd 10 	movl   $0x10fd20,0x4(%esp)
  100887:	00 
  100888:	c7 04 24 97 37 10 00 	movl   $0x103797,(%esp)
  10088f:	e8 8f fa ff ff       	call   100323 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100894:	b8 20 fd 10 00       	mov    $0x10fd20,%eax
  100899:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10089f:	b8 00 00 10 00       	mov    $0x100000,%eax
  1008a4:	89 d1                	mov    %edx,%ecx
  1008a6:	29 c1                	sub    %eax,%ecx
  1008a8:	89 c8                	mov    %ecx,%eax
  1008aa:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008b0:	85 c0                	test   %eax,%eax
  1008b2:	0f 48 c2             	cmovs  %edx,%eax
  1008b5:	c1 f8 0a             	sar    $0xa,%eax
  1008b8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008bc:	c7 04 24 b0 37 10 00 	movl   $0x1037b0,(%esp)
  1008c3:	e8 5b fa ff ff       	call   100323 <cprintf>
}
  1008c8:	c9                   	leave  
  1008c9:	c3                   	ret    

001008ca <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1008ca:	55                   	push   %ebp
  1008cb:	89 e5                	mov    %esp,%ebp
  1008cd:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1008d3:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1008d6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008da:	8b 45 08             	mov    0x8(%ebp),%eax
  1008dd:	89 04 24             	mov    %eax,(%esp)
  1008e0:	e8 2d fc ff ff       	call   100512 <debuginfo_eip>
  1008e5:	85 c0                	test   %eax,%eax
  1008e7:	74 15                	je     1008fe <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1008e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1008ec:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008f0:	c7 04 24 da 37 10 00 	movl   $0x1037da,(%esp)
  1008f7:	e8 27 fa ff ff       	call   100323 <cprintf>
  1008fc:	eb 69                	jmp    100967 <print_debuginfo+0x9d>
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1008fe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100905:	eb 1a                	jmp    100921 <print_debuginfo+0x57>
            fnname[j] = info.eip_fn_name[j];
  100907:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10090a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10090d:	01 d0                	add    %edx,%eax
  10090f:	0f b6 10             	movzbl (%eax),%edx
  100912:	8d 85 dc fe ff ff    	lea    -0x124(%ebp),%eax
  100918:	03 45 f4             	add    -0xc(%ebp),%eax
  10091b:	88 10                	mov    %dl,(%eax)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  10091d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100921:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100924:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  100927:	7f de                	jg     100907 <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  100929:	8d 85 dc fe ff ff    	lea    -0x124(%ebp),%eax
  10092f:	03 45 f4             	add    -0xc(%ebp),%eax
  100932:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  100935:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100938:	8b 55 08             	mov    0x8(%ebp),%edx
  10093b:	89 d1                	mov    %edx,%ecx
  10093d:	29 c1                	sub    %eax,%ecx
  10093f:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100942:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100945:	89 4c 24 10          	mov    %ecx,0x10(%esp)
                fnname, eip - info.eip_fn_addr);
  100949:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  10094f:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100953:	89 54 24 08          	mov    %edx,0x8(%esp)
  100957:	89 44 24 04          	mov    %eax,0x4(%esp)
  10095b:	c7 04 24 f6 37 10 00 	movl   $0x1037f6,(%esp)
  100962:	e8 bc f9 ff ff       	call   100323 <cprintf>
                fnname, eip - info.eip_fn_addr);
    }
}
  100967:	c9                   	leave  
  100968:	c3                   	ret    

00100969 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100969:	55                   	push   %ebp
  10096a:	89 e5                	mov    %esp,%ebp
  10096c:	53                   	push   %ebx
  10096d:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100970:	8b 5d 04             	mov    0x4(%ebp),%ebx
  100973:	89 5d f8             	mov    %ebx,-0x8(%ebp)
    return eip;
  100976:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  100979:	83 c4 10             	add    $0x10,%esp
  10097c:	5b                   	pop    %ebx
  10097d:	5d                   	pop    %ebp
  10097e:	c3                   	ret    

0010097f <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  10097f:	55                   	push   %ebp
  100980:	89 e5                	mov    %esp,%ebp
  100982:	53                   	push   %ebx
  100983:	83 ec 34             	sub    $0x34,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100986:	89 eb                	mov    %ebp,%ebx
  100988:	89 5d e8             	mov    %ebx,-0x18(%ebp)
    return ebp;
  10098b:	8b 45 e8             	mov    -0x18(%ebp),%eax
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */

      uint32_t ebp,eip;
      ebp=read_ebp();
  10098e:	89 45 f4             	mov    %eax,-0xc(%ebp)
      eip=read_eip();
  100991:	e8 d3 ff ff ff       	call   100969 <read_eip>
  100996:	89 45 f0             	mov    %eax,-0x10(%ebp)
      while(ebp)
  100999:	eb 6f                	jmp    100a0a <print_stackframe+0x8b>
      {
           uint32_t *p;
           p=(uint32_t*)ebp;
  10099b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10099e:	89 45 ec             	mov    %eax,-0x14(%ebp)
           cprintf("ebp:0x%08x eip:0x%08x args:0x%08x 0x%08x 0x%08x 0x%08x \n", ebp, eip, *(p+2), *(p+3), *(p+4), *(p+5));
  1009a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1009a4:	83 c0 14             	add    $0x14,%eax
  1009a7:	8b 18                	mov    (%eax),%ebx
  1009a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1009ac:	83 c0 10             	add    $0x10,%eax
  1009af:	8b 08                	mov    (%eax),%ecx
  1009b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1009b4:	83 c0 0c             	add    $0xc,%eax
  1009b7:	8b 10                	mov    (%eax),%edx
  1009b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1009bc:	83 c0 08             	add    $0x8,%eax
  1009bf:	8b 00                	mov    (%eax),%eax
  1009c1:	89 5c 24 18          	mov    %ebx,0x18(%esp)
  1009c5:	89 4c 24 14          	mov    %ecx,0x14(%esp)
  1009c9:	89 54 24 10          	mov    %edx,0x10(%esp)
  1009cd:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1009d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009d4:	89 44 24 08          	mov    %eax,0x8(%esp)
  1009d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009db:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009df:	c7 04 24 08 38 10 00 	movl   $0x103808,(%esp)
  1009e6:	e8 38 f9 ff ff       	call   100323 <cprintf>
           print_debuginfo(eip-1);
  1009eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009ee:	83 e8 01             	sub    $0x1,%eax
  1009f1:	89 04 24             	mov    %eax,(%esp)
  1009f4:	e8 d1 fe ff ff       	call   1008ca <print_debuginfo>
           ebp=*p;
  1009f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1009fc:	8b 00                	mov    (%eax),%eax
  1009fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
           eip=*(p+1);
  100a01:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100a04:	8b 40 04             	mov    0x4(%eax),%eax
  100a07:	89 45 f0             	mov    %eax,-0x10(%ebp)
      */

      uint32_t ebp,eip;
      ebp=read_ebp();
      eip=read_eip();
      while(ebp)
  100a0a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100a0e:	75 8b                	jne    10099b <print_stackframe+0x1c>
           print_debuginfo(eip-1);
           ebp=*p;
           eip=*(p+1);
      }
      
}
  100a10:	83 c4 34             	add    $0x34,%esp
  100a13:	5b                   	pop    %ebx
  100a14:	5d                   	pop    %ebp
  100a15:	c3                   	ret    
	...

00100a18 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100a18:	55                   	push   %ebp
  100a19:	89 e5                	mov    %esp,%ebp
  100a1b:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100a1e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a25:	eb 0d                	jmp    100a34 <parse+0x1c>
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
  100a27:	90                   	nop
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a28:	eb 0a                	jmp    100a34 <parse+0x1c>
            *buf ++ = '\0';
  100a2a:	8b 45 08             	mov    0x8(%ebp),%eax
  100a2d:	c6 00 00             	movb   $0x0,(%eax)
  100a30:	83 45 08 01          	addl   $0x1,0x8(%ebp)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a34:	8b 45 08             	mov    0x8(%ebp),%eax
  100a37:	0f b6 00             	movzbl (%eax),%eax
  100a3a:	84 c0                	test   %al,%al
  100a3c:	74 1d                	je     100a5b <parse+0x43>
  100a3e:	8b 45 08             	mov    0x8(%ebp),%eax
  100a41:	0f b6 00             	movzbl (%eax),%eax
  100a44:	0f be c0             	movsbl %al,%eax
  100a47:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a4b:	c7 04 24 c4 38 10 00 	movl   $0x1038c4,(%esp)
  100a52:	e8 9d 28 00 00       	call   1032f4 <strchr>
  100a57:	85 c0                	test   %eax,%eax
  100a59:	75 cf                	jne    100a2a <parse+0x12>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  100a5b:	8b 45 08             	mov    0x8(%ebp),%eax
  100a5e:	0f b6 00             	movzbl (%eax),%eax
  100a61:	84 c0                	test   %al,%al
  100a63:	74 5e                	je     100ac3 <parse+0xab>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100a65:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100a69:	75 14                	jne    100a7f <parse+0x67>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100a6b:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100a72:	00 
  100a73:	c7 04 24 c9 38 10 00 	movl   $0x1038c9,(%esp)
  100a7a:	e8 a4 f8 ff ff       	call   100323 <cprintf>
        }
        argv[argc ++] = buf;
  100a7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a82:	c1 e0 02             	shl    $0x2,%eax
  100a85:	03 45 0c             	add    0xc(%ebp),%eax
  100a88:	8b 55 08             	mov    0x8(%ebp),%edx
  100a8b:	89 10                	mov    %edx,(%eax)
  100a8d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100a91:	eb 04                	jmp    100a97 <parse+0x7f>
            buf ++;
  100a93:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100a97:	8b 45 08             	mov    0x8(%ebp),%eax
  100a9a:	0f b6 00             	movzbl (%eax),%eax
  100a9d:	84 c0                	test   %al,%al
  100a9f:	74 86                	je     100a27 <parse+0xf>
  100aa1:	8b 45 08             	mov    0x8(%ebp),%eax
  100aa4:	0f b6 00             	movzbl (%eax),%eax
  100aa7:	0f be c0             	movsbl %al,%eax
  100aaa:	89 44 24 04          	mov    %eax,0x4(%esp)
  100aae:	c7 04 24 c4 38 10 00 	movl   $0x1038c4,(%esp)
  100ab5:	e8 3a 28 00 00       	call   1032f4 <strchr>
  100aba:	85 c0                	test   %eax,%eax
  100abc:	74 d5                	je     100a93 <parse+0x7b>
            buf ++;
        }
    }
  100abe:	e9 64 ff ff ff       	jmp    100a27 <parse+0xf>
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
            break;
  100ac3:	90                   	nop
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
    return argc;
  100ac4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100ac7:	c9                   	leave  
  100ac8:	c3                   	ret    

00100ac9 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100ac9:	55                   	push   %ebp
  100aca:	89 e5                	mov    %esp,%ebp
  100acc:	83 ec 68             	sub    $0x68,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100acf:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100ad2:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ad6:	8b 45 08             	mov    0x8(%ebp),%eax
  100ad9:	89 04 24             	mov    %eax,(%esp)
  100adc:	e8 37 ff ff ff       	call   100a18 <parse>
  100ae1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100ae4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100ae8:	75 0a                	jne    100af4 <runcmd+0x2b>
        return 0;
  100aea:	b8 00 00 00 00       	mov    $0x0,%eax
  100aef:	e9 85 00 00 00       	jmp    100b79 <runcmd+0xb0>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100af4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100afb:	eb 5c                	jmp    100b59 <runcmd+0x90>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100afd:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100b00:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b03:	89 d0                	mov    %edx,%eax
  100b05:	01 c0                	add    %eax,%eax
  100b07:	01 d0                	add    %edx,%eax
  100b09:	c1 e0 02             	shl    $0x2,%eax
  100b0c:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b11:	8b 00                	mov    (%eax),%eax
  100b13:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100b17:	89 04 24             	mov    %eax,(%esp)
  100b1a:	e8 30 27 00 00       	call   10324f <strcmp>
  100b1f:	85 c0                	test   %eax,%eax
  100b21:	75 32                	jne    100b55 <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100b23:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b26:	89 d0                	mov    %edx,%eax
  100b28:	01 c0                	add    %eax,%eax
  100b2a:	01 d0                	add    %edx,%eax
  100b2c:	c1 e0 02             	shl    $0x2,%eax
  100b2f:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b34:	8b 50 08             	mov    0x8(%eax),%edx
  100b37:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b3a:	8d 48 ff             	lea    -0x1(%eax),%ecx
  100b3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100b40:	89 44 24 08          	mov    %eax,0x8(%esp)
  100b44:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b47:	83 c0 04             	add    $0x4,%eax
  100b4a:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b4e:	89 0c 24             	mov    %ecx,(%esp)
  100b51:	ff d2                	call   *%edx
  100b53:	eb 24                	jmp    100b79 <runcmd+0xb0>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b55:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100b59:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b5c:	83 f8 02             	cmp    $0x2,%eax
  100b5f:	76 9c                	jbe    100afd <runcmd+0x34>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100b61:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100b64:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b68:	c7 04 24 e7 38 10 00 	movl   $0x1038e7,(%esp)
  100b6f:	e8 af f7 ff ff       	call   100323 <cprintf>
    return 0;
  100b74:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100b79:	c9                   	leave  
  100b7a:	c3                   	ret    

00100b7b <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100b7b:	55                   	push   %ebp
  100b7c:	89 e5                	mov    %esp,%ebp
  100b7e:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100b81:	c7 04 24 00 39 10 00 	movl   $0x103900,(%esp)
  100b88:	e8 96 f7 ff ff       	call   100323 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100b8d:	c7 04 24 28 39 10 00 	movl   $0x103928,(%esp)
  100b94:	e8 8a f7 ff ff       	call   100323 <cprintf>

    if (tf != NULL) {
  100b99:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100b9d:	74 0e                	je     100bad <kmonitor+0x32>
        print_trapframe(tf);
  100b9f:	8b 45 08             	mov    0x8(%ebp),%eax
  100ba2:	89 04 24             	mov    %eax,(%esp)
  100ba5:	e8 d2 0e 00 00       	call   101a7c <print_trapframe>
  100baa:	eb 01                	jmp    100bad <kmonitor+0x32>
        if ((buf = readline("K> ")) != NULL) {
            if (runcmd(buf, tf) < 0) {
                break;
            }
        }
    }
  100bac:	90                   	nop
        print_trapframe(tf);
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100bad:	c7 04 24 4d 39 10 00 	movl   $0x10394d,(%esp)
  100bb4:	e8 5b f6 ff ff       	call   100214 <readline>
  100bb9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100bbc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100bc0:	74 ea                	je     100bac <kmonitor+0x31>
            if (runcmd(buf, tf) < 0) {
  100bc2:	8b 45 08             	mov    0x8(%ebp),%eax
  100bc5:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bc9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bcc:	89 04 24             	mov    %eax,(%esp)
  100bcf:	e8 f5 fe ff ff       	call   100ac9 <runcmd>
  100bd4:	85 c0                	test   %eax,%eax
  100bd6:	79 d4                	jns    100bac <kmonitor+0x31>
                break;
  100bd8:	90                   	nop
            }
        }
    }
}
  100bd9:	c9                   	leave  
  100bda:	c3                   	ret    

00100bdb <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100bdb:	55                   	push   %ebp
  100bdc:	89 e5                	mov    %esp,%ebp
  100bde:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100be1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100be8:	eb 3f                	jmp    100c29 <mon_help+0x4e>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100bea:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100bed:	89 d0                	mov    %edx,%eax
  100bef:	01 c0                	add    %eax,%eax
  100bf1:	01 d0                	add    %edx,%eax
  100bf3:	c1 e0 02             	shl    $0x2,%eax
  100bf6:	05 00 e0 10 00       	add    $0x10e000,%eax
  100bfb:	8b 48 04             	mov    0x4(%eax),%ecx
  100bfe:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c01:	89 d0                	mov    %edx,%eax
  100c03:	01 c0                	add    %eax,%eax
  100c05:	01 d0                	add    %edx,%eax
  100c07:	c1 e0 02             	shl    $0x2,%eax
  100c0a:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c0f:	8b 00                	mov    (%eax),%eax
  100c11:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c15:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c19:	c7 04 24 51 39 10 00 	movl   $0x103951,(%esp)
  100c20:	e8 fe f6 ff ff       	call   100323 <cprintf>

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c25:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c29:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c2c:	83 f8 02             	cmp    $0x2,%eax
  100c2f:	76 b9                	jbe    100bea <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100c31:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c36:	c9                   	leave  
  100c37:	c3                   	ret    

00100c38 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100c38:	55                   	push   %ebp
  100c39:	89 e5                	mov    %esp,%ebp
  100c3b:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100c3e:	e8 ef fb ff ff       	call   100832 <print_kerninfo>
    return 0;
  100c43:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c48:	c9                   	leave  
  100c49:	c3                   	ret    

00100c4a <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100c4a:	55                   	push   %ebp
  100c4b:	89 e5                	mov    %esp,%ebp
  100c4d:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100c50:	e8 2a fd ff ff       	call   10097f <print_stackframe>
    return 0;
  100c55:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c5a:	c9                   	leave  
  100c5b:	c3                   	ret    

00100c5c <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100c5c:	55                   	push   %ebp
  100c5d:	89 e5                	mov    %esp,%ebp
  100c5f:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  100c62:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  100c67:	85 c0                	test   %eax,%eax
  100c69:	75 4c                	jne    100cb7 <__panic+0x5b>
        goto panic_dead;
    }
    is_panic = 1;
  100c6b:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  100c72:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  100c75:	8d 55 14             	lea    0x14(%ebp),%edx
  100c78:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100c7b:	89 10                	mov    %edx,(%eax)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100c7d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100c80:	89 44 24 08          	mov    %eax,0x8(%esp)
  100c84:	8b 45 08             	mov    0x8(%ebp),%eax
  100c87:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c8b:	c7 04 24 5a 39 10 00 	movl   $0x10395a,(%esp)
  100c92:	e8 8c f6 ff ff       	call   100323 <cprintf>
    vcprintf(fmt, ap);
  100c97:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c9a:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c9e:	8b 45 10             	mov    0x10(%ebp),%eax
  100ca1:	89 04 24             	mov    %eax,(%esp)
  100ca4:	e8 47 f6 ff ff       	call   1002f0 <vcprintf>
    cprintf("\n");
  100ca9:	c7 04 24 76 39 10 00 	movl   $0x103976,(%esp)
  100cb0:	e8 6e f6 ff ff       	call   100323 <cprintf>
  100cb5:	eb 01                	jmp    100cb8 <__panic+0x5c>
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
    if (is_panic) {
        goto panic_dead;
  100cb7:	90                   	nop
    vcprintf(fmt, ap);
    cprintf("\n");
    va_end(ap);

panic_dead:
    intr_disable();
  100cb8:	e8 c9 09 00 00       	call   101686 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100cbd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100cc4:	e8 b2 fe ff ff       	call   100b7b <kmonitor>
    }
  100cc9:	eb f2                	jmp    100cbd <__panic+0x61>

00100ccb <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100ccb:	55                   	push   %ebp
  100ccc:	89 e5                	mov    %esp,%ebp
  100cce:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100cd1:	8d 55 14             	lea    0x14(%ebp),%edx
  100cd4:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100cd7:	89 10                	mov    %edx,(%eax)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100cd9:	8b 45 0c             	mov    0xc(%ebp),%eax
  100cdc:	89 44 24 08          	mov    %eax,0x8(%esp)
  100ce0:	8b 45 08             	mov    0x8(%ebp),%eax
  100ce3:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ce7:	c7 04 24 78 39 10 00 	movl   $0x103978,(%esp)
  100cee:	e8 30 f6 ff ff       	call   100323 <cprintf>
    vcprintf(fmt, ap);
  100cf3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cf6:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cfa:	8b 45 10             	mov    0x10(%ebp),%eax
  100cfd:	89 04 24             	mov    %eax,(%esp)
  100d00:	e8 eb f5 ff ff       	call   1002f0 <vcprintf>
    cprintf("\n");
  100d05:	c7 04 24 76 39 10 00 	movl   $0x103976,(%esp)
  100d0c:	e8 12 f6 ff ff       	call   100323 <cprintf>
    va_end(ap);
}
  100d11:	c9                   	leave  
  100d12:	c3                   	ret    

00100d13 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100d13:	55                   	push   %ebp
  100d14:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100d16:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100d1b:	5d                   	pop    %ebp
  100d1c:	c3                   	ret    
  100d1d:	00 00                	add    %al,(%eax)
	...

00100d20 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d20:	55                   	push   %ebp
  100d21:	89 e5                	mov    %esp,%ebp
  100d23:	83 ec 28             	sub    $0x28,%esp
  100d26:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d2c:	c6 45 f5 34          	movb   $0x34,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d30:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100d34:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d38:	ee                   	out    %al,(%dx)
  100d39:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d3f:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100d43:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d47:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d4b:	ee                   	out    %al,(%dx)
  100d4c:	66 c7 45 ee 40 00    	movw   $0x40,-0x12(%ebp)
  100d52:	c6 45 ed 2e          	movb   $0x2e,-0x13(%ebp)
  100d56:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100d5a:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100d5e:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100d5f:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100d66:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100d69:	c7 04 24 96 39 10 00 	movl   $0x103996,(%esp)
  100d70:	e8 ae f5 ff ff       	call   100323 <cprintf>
    pic_enable(IRQ_TIMER);
  100d75:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100d7c:	e8 63 09 00 00       	call   1016e4 <pic_enable>
}
  100d81:	c9                   	leave  
  100d82:	c3                   	ret    
	...

00100d84 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100d84:	55                   	push   %ebp
  100d85:	89 e5                	mov    %esp,%ebp
  100d87:	53                   	push   %ebx
  100d88:	83 ec 14             	sub    $0x14,%esp
  100d8b:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100d91:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100d95:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  100d99:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100d9d:	ec                   	in     (%dx),%al
  100d9e:	89 c3                	mov    %eax,%ebx
  100da0:	88 5d f9             	mov    %bl,-0x7(%ebp)
    return data;
  100da3:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100da9:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100dad:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  100db1:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100db5:	ec                   	in     (%dx),%al
  100db6:	89 c3                	mov    %eax,%ebx
  100db8:	88 5d f5             	mov    %bl,-0xb(%ebp)
    return data;
  100dbb:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100dc1:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100dc5:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  100dc9:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100dcd:	ec                   	in     (%dx),%al
  100dce:	89 c3                	mov    %eax,%ebx
  100dd0:	88 5d f1             	mov    %bl,-0xf(%ebp)
    return data;
  100dd3:	66 c7 45 ee 84 00    	movw   $0x84,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100dd9:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100ddd:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  100de1:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100de5:	ec                   	in     (%dx),%al
  100de6:	89 c3                	mov    %eax,%ebx
  100de8:	88 5d ed             	mov    %bl,-0x13(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100deb:	83 c4 14             	add    $0x14,%esp
  100dee:	5b                   	pop    %ebx
  100def:	5d                   	pop    %ebp
  100df0:	c3                   	ret    

00100df1 <cga_init>:
static uint16_t addr_6845;

/* TEXT-mode CGA/VGA display output */

static void
cga_init(void) {
  100df1:	55                   	push   %ebp
  100df2:	89 e5                	mov    %esp,%ebp
  100df4:	53                   	push   %ebx
  100df5:	83 ec 24             	sub    $0x24,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;
  100df8:	c7 45 f8 00 80 0b 00 	movl   $0xb8000,-0x8(%ebp)
    uint16_t was = *cp;
  100dff:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100e02:	0f b7 00             	movzwl (%eax),%eax
  100e05:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
    *cp = (uint16_t) 0xA55A;
  100e09:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100e0c:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {
  100e11:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100e14:	0f b7 00             	movzwl (%eax),%eax
  100e17:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100e1b:	74 12                	je     100e2f <cga_init+0x3e>
        cp = (uint16_t*)MONO_BUF;
  100e1d:	c7 45 f8 00 00 0b 00 	movl   $0xb0000,-0x8(%ebp)
        addr_6845 = MONO_BASE;
  100e24:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e2b:	b4 03 
  100e2d:	eb 13                	jmp    100e42 <cga_init+0x51>
    } else {
        *cp = was;
  100e2f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100e32:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100e36:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;
  100e39:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e40:	d4 03 
    }

    // Extract cursor location
    uint32_t pos;
    outb(addr_6845, 14);
  100e42:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e49:	0f b7 c0             	movzwl %ax,%eax
  100e4c:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100e50:	c6 45 ed 0e          	movb   $0xe,-0x13(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e54:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100e58:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100e5c:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;
  100e5d:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e64:	83 c0 01             	add    $0x1,%eax
  100e67:	0f b7 c0             	movzwl %ax,%eax
  100e6a:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e6e:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100e72:	66 89 55 da          	mov    %dx,-0x26(%ebp)
  100e76:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100e7a:	ec                   	in     (%dx),%al
  100e7b:	89 c3                	mov    %eax,%ebx
  100e7d:	88 5d e9             	mov    %bl,-0x17(%ebp)
    return data;
  100e80:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100e84:	0f b6 c0             	movzbl %al,%eax
  100e87:	c1 e0 08             	shl    $0x8,%eax
  100e8a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    outb(addr_6845, 15);
  100e8d:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e94:	0f b7 c0             	movzwl %ax,%eax
  100e97:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100e9b:	c6 45 e5 0f          	movb   $0xf,-0x1b(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e9f:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100ea3:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100ea7:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);
  100ea8:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100eaf:	83 c0 01             	add    $0x1,%eax
  100eb2:	0f b7 c0             	movzwl %ax,%eax
  100eb5:	66 89 45 e2          	mov    %ax,-0x1e(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100eb9:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100ebd:	66 89 55 da          	mov    %dx,-0x26(%ebp)
  100ec1:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100ec5:	ec                   	in     (%dx),%al
  100ec6:	89 c3                	mov    %eax,%ebx
  100ec8:	88 5d e1             	mov    %bl,-0x1f(%ebp)
    return data;
  100ecb:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100ecf:	0f b6 c0             	movzbl %al,%eax
  100ed2:	09 45 f0             	or     %eax,-0x10(%ebp)

    crt_buf = (uint16_t*) cp;
  100ed5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100ed8:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;
  100edd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ee0:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100ee6:	83 c4 24             	add    $0x24,%esp
  100ee9:	5b                   	pop    %ebx
  100eea:	5d                   	pop    %ebp
  100eeb:	c3                   	ret    

00100eec <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100eec:	55                   	push   %ebp
  100eed:	89 e5                	mov    %esp,%ebp
  100eef:	53                   	push   %ebx
  100ef0:	83 ec 54             	sub    $0x54,%esp
  100ef3:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100ef9:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100efd:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100f01:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100f05:	ee                   	out    %al,(%dx)
  100f06:	66 c7 45 f2 fb 03    	movw   $0x3fb,-0xe(%ebp)
  100f0c:	c6 45 f1 80          	movb   $0x80,-0xf(%ebp)
  100f10:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f14:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f18:	ee                   	out    %al,(%dx)
  100f19:	66 c7 45 ee f8 03    	movw   $0x3f8,-0x12(%ebp)
  100f1f:	c6 45 ed 0c          	movb   $0xc,-0x13(%ebp)
  100f23:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f27:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f2b:	ee                   	out    %al,(%dx)
  100f2c:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f32:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
  100f36:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f3a:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f3e:	ee                   	out    %al,(%dx)
  100f3f:	66 c7 45 e6 fb 03    	movw   $0x3fb,-0x1a(%ebp)
  100f45:	c6 45 e5 03          	movb   $0x3,-0x1b(%ebp)
  100f49:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f4d:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f51:	ee                   	out    %al,(%dx)
  100f52:	66 c7 45 e2 fc 03    	movw   $0x3fc,-0x1e(%ebp)
  100f58:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
  100f5c:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f60:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f64:	ee                   	out    %al,(%dx)
  100f65:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f6b:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
  100f6f:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f73:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f77:	ee                   	out    %al,(%dx)
  100f78:	66 c7 45 da fd 03    	movw   $0x3fd,-0x26(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f7e:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100f82:	66 89 55 c6          	mov    %dx,-0x3a(%ebp)
  100f86:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
  100f8a:	ec                   	in     (%dx),%al
  100f8b:	89 c3                	mov    %eax,%ebx
  100f8d:	88 5d d9             	mov    %bl,-0x27(%ebp)
    return data;
  100f90:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f94:	3c ff                	cmp    $0xff,%al
  100f96:	0f 95 c0             	setne  %al
  100f99:	0f b6 c0             	movzbl %al,%eax
  100f9c:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100fa1:	66 c7 45 d6 fa 03    	movw   $0x3fa,-0x2a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fa7:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100fab:	66 89 55 c6          	mov    %dx,-0x3a(%ebp)
  100faf:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
  100fb3:	ec                   	in     (%dx),%al
  100fb4:	89 c3                	mov    %eax,%ebx
  100fb6:	88 5d d5             	mov    %bl,-0x2b(%ebp)
    return data;
  100fb9:	66 c7 45 d2 f8 03    	movw   $0x3f8,-0x2e(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fbf:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100fc3:	66 89 55 c6          	mov    %dx,-0x3a(%ebp)
  100fc7:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
  100fcb:	ec                   	in     (%dx),%al
  100fcc:	89 c3                	mov    %eax,%ebx
  100fce:	88 5d d1             	mov    %bl,-0x2f(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100fd1:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100fd6:	85 c0                	test   %eax,%eax
  100fd8:	74 0c                	je     100fe6 <serial_init+0xfa>
        pic_enable(IRQ_COM1);
  100fda:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100fe1:	e8 fe 06 00 00       	call   1016e4 <pic_enable>
    }
}
  100fe6:	83 c4 54             	add    $0x54,%esp
  100fe9:	5b                   	pop    %ebx
  100fea:	5d                   	pop    %ebp
  100feb:	c3                   	ret    

00100fec <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fec:	55                   	push   %ebp
  100fed:	89 e5                	mov    %esp,%ebp
  100fef:	53                   	push   %ebx
  100ff0:	83 ec 24             	sub    $0x24,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100ff3:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  100ffa:	eb 09                	jmp    101005 <lpt_putc_sub+0x19>
        delay();
  100ffc:	e8 83 fd ff ff       	call   100d84 <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101001:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  101005:	66 c7 45 f6 79 03    	movw   $0x379,-0xa(%ebp)
  10100b:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10100f:	66 89 55 da          	mov    %dx,-0x26(%ebp)
  101013:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101017:	ec                   	in     (%dx),%al
  101018:	89 c3                	mov    %eax,%ebx
  10101a:	88 5d f5             	mov    %bl,-0xb(%ebp)
    return data;
  10101d:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101021:	84 c0                	test   %al,%al
  101023:	78 09                	js     10102e <lpt_putc_sub+0x42>
  101025:	81 7d f8 ff 31 00 00 	cmpl   $0x31ff,-0x8(%ebp)
  10102c:	7e ce                	jle    100ffc <lpt_putc_sub+0x10>
        delay();
    }
    outb(LPTPORT + 0, c);
  10102e:	8b 45 08             	mov    0x8(%ebp),%eax
  101031:	0f b6 c0             	movzbl %al,%eax
  101034:	66 c7 45 f2 78 03    	movw   $0x378,-0xe(%ebp)
  10103a:	88 45 f1             	mov    %al,-0xf(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10103d:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101041:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101045:	ee                   	out    %al,(%dx)
  101046:	66 c7 45 ee 7a 03    	movw   $0x37a,-0x12(%ebp)
  10104c:	c6 45 ed 0d          	movb   $0xd,-0x13(%ebp)
  101050:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101054:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101058:	ee                   	out    %al,(%dx)
  101059:	66 c7 45 ea 7a 03    	movw   $0x37a,-0x16(%ebp)
  10105f:	c6 45 e9 08          	movb   $0x8,-0x17(%ebp)
  101063:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101067:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10106b:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  10106c:	83 c4 24             	add    $0x24,%esp
  10106f:	5b                   	pop    %ebx
  101070:	5d                   	pop    %ebp
  101071:	c3                   	ret    

00101072 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  101072:	55                   	push   %ebp
  101073:	89 e5                	mov    %esp,%ebp
  101075:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101078:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  10107c:	74 0d                	je     10108b <lpt_putc+0x19>
        lpt_putc_sub(c);
  10107e:	8b 45 08             	mov    0x8(%ebp),%eax
  101081:	89 04 24             	mov    %eax,(%esp)
  101084:	e8 63 ff ff ff       	call   100fec <lpt_putc_sub>
  101089:	eb 24                	jmp    1010af <lpt_putc+0x3d>
    }
    else {
        lpt_putc_sub('\b');
  10108b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101092:	e8 55 ff ff ff       	call   100fec <lpt_putc_sub>
        lpt_putc_sub(' ');
  101097:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10109e:	e8 49 ff ff ff       	call   100fec <lpt_putc_sub>
        lpt_putc_sub('\b');
  1010a3:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1010aa:	e8 3d ff ff ff       	call   100fec <lpt_putc_sub>
    }
}
  1010af:	c9                   	leave  
  1010b0:	c3                   	ret    

001010b1 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  1010b1:	55                   	push   %ebp
  1010b2:	89 e5                	mov    %esp,%ebp
  1010b4:	53                   	push   %ebx
  1010b5:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  1010b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1010bb:	b0 00                	mov    $0x0,%al
  1010bd:	85 c0                	test   %eax,%eax
  1010bf:	75 07                	jne    1010c8 <cga_putc+0x17>
        c |= 0x0700;
  1010c1:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  1010c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1010cb:	25 ff 00 00 00       	and    $0xff,%eax
  1010d0:	83 f8 0a             	cmp    $0xa,%eax
  1010d3:	74 4e                	je     101123 <cga_putc+0x72>
  1010d5:	83 f8 0d             	cmp    $0xd,%eax
  1010d8:	74 59                	je     101133 <cga_putc+0x82>
  1010da:	83 f8 08             	cmp    $0x8,%eax
  1010dd:	0f 85 8c 00 00 00    	jne    10116f <cga_putc+0xbe>
    case '\b':
        if (crt_pos > 0) {
  1010e3:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010ea:	66 85 c0             	test   %ax,%ax
  1010ed:	0f 84 a1 00 00 00    	je     101194 <cga_putc+0xe3>
            crt_pos --;
  1010f3:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010fa:	83 e8 01             	sub    $0x1,%eax
  1010fd:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  101103:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101108:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  10110f:	0f b7 d2             	movzwl %dx,%edx
  101112:	01 d2                	add    %edx,%edx
  101114:	01 c2                	add    %eax,%edx
  101116:	8b 45 08             	mov    0x8(%ebp),%eax
  101119:	b0 00                	mov    $0x0,%al
  10111b:	83 c8 20             	or     $0x20,%eax
  10111e:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  101121:	eb 71                	jmp    101194 <cga_putc+0xe3>
    case '\n':
        crt_pos += CRT_COLS;
  101123:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10112a:	83 c0 50             	add    $0x50,%eax
  10112d:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  101133:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  10113a:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  101141:	0f b7 c1             	movzwl %cx,%eax
  101144:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  10114a:	c1 e8 10             	shr    $0x10,%eax
  10114d:	89 c2                	mov    %eax,%edx
  10114f:	66 c1 ea 06          	shr    $0x6,%dx
  101153:	89 d0                	mov    %edx,%eax
  101155:	c1 e0 02             	shl    $0x2,%eax
  101158:	01 d0                	add    %edx,%eax
  10115a:	c1 e0 04             	shl    $0x4,%eax
  10115d:	89 ca                	mov    %ecx,%edx
  10115f:	66 29 c2             	sub    %ax,%dx
  101162:	89 d8                	mov    %ebx,%eax
  101164:	66 29 d0             	sub    %dx,%ax
  101167:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  10116d:	eb 26                	jmp    101195 <cga_putc+0xe4>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  10116f:	8b 15 60 ee 10 00    	mov    0x10ee60,%edx
  101175:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10117c:	0f b7 c8             	movzwl %ax,%ecx
  10117f:	01 c9                	add    %ecx,%ecx
  101181:	01 d1                	add    %edx,%ecx
  101183:	8b 55 08             	mov    0x8(%ebp),%edx
  101186:	66 89 11             	mov    %dx,(%ecx)
  101189:	83 c0 01             	add    $0x1,%eax
  10118c:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  101192:	eb 01                	jmp    101195 <cga_putc+0xe4>
    case '\b':
        if (crt_pos > 0) {
            crt_pos --;
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
        }
        break;
  101194:	90                   	nop
        crt_buf[crt_pos ++] = c;     // write the character
        break;
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101195:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10119c:	66 3d cf 07          	cmp    $0x7cf,%ax
  1011a0:	76 5b                	jbe    1011fd <cga_putc+0x14c>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  1011a2:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011a7:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  1011ad:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011b2:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  1011b9:	00 
  1011ba:	89 54 24 04          	mov    %edx,0x4(%esp)
  1011be:	89 04 24             	mov    %eax,(%esp)
  1011c1:	e8 34 23 00 00       	call   1034fa <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011c6:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1011cd:	eb 15                	jmp    1011e4 <cga_putc+0x133>
            crt_buf[i] = 0x0700 | ' ';
  1011cf:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011d4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1011d7:	01 d2                	add    %edx,%edx
  1011d9:	01 d0                	add    %edx,%eax
  1011db:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011e0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1011e4:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1011eb:	7e e2                	jle    1011cf <cga_putc+0x11e>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  1011ed:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011f4:	83 e8 50             	sub    $0x50,%eax
  1011f7:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011fd:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  101204:	0f b7 c0             	movzwl %ax,%eax
  101207:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  10120b:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
  10120f:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101213:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101217:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  101218:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10121f:	66 c1 e8 08          	shr    $0x8,%ax
  101223:	0f b6 c0             	movzbl %al,%eax
  101226:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  10122d:	83 c2 01             	add    $0x1,%edx
  101230:	0f b7 d2             	movzwl %dx,%edx
  101233:	66 89 55 ee          	mov    %dx,-0x12(%ebp)
  101237:	88 45 ed             	mov    %al,-0x13(%ebp)
  10123a:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10123e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101242:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  101243:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  10124a:	0f b7 c0             	movzwl %ax,%eax
  10124d:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  101251:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
  101255:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101259:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10125d:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  10125e:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101265:	0f b6 c0             	movzbl %al,%eax
  101268:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  10126f:	83 c2 01             	add    $0x1,%edx
  101272:	0f b7 d2             	movzwl %dx,%edx
  101275:	66 89 55 e6          	mov    %dx,-0x1a(%ebp)
  101279:	88 45 e5             	mov    %al,-0x1b(%ebp)
  10127c:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101280:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101284:	ee                   	out    %al,(%dx)
}
  101285:	83 c4 34             	add    $0x34,%esp
  101288:	5b                   	pop    %ebx
  101289:	5d                   	pop    %ebp
  10128a:	c3                   	ret    

0010128b <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  10128b:	55                   	push   %ebp
  10128c:	89 e5                	mov    %esp,%ebp
  10128e:	53                   	push   %ebx
  10128f:	83 ec 14             	sub    $0x14,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101292:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  101299:	eb 09                	jmp    1012a4 <serial_putc_sub+0x19>
        delay();
  10129b:	e8 e4 fa ff ff       	call   100d84 <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1012a0:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  1012a4:	66 c7 45 f6 fd 03    	movw   $0x3fd,-0xa(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1012aa:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1012ae:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  1012b2:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1012b6:	ec                   	in     (%dx),%al
  1012b7:	89 c3                	mov    %eax,%ebx
  1012b9:	88 5d f5             	mov    %bl,-0xb(%ebp)
    return data;
  1012bc:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1012c0:	0f b6 c0             	movzbl %al,%eax
  1012c3:	83 e0 20             	and    $0x20,%eax
  1012c6:	85 c0                	test   %eax,%eax
  1012c8:	75 09                	jne    1012d3 <serial_putc_sub+0x48>
  1012ca:	81 7d f8 ff 31 00 00 	cmpl   $0x31ff,-0x8(%ebp)
  1012d1:	7e c8                	jle    10129b <serial_putc_sub+0x10>
        delay();
    }
    outb(COM1 + COM_TX, c);
  1012d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1012d6:	0f b6 c0             	movzbl %al,%eax
  1012d9:	66 c7 45 f2 f8 03    	movw   $0x3f8,-0xe(%ebp)
  1012df:	88 45 f1             	mov    %al,-0xf(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012e2:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1012e6:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1012ea:	ee                   	out    %al,(%dx)
}
  1012eb:	83 c4 14             	add    $0x14,%esp
  1012ee:	5b                   	pop    %ebx
  1012ef:	5d                   	pop    %ebp
  1012f0:	c3                   	ret    

001012f1 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  1012f1:	55                   	push   %ebp
  1012f2:	89 e5                	mov    %esp,%ebp
  1012f4:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1012f7:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1012fb:	74 0d                	je     10130a <serial_putc+0x19>
        serial_putc_sub(c);
  1012fd:	8b 45 08             	mov    0x8(%ebp),%eax
  101300:	89 04 24             	mov    %eax,(%esp)
  101303:	e8 83 ff ff ff       	call   10128b <serial_putc_sub>
  101308:	eb 24                	jmp    10132e <serial_putc+0x3d>
    }
    else {
        serial_putc_sub('\b');
  10130a:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101311:	e8 75 ff ff ff       	call   10128b <serial_putc_sub>
        serial_putc_sub(' ');
  101316:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10131d:	e8 69 ff ff ff       	call   10128b <serial_putc_sub>
        serial_putc_sub('\b');
  101322:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101329:	e8 5d ff ff ff       	call   10128b <serial_putc_sub>
    }
}
  10132e:	c9                   	leave  
  10132f:	c3                   	ret    

00101330 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  101330:	55                   	push   %ebp
  101331:	89 e5                	mov    %esp,%ebp
  101333:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  101336:	eb 32                	jmp    10136a <cons_intr+0x3a>
        if (c != 0) {
  101338:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10133c:	74 2c                	je     10136a <cons_intr+0x3a>
            cons.buf[cons.wpos ++] = c;
  10133e:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101343:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101346:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
  10134c:	83 c0 01             	add    $0x1,%eax
  10134f:	a3 84 f0 10 00       	mov    %eax,0x10f084
            if (cons.wpos == CONSBUFSIZE) {
  101354:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101359:	3d 00 02 00 00       	cmp    $0x200,%eax
  10135e:	75 0a                	jne    10136a <cons_intr+0x3a>
                cons.wpos = 0;
  101360:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  101367:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  10136a:	8b 45 08             	mov    0x8(%ebp),%eax
  10136d:	ff d0                	call   *%eax
  10136f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101372:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  101376:	75 c0                	jne    101338 <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  101378:	c9                   	leave  
  101379:	c3                   	ret    

0010137a <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  10137a:	55                   	push   %ebp
  10137b:	89 e5                	mov    %esp,%ebp
  10137d:	53                   	push   %ebx
  10137e:	83 ec 14             	sub    $0x14,%esp
  101381:	66 c7 45 f6 fd 03    	movw   $0x3fd,-0xa(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101387:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10138b:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  10138f:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101393:	ec                   	in     (%dx),%al
  101394:	89 c3                	mov    %eax,%ebx
  101396:	88 5d f5             	mov    %bl,-0xb(%ebp)
    return data;
  101399:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  10139d:	0f b6 c0             	movzbl %al,%eax
  1013a0:	83 e0 01             	and    $0x1,%eax
  1013a3:	85 c0                	test   %eax,%eax
  1013a5:	75 07                	jne    1013ae <serial_proc_data+0x34>
        return -1;
  1013a7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013ac:	eb 32                	jmp    1013e0 <serial_proc_data+0x66>
  1013ae:	66 c7 45 f2 f8 03    	movw   $0x3f8,-0xe(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013b4:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1013b8:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  1013bc:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1013c0:	ec                   	in     (%dx),%al
  1013c1:	89 c3                	mov    %eax,%ebx
  1013c3:	88 5d f1             	mov    %bl,-0xf(%ebp)
    return data;
  1013c6:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  1013ca:	0f b6 c0             	movzbl %al,%eax
  1013cd:	89 45 f8             	mov    %eax,-0x8(%ebp)
    if (c == 127) {
  1013d0:	83 7d f8 7f          	cmpl   $0x7f,-0x8(%ebp)
  1013d4:	75 07                	jne    1013dd <serial_proc_data+0x63>
        c = '\b';
  1013d6:	c7 45 f8 08 00 00 00 	movl   $0x8,-0x8(%ebp)
    }
    return c;
  1013dd:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  1013e0:	83 c4 14             	add    $0x14,%esp
  1013e3:	5b                   	pop    %ebx
  1013e4:	5d                   	pop    %ebp
  1013e5:	c3                   	ret    

001013e6 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  1013e6:	55                   	push   %ebp
  1013e7:	89 e5                	mov    %esp,%ebp
  1013e9:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  1013ec:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1013f1:	85 c0                	test   %eax,%eax
  1013f3:	74 0c                	je     101401 <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  1013f5:	c7 04 24 7a 13 10 00 	movl   $0x10137a,(%esp)
  1013fc:	e8 2f ff ff ff       	call   101330 <cons_intr>
    }
}
  101401:	c9                   	leave  
  101402:	c3                   	ret    

00101403 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  101403:	55                   	push   %ebp
  101404:	89 e5                	mov    %esp,%ebp
  101406:	53                   	push   %ebx
  101407:	83 ec 44             	sub    $0x44,%esp
  10140a:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101410:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  101414:	66 89 55 d6          	mov    %dx,-0x2a(%ebp)
  101418:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  10141c:	ec                   	in     (%dx),%al
  10141d:	89 c3                	mov    %eax,%ebx
  10141f:	88 5d ef             	mov    %bl,-0x11(%ebp)
    return data;
  101422:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  101426:	0f b6 c0             	movzbl %al,%eax
  101429:	83 e0 01             	and    $0x1,%eax
  10142c:	85 c0                	test   %eax,%eax
  10142e:	75 0a                	jne    10143a <kbd_proc_data+0x37>
        return -1;
  101430:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101435:	e9 61 01 00 00       	jmp    10159b <kbd_proc_data+0x198>
  10143a:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101440:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  101444:	66 89 55 d6          	mov    %dx,-0x2a(%ebp)
  101448:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  10144c:	ec                   	in     (%dx),%al
  10144d:	89 c3                	mov    %eax,%ebx
  10144f:	88 5d eb             	mov    %bl,-0x15(%ebp)
    return data;
  101452:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  101456:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  101459:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  10145d:	75 17                	jne    101476 <kbd_proc_data+0x73>
        // E0 escape character
        shift |= E0ESC;
  10145f:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101464:	83 c8 40             	or     $0x40,%eax
  101467:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  10146c:	b8 00 00 00 00       	mov    $0x0,%eax
  101471:	e9 25 01 00 00       	jmp    10159b <kbd_proc_data+0x198>
    } else if (data & 0x80) {
  101476:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10147a:	84 c0                	test   %al,%al
  10147c:	79 47                	jns    1014c5 <kbd_proc_data+0xc2>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  10147e:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101483:	83 e0 40             	and    $0x40,%eax
  101486:	85 c0                	test   %eax,%eax
  101488:	75 09                	jne    101493 <kbd_proc_data+0x90>
  10148a:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10148e:	83 e0 7f             	and    $0x7f,%eax
  101491:	eb 04                	jmp    101497 <kbd_proc_data+0x94>
  101493:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101497:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  10149a:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10149e:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  1014a5:	83 c8 40             	or     $0x40,%eax
  1014a8:	0f b6 c0             	movzbl %al,%eax
  1014ab:	f7 d0                	not    %eax
  1014ad:	89 c2                	mov    %eax,%edx
  1014af:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014b4:	21 d0                	and    %edx,%eax
  1014b6:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  1014bb:	b8 00 00 00 00       	mov    $0x0,%eax
  1014c0:	e9 d6 00 00 00       	jmp    10159b <kbd_proc_data+0x198>
    } else if (shift & E0ESC) {
  1014c5:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014ca:	83 e0 40             	and    $0x40,%eax
  1014cd:	85 c0                	test   %eax,%eax
  1014cf:	74 11                	je     1014e2 <kbd_proc_data+0xdf>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  1014d1:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  1014d5:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014da:	83 e0 bf             	and    $0xffffffbf,%eax
  1014dd:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  1014e2:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014e6:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  1014ed:	0f b6 d0             	movzbl %al,%edx
  1014f0:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014f5:	09 d0                	or     %edx,%eax
  1014f7:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  1014fc:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101500:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  101507:	0f b6 d0             	movzbl %al,%edx
  10150a:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10150f:	31 d0                	xor    %edx,%eax
  101511:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  101516:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10151b:	83 e0 03             	and    $0x3,%eax
  10151e:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  101525:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101529:	01 d0                	add    %edx,%eax
  10152b:	0f b6 00             	movzbl (%eax),%eax
  10152e:	0f b6 c0             	movzbl %al,%eax
  101531:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  101534:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101539:	83 e0 08             	and    $0x8,%eax
  10153c:	85 c0                	test   %eax,%eax
  10153e:	74 22                	je     101562 <kbd_proc_data+0x15f>
        if ('a' <= c && c <= 'z')
  101540:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  101544:	7e 0c                	jle    101552 <kbd_proc_data+0x14f>
  101546:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  10154a:	7f 06                	jg     101552 <kbd_proc_data+0x14f>
            c += 'A' - 'a';
  10154c:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  101550:	eb 10                	jmp    101562 <kbd_proc_data+0x15f>
        else if ('A' <= c && c <= 'Z')
  101552:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  101556:	7e 0a                	jle    101562 <kbd_proc_data+0x15f>
  101558:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  10155c:	7f 04                	jg     101562 <kbd_proc_data+0x15f>
            c += 'a' - 'A';
  10155e:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  101562:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101567:	f7 d0                	not    %eax
  101569:	83 e0 06             	and    $0x6,%eax
  10156c:	85 c0                	test   %eax,%eax
  10156e:	75 28                	jne    101598 <kbd_proc_data+0x195>
  101570:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  101577:	75 1f                	jne    101598 <kbd_proc_data+0x195>
        cprintf("Rebooting!\n");
  101579:	c7 04 24 b1 39 10 00 	movl   $0x1039b1,(%esp)
  101580:	e8 9e ed ff ff       	call   100323 <cprintf>
  101585:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  10158b:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10158f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  101593:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  101597:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101598:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10159b:	83 c4 44             	add    $0x44,%esp
  10159e:	5b                   	pop    %ebx
  10159f:	5d                   	pop    %ebp
  1015a0:	c3                   	ret    

001015a1 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  1015a1:	55                   	push   %ebp
  1015a2:	89 e5                	mov    %esp,%ebp
  1015a4:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  1015a7:	c7 04 24 03 14 10 00 	movl   $0x101403,(%esp)
  1015ae:	e8 7d fd ff ff       	call   101330 <cons_intr>
}
  1015b3:	c9                   	leave  
  1015b4:	c3                   	ret    

001015b5 <kbd_init>:

static void
kbd_init(void) {
  1015b5:	55                   	push   %ebp
  1015b6:	89 e5                	mov    %esp,%ebp
  1015b8:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  1015bb:	e8 e1 ff ff ff       	call   1015a1 <kbd_intr>
    pic_enable(IRQ_KBD);
  1015c0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1015c7:	e8 18 01 00 00       	call   1016e4 <pic_enable>
}
  1015cc:	c9                   	leave  
  1015cd:	c3                   	ret    

001015ce <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  1015ce:	55                   	push   %ebp
  1015cf:	89 e5                	mov    %esp,%ebp
  1015d1:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  1015d4:	e8 18 f8 ff ff       	call   100df1 <cga_init>
    serial_init();
  1015d9:	e8 0e f9 ff ff       	call   100eec <serial_init>
    kbd_init();
  1015de:	e8 d2 ff ff ff       	call   1015b5 <kbd_init>
    if (!serial_exists) {
  1015e3:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1015e8:	85 c0                	test   %eax,%eax
  1015ea:	75 0c                	jne    1015f8 <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  1015ec:	c7 04 24 bd 39 10 00 	movl   $0x1039bd,(%esp)
  1015f3:	e8 2b ed ff ff       	call   100323 <cprintf>
    }
}
  1015f8:	c9                   	leave  
  1015f9:	c3                   	ret    

001015fa <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  1015fa:	55                   	push   %ebp
  1015fb:	89 e5                	mov    %esp,%ebp
  1015fd:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  101600:	8b 45 08             	mov    0x8(%ebp),%eax
  101603:	89 04 24             	mov    %eax,(%esp)
  101606:	e8 67 fa ff ff       	call   101072 <lpt_putc>
    cga_putc(c);
  10160b:	8b 45 08             	mov    0x8(%ebp),%eax
  10160e:	89 04 24             	mov    %eax,(%esp)
  101611:	e8 9b fa ff ff       	call   1010b1 <cga_putc>
    serial_putc(c);
  101616:	8b 45 08             	mov    0x8(%ebp),%eax
  101619:	89 04 24             	mov    %eax,(%esp)
  10161c:	e8 d0 fc ff ff       	call   1012f1 <serial_putc>
}
  101621:	c9                   	leave  
  101622:	c3                   	ret    

00101623 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  101623:	55                   	push   %ebp
  101624:	89 e5                	mov    %esp,%ebp
  101626:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  101629:	e8 b8 fd ff ff       	call   1013e6 <serial_intr>
    kbd_intr();
  10162e:	e8 6e ff ff ff       	call   1015a1 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  101633:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  101639:	a1 84 f0 10 00       	mov    0x10f084,%eax
  10163e:	39 c2                	cmp    %eax,%edx
  101640:	74 35                	je     101677 <cons_getc+0x54>
        c = cons.buf[cons.rpos ++];
  101642:	a1 80 f0 10 00       	mov    0x10f080,%eax
  101647:	0f b6 90 80 ee 10 00 	movzbl 0x10ee80(%eax),%edx
  10164e:	0f b6 d2             	movzbl %dl,%edx
  101651:	89 55 f4             	mov    %edx,-0xc(%ebp)
  101654:	83 c0 01             	add    $0x1,%eax
  101657:	a3 80 f0 10 00       	mov    %eax,0x10f080
        if (cons.rpos == CONSBUFSIZE) {
  10165c:	a1 80 f0 10 00       	mov    0x10f080,%eax
  101661:	3d 00 02 00 00       	cmp    $0x200,%eax
  101666:	75 0a                	jne    101672 <cons_getc+0x4f>
            cons.rpos = 0;
  101668:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  10166f:	00 00 00 
        }
        return c;
  101672:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101675:	eb 05                	jmp    10167c <cons_getc+0x59>
    }
    return 0;
  101677:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10167c:	c9                   	leave  
  10167d:	c3                   	ret    
	...

00101680 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  101680:	55                   	push   %ebp
  101681:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  101683:	fb                   	sti    
    sti();
}
  101684:	5d                   	pop    %ebp
  101685:	c3                   	ret    

00101686 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  101686:	55                   	push   %ebp
  101687:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  101689:	fa                   	cli    
    cli();
}
  10168a:	5d                   	pop    %ebp
  10168b:	c3                   	ret    

0010168c <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  10168c:	55                   	push   %ebp
  10168d:	89 e5                	mov    %esp,%ebp
  10168f:	83 ec 14             	sub    $0x14,%esp
  101692:	8b 45 08             	mov    0x8(%ebp),%eax
  101695:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101699:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10169d:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  1016a3:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  1016a8:	85 c0                	test   %eax,%eax
  1016aa:	74 36                	je     1016e2 <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  1016ac:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1016b0:	0f b6 c0             	movzbl %al,%eax
  1016b3:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  1016b9:	88 45 fd             	mov    %al,-0x3(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1016bc:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1016c0:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1016c4:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  1016c5:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1016c9:	66 c1 e8 08          	shr    $0x8,%ax
  1016cd:	0f b6 c0             	movzbl %al,%eax
  1016d0:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  1016d6:	88 45 f9             	mov    %al,-0x7(%ebp)
  1016d9:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1016dd:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1016e1:	ee                   	out    %al,(%dx)
    }
}
  1016e2:	c9                   	leave  
  1016e3:	c3                   	ret    

001016e4 <pic_enable>:

void
pic_enable(unsigned int irq) {
  1016e4:	55                   	push   %ebp
  1016e5:	89 e5                	mov    %esp,%ebp
  1016e7:	53                   	push   %ebx
  1016e8:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  1016eb:	8b 45 08             	mov    0x8(%ebp),%eax
  1016ee:	ba 01 00 00 00       	mov    $0x1,%edx
  1016f3:	89 d3                	mov    %edx,%ebx
  1016f5:	89 c1                	mov    %eax,%ecx
  1016f7:	d3 e3                	shl    %cl,%ebx
  1016f9:	89 d8                	mov    %ebx,%eax
  1016fb:	89 c2                	mov    %eax,%edx
  1016fd:	f7 d2                	not    %edx
  1016ff:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  101706:	21 d0                	and    %edx,%eax
  101708:	0f b7 c0             	movzwl %ax,%eax
  10170b:	89 04 24             	mov    %eax,(%esp)
  10170e:	e8 79 ff ff ff       	call   10168c <pic_setmask>
}
  101713:	83 c4 04             	add    $0x4,%esp
  101716:	5b                   	pop    %ebx
  101717:	5d                   	pop    %ebp
  101718:	c3                   	ret    

00101719 <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  101719:	55                   	push   %ebp
  10171a:	89 e5                	mov    %esp,%ebp
  10171c:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  10171f:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  101726:	00 00 00 
  101729:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  10172f:	c6 45 fd ff          	movb   $0xff,-0x3(%ebp)
  101733:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101737:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10173b:	ee                   	out    %al,(%dx)
  10173c:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  101742:	c6 45 f9 ff          	movb   $0xff,-0x7(%ebp)
  101746:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10174a:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10174e:	ee                   	out    %al,(%dx)
  10174f:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  101755:	c6 45 f5 11          	movb   $0x11,-0xb(%ebp)
  101759:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10175d:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101761:	ee                   	out    %al,(%dx)
  101762:	66 c7 45 f2 21 00    	movw   $0x21,-0xe(%ebp)
  101768:	c6 45 f1 20          	movb   $0x20,-0xf(%ebp)
  10176c:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101770:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101774:	ee                   	out    %al,(%dx)
  101775:	66 c7 45 ee 21 00    	movw   $0x21,-0x12(%ebp)
  10177b:	c6 45 ed 04          	movb   $0x4,-0x13(%ebp)
  10177f:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101783:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101787:	ee                   	out    %al,(%dx)
  101788:	66 c7 45 ea 21 00    	movw   $0x21,-0x16(%ebp)
  10178e:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
  101792:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101796:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10179a:	ee                   	out    %al,(%dx)
  10179b:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  1017a1:	c6 45 e5 11          	movb   $0x11,-0x1b(%ebp)
  1017a5:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  1017a9:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1017ad:	ee                   	out    %al,(%dx)
  1017ae:	66 c7 45 e2 a1 00    	movw   $0xa1,-0x1e(%ebp)
  1017b4:	c6 45 e1 28          	movb   $0x28,-0x1f(%ebp)
  1017b8:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  1017bc:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  1017c0:	ee                   	out    %al,(%dx)
  1017c1:	66 c7 45 de a1 00    	movw   $0xa1,-0x22(%ebp)
  1017c7:	c6 45 dd 02          	movb   $0x2,-0x23(%ebp)
  1017cb:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  1017cf:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  1017d3:	ee                   	out    %al,(%dx)
  1017d4:	66 c7 45 da a1 00    	movw   $0xa1,-0x26(%ebp)
  1017da:	c6 45 d9 03          	movb   $0x3,-0x27(%ebp)
  1017de:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  1017e2:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  1017e6:	ee                   	out    %al,(%dx)
  1017e7:	66 c7 45 d6 20 00    	movw   $0x20,-0x2a(%ebp)
  1017ed:	c6 45 d5 68          	movb   $0x68,-0x2b(%ebp)
  1017f1:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  1017f5:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  1017f9:	ee                   	out    %al,(%dx)
  1017fa:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  101800:	c6 45 d1 0a          	movb   $0xa,-0x2f(%ebp)
  101804:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  101808:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  10180c:	ee                   	out    %al,(%dx)
  10180d:	66 c7 45 ce a0 00    	movw   $0xa0,-0x32(%ebp)
  101813:	c6 45 cd 68          	movb   $0x68,-0x33(%ebp)
  101817:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  10181b:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  10181f:	ee                   	out    %al,(%dx)
  101820:	66 c7 45 ca a0 00    	movw   $0xa0,-0x36(%ebp)
  101826:	c6 45 c9 0a          	movb   $0xa,-0x37(%ebp)
  10182a:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  10182e:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  101832:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  101833:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  10183a:	66 83 f8 ff          	cmp    $0xffff,%ax
  10183e:	74 12                	je     101852 <pic_init+0x139>
        pic_setmask(irq_mask);
  101840:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  101847:	0f b7 c0             	movzwl %ax,%eax
  10184a:	89 04 24             	mov    %eax,(%esp)
  10184d:	e8 3a fe ff ff       	call   10168c <pic_setmask>
    }
}
  101852:	c9                   	leave  
  101853:	c3                   	ret    

00101854 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  101854:	55                   	push   %ebp
  101855:	89 e5                	mov    %esp,%ebp
  101857:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  10185a:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  101861:	00 
  101862:	c7 04 24 e0 39 10 00 	movl   $0x1039e0,(%esp)
  101869:	e8 b5 ea ff ff       	call   100323 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  10186e:	c9                   	leave  
  10186f:	c3                   	ret    

00101870 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101870:	55                   	push   %ebp
  101871:	89 e5                	mov    %esp,%ebp
  101873:	83 ec 10             	sub    $0x10,%esp
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
      extern uintptr_t __vectors[];
      int i;
    for (i = 0; i < 256; i ++) {
  101876:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10187d:	e9 97 01 00 00       	jmp    101a19 <idt_init+0x1a9>
        if(i==0x80||i==0x79){
  101882:	81 7d fc 80 00 00 00 	cmpl   $0x80,-0x4(%ebp)
  101889:	74 0a                	je     101895 <idt_init+0x25>
  10188b:	83 7d fc 79          	cmpl   $0x79,-0x4(%ebp)
  10188f:	0f 85 c1 00 00 00    	jne    101956 <idt_init+0xe6>
          SETGATE(idt[i], 1, KERNEL_CS, __vectors[i], DPL_USER);}
  101895:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101898:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  10189f:	89 c2                	mov    %eax,%edx
  1018a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018a4:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  1018ab:	00 
  1018ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018af:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  1018b6:	00 08 00 
  1018b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018bc:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  1018c3:	00 
  1018c4:	83 e2 e0             	and    $0xffffffe0,%edx
  1018c7:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  1018ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018d1:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  1018d8:	00 
  1018d9:	83 e2 1f             	and    $0x1f,%edx
  1018dc:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  1018e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018e6:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018ed:	00 
  1018ee:	83 ca 0f             	or     $0xf,%edx
  1018f1:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018fb:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101902:	00 
  101903:	83 e2 ef             	and    $0xffffffef,%edx
  101906:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  10190d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101910:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101917:	00 
  101918:	83 ca 60             	or     $0x60,%edx
  10191b:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101922:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101925:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  10192c:	00 
  10192d:	83 ca 80             	or     $0xffffff80,%edx
  101930:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101937:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10193a:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  101941:	c1 e8 10             	shr    $0x10,%eax
  101944:	89 c2                	mov    %eax,%edx
  101946:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101949:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  101950:	00 
  101951:	e9 bf 00 00 00       	jmp    101a15 <idt_init+0x1a5>
        else{
          SETGATE(idt[i], 0, KERNEL_CS, __vectors[i], DPL_KERNEL);}
  101956:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101959:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  101960:	89 c2                	mov    %eax,%edx
  101962:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101965:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  10196c:	00 
  10196d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101970:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  101977:	00 08 00 
  10197a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10197d:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101984:	00 
  101985:	83 e2 e0             	and    $0xffffffe0,%edx
  101988:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  10198f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101992:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101999:	00 
  10199a:	83 e2 1f             	and    $0x1f,%edx
  10199d:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  1019a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019a7:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1019ae:	00 
  1019af:	83 e2 f0             	and    $0xfffffff0,%edx
  1019b2:	83 ca 0e             	or     $0xe,%edx
  1019b5:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1019bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019bf:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1019c6:	00 
  1019c7:	83 e2 ef             	and    $0xffffffef,%edx
  1019ca:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1019d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019d4:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1019db:	00 
  1019dc:	83 e2 9f             	and    $0xffffff9f,%edx
  1019df:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1019e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019e9:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1019f0:	00 
  1019f1:	83 ca 80             	or     $0xffffff80,%edx
  1019f4:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1019fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019fe:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  101a05:	c1 e8 10             	shr    $0x10,%eax
  101a08:	89 c2                	mov    %eax,%edx
  101a0a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101a0d:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  101a14:	00 
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
      extern uintptr_t __vectors[];
      int i;
    for (i = 0; i < 256; i ++) {
  101a15:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101a19:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  101a20:	0f 8e 5c fe ff ff    	jle    101882 <idt_init+0x12>
  101a26:	c7 45 f8 60 e5 10 00 	movl   $0x10e560,-0x8(%ebp)
    return ebp;
}

static inline void
lidt(struct pseudodesc *pd) {
    asm volatile ("lidt (%0)" :: "r" (pd));
  101a2d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101a30:	0f 01 18             	lidtl  (%eax)
          SETGATE(idt[i], 1, KERNEL_CS, __vectors[i], DPL_USER);}
        else{
          SETGATE(idt[i], 0, KERNEL_CS, __vectors[i], DPL_KERNEL);}
    }
    lidt(&idt_pd);
}
  101a33:	c9                   	leave  
  101a34:	c3                   	ret    

00101a35 <trapname>:

static const char *
trapname(int trapno) {
  101a35:	55                   	push   %ebp
  101a36:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101a38:	8b 45 08             	mov    0x8(%ebp),%eax
  101a3b:	83 f8 13             	cmp    $0x13,%eax
  101a3e:	77 0c                	ja     101a4c <trapname+0x17>
        return excnames[trapno];
  101a40:	8b 45 08             	mov    0x8(%ebp),%eax
  101a43:	8b 04 85 40 3d 10 00 	mov    0x103d40(,%eax,4),%eax
  101a4a:	eb 18                	jmp    101a64 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101a4c:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101a50:	7e 0d                	jle    101a5f <trapname+0x2a>
  101a52:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101a56:	7f 07                	jg     101a5f <trapname+0x2a>
        return "Hardware Interrupt";
  101a58:	b8 ea 39 10 00       	mov    $0x1039ea,%eax
  101a5d:	eb 05                	jmp    101a64 <trapname+0x2f>
    }
    return "(unknown trap)";
  101a5f:	b8 fd 39 10 00       	mov    $0x1039fd,%eax
}
  101a64:	5d                   	pop    %ebp
  101a65:	c3                   	ret    

00101a66 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101a66:	55                   	push   %ebp
  101a67:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101a69:	8b 45 08             	mov    0x8(%ebp),%eax
  101a6c:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101a70:	66 83 f8 08          	cmp    $0x8,%ax
  101a74:	0f 94 c0             	sete   %al
  101a77:	0f b6 c0             	movzbl %al,%eax
}
  101a7a:	5d                   	pop    %ebp
  101a7b:	c3                   	ret    

00101a7c <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101a7c:	55                   	push   %ebp
  101a7d:	89 e5                	mov    %esp,%ebp
  101a7f:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  101a82:	8b 45 08             	mov    0x8(%ebp),%eax
  101a85:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a89:	c7 04 24 3e 3a 10 00 	movl   $0x103a3e,(%esp)
  101a90:	e8 8e e8 ff ff       	call   100323 <cprintf>
    print_regs(&tf->tf_regs);
  101a95:	8b 45 08             	mov    0x8(%ebp),%eax
  101a98:	89 04 24             	mov    %eax,(%esp)
  101a9b:	e8 a1 01 00 00       	call   101c41 <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101aa0:	8b 45 08             	mov    0x8(%ebp),%eax
  101aa3:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101aa7:	0f b7 c0             	movzwl %ax,%eax
  101aaa:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aae:	c7 04 24 4f 3a 10 00 	movl   $0x103a4f,(%esp)
  101ab5:	e8 69 e8 ff ff       	call   100323 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101aba:	8b 45 08             	mov    0x8(%ebp),%eax
  101abd:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101ac1:	0f b7 c0             	movzwl %ax,%eax
  101ac4:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ac8:	c7 04 24 62 3a 10 00 	movl   $0x103a62,(%esp)
  101acf:	e8 4f e8 ff ff       	call   100323 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101ad4:	8b 45 08             	mov    0x8(%ebp),%eax
  101ad7:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101adb:	0f b7 c0             	movzwl %ax,%eax
  101ade:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ae2:	c7 04 24 75 3a 10 00 	movl   $0x103a75,(%esp)
  101ae9:	e8 35 e8 ff ff       	call   100323 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101aee:	8b 45 08             	mov    0x8(%ebp),%eax
  101af1:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101af5:	0f b7 c0             	movzwl %ax,%eax
  101af8:	89 44 24 04          	mov    %eax,0x4(%esp)
  101afc:	c7 04 24 88 3a 10 00 	movl   $0x103a88,(%esp)
  101b03:	e8 1b e8 ff ff       	call   100323 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101b08:	8b 45 08             	mov    0x8(%ebp),%eax
  101b0b:	8b 40 30             	mov    0x30(%eax),%eax
  101b0e:	89 04 24             	mov    %eax,(%esp)
  101b11:	e8 1f ff ff ff       	call   101a35 <trapname>
  101b16:	8b 55 08             	mov    0x8(%ebp),%edx
  101b19:	8b 52 30             	mov    0x30(%edx),%edx
  101b1c:	89 44 24 08          	mov    %eax,0x8(%esp)
  101b20:	89 54 24 04          	mov    %edx,0x4(%esp)
  101b24:	c7 04 24 9b 3a 10 00 	movl   $0x103a9b,(%esp)
  101b2b:	e8 f3 e7 ff ff       	call   100323 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101b30:	8b 45 08             	mov    0x8(%ebp),%eax
  101b33:	8b 40 34             	mov    0x34(%eax),%eax
  101b36:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b3a:	c7 04 24 ad 3a 10 00 	movl   $0x103aad,(%esp)
  101b41:	e8 dd e7 ff ff       	call   100323 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101b46:	8b 45 08             	mov    0x8(%ebp),%eax
  101b49:	8b 40 38             	mov    0x38(%eax),%eax
  101b4c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b50:	c7 04 24 bc 3a 10 00 	movl   $0x103abc,(%esp)
  101b57:	e8 c7 e7 ff ff       	call   100323 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101b5c:	8b 45 08             	mov    0x8(%ebp),%eax
  101b5f:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101b63:	0f b7 c0             	movzwl %ax,%eax
  101b66:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b6a:	c7 04 24 cb 3a 10 00 	movl   $0x103acb,(%esp)
  101b71:	e8 ad e7 ff ff       	call   100323 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101b76:	8b 45 08             	mov    0x8(%ebp),%eax
  101b79:	8b 40 40             	mov    0x40(%eax),%eax
  101b7c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b80:	c7 04 24 de 3a 10 00 	movl   $0x103ade,(%esp)
  101b87:	e8 97 e7 ff ff       	call   100323 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b8c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101b93:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101b9a:	eb 3e                	jmp    101bda <print_trapframe+0x15e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101b9c:	8b 45 08             	mov    0x8(%ebp),%eax
  101b9f:	8b 50 40             	mov    0x40(%eax),%edx
  101ba2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101ba5:	21 d0                	and    %edx,%eax
  101ba7:	85 c0                	test   %eax,%eax
  101ba9:	74 28                	je     101bd3 <print_trapframe+0x157>
  101bab:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101bae:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101bb5:	85 c0                	test   %eax,%eax
  101bb7:	74 1a                	je     101bd3 <print_trapframe+0x157>
            cprintf("%s,", IA32flags[i]);
  101bb9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101bbc:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101bc3:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bc7:	c7 04 24 ed 3a 10 00 	movl   $0x103aed,(%esp)
  101bce:	e8 50 e7 ff ff       	call   100323 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101bd3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101bd7:	d1 65 f0             	shll   -0x10(%ebp)
  101bda:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101bdd:	83 f8 17             	cmp    $0x17,%eax
  101be0:	76 ba                	jbe    101b9c <print_trapframe+0x120>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101be2:	8b 45 08             	mov    0x8(%ebp),%eax
  101be5:	8b 40 40             	mov    0x40(%eax),%eax
  101be8:	25 00 30 00 00       	and    $0x3000,%eax
  101bed:	c1 e8 0c             	shr    $0xc,%eax
  101bf0:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bf4:	c7 04 24 f1 3a 10 00 	movl   $0x103af1,(%esp)
  101bfb:	e8 23 e7 ff ff       	call   100323 <cprintf>

    if (!trap_in_kernel(tf)) {
  101c00:	8b 45 08             	mov    0x8(%ebp),%eax
  101c03:	89 04 24             	mov    %eax,(%esp)
  101c06:	e8 5b fe ff ff       	call   101a66 <trap_in_kernel>
  101c0b:	85 c0                	test   %eax,%eax
  101c0d:	75 30                	jne    101c3f <print_trapframe+0x1c3>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101c0f:	8b 45 08             	mov    0x8(%ebp),%eax
  101c12:	8b 40 44             	mov    0x44(%eax),%eax
  101c15:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c19:	c7 04 24 fa 3a 10 00 	movl   $0x103afa,(%esp)
  101c20:	e8 fe e6 ff ff       	call   100323 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101c25:	8b 45 08             	mov    0x8(%ebp),%eax
  101c28:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101c2c:	0f b7 c0             	movzwl %ax,%eax
  101c2f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c33:	c7 04 24 09 3b 10 00 	movl   $0x103b09,(%esp)
  101c3a:	e8 e4 e6 ff ff       	call   100323 <cprintf>
    }
}
  101c3f:	c9                   	leave  
  101c40:	c3                   	ret    

00101c41 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101c41:	55                   	push   %ebp
  101c42:	89 e5                	mov    %esp,%ebp
  101c44:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101c47:	8b 45 08             	mov    0x8(%ebp),%eax
  101c4a:	8b 00                	mov    (%eax),%eax
  101c4c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c50:	c7 04 24 1c 3b 10 00 	movl   $0x103b1c,(%esp)
  101c57:	e8 c7 e6 ff ff       	call   100323 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101c5c:	8b 45 08             	mov    0x8(%ebp),%eax
  101c5f:	8b 40 04             	mov    0x4(%eax),%eax
  101c62:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c66:	c7 04 24 2b 3b 10 00 	movl   $0x103b2b,(%esp)
  101c6d:	e8 b1 e6 ff ff       	call   100323 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101c72:	8b 45 08             	mov    0x8(%ebp),%eax
  101c75:	8b 40 08             	mov    0x8(%eax),%eax
  101c78:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c7c:	c7 04 24 3a 3b 10 00 	movl   $0x103b3a,(%esp)
  101c83:	e8 9b e6 ff ff       	call   100323 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101c88:	8b 45 08             	mov    0x8(%ebp),%eax
  101c8b:	8b 40 0c             	mov    0xc(%eax),%eax
  101c8e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c92:	c7 04 24 49 3b 10 00 	movl   $0x103b49,(%esp)
  101c99:	e8 85 e6 ff ff       	call   100323 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101c9e:	8b 45 08             	mov    0x8(%ebp),%eax
  101ca1:	8b 40 10             	mov    0x10(%eax),%eax
  101ca4:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ca8:	c7 04 24 58 3b 10 00 	movl   $0x103b58,(%esp)
  101caf:	e8 6f e6 ff ff       	call   100323 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101cb4:	8b 45 08             	mov    0x8(%ebp),%eax
  101cb7:	8b 40 14             	mov    0x14(%eax),%eax
  101cba:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cbe:	c7 04 24 67 3b 10 00 	movl   $0x103b67,(%esp)
  101cc5:	e8 59 e6 ff ff       	call   100323 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101cca:	8b 45 08             	mov    0x8(%ebp),%eax
  101ccd:	8b 40 18             	mov    0x18(%eax),%eax
  101cd0:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cd4:	c7 04 24 76 3b 10 00 	movl   $0x103b76,(%esp)
  101cdb:	e8 43 e6 ff ff       	call   100323 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101ce0:	8b 45 08             	mov    0x8(%ebp),%eax
  101ce3:	8b 40 1c             	mov    0x1c(%eax),%eax
  101ce6:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cea:	c7 04 24 85 3b 10 00 	movl   $0x103b85,(%esp)
  101cf1:	e8 2d e6 ff ff       	call   100323 <cprintf>
}
  101cf6:	c9                   	leave  
  101cf7:	c3                   	ret    

00101cf8 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101cf8:	55                   	push   %ebp
  101cf9:	89 e5                	mov    %esp,%ebp
  101cfb:	57                   	push   %edi
  101cfc:	56                   	push   %esi
  101cfd:	53                   	push   %ebx
  101cfe:	83 ec 7c             	sub    $0x7c,%esp
    char c,u;
    struct trapframe utk,*ktu;

    switch (tf->tf_trapno) {
  101d01:	8b 45 08             	mov    0x8(%ebp),%eax
  101d04:	8b 40 30             	mov    0x30(%eax),%eax
  101d07:	83 f8 2f             	cmp    $0x2f,%eax
  101d0a:	77 21                	ja     101d2d <trap_dispatch+0x35>
  101d0c:	83 f8 2e             	cmp    $0x2e,%eax
  101d0f:	0f 83 a3 01 00 00    	jae    101eb8 <trap_dispatch+0x1c0>
  101d15:	83 f8 21             	cmp    $0x21,%eax
  101d18:	0f 84 8b 00 00 00    	je     101da9 <trap_dispatch+0xb1>
  101d1e:	83 f8 24             	cmp    $0x24,%eax
  101d21:	74 5d                	je     101d80 <trap_dispatch+0x88>
  101d23:	83 f8 20             	cmp    $0x20,%eax
  101d26:	74 1c                	je     101d44 <trap_dispatch+0x4c>
  101d28:	e9 53 01 00 00       	jmp    101e80 <trap_dispatch+0x188>
  101d2d:	83 f8 78             	cmp    $0x78,%eax
  101d30:	0f 84 9c 00 00 00    	je     101dd2 <trap_dispatch+0xda>
  101d36:	83 f8 79             	cmp    $0x79,%eax
  101d39:	0f 84 e2 00 00 00    	je     101e21 <trap_dispatch+0x129>
  101d3f:	e9 3c 01 00 00       	jmp    101e80 <trap_dispatch+0x188>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        ticks=ticks+1;
  101d44:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101d49:	83 c0 01             	add    $0x1,%eax
  101d4c:	a3 08 f9 10 00       	mov    %eax,0x10f908
        if(ticks%100==0)
  101d51:	8b 0d 08 f9 10 00    	mov    0x10f908,%ecx
  101d57:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101d5c:	89 c8                	mov    %ecx,%eax
  101d5e:	f7 e2                	mul    %edx
  101d60:	89 d0                	mov    %edx,%eax
  101d62:	c1 e8 05             	shr    $0x5,%eax
  101d65:	6b c0 64             	imul   $0x64,%eax,%eax
  101d68:	89 ca                	mov    %ecx,%edx
  101d6a:	29 c2                	sub    %eax,%edx
  101d6c:	89 d0                	mov    %edx,%eax
  101d6e:	85 c0                	test   %eax,%eax
  101d70:	0f 85 45 01 00 00    	jne    101ebb <trap_dispatch+0x1c3>
        print_ticks();
  101d76:	e8 d9 fa ff ff       	call   101854 <print_ticks>
        break;
  101d7b:	e9 3b 01 00 00       	jmp    101ebb <trap_dispatch+0x1c3>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101d80:	e8 9e f8 ff ff       	call   101623 <cons_getc>
  101d85:	88 45 e7             	mov    %al,-0x19(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101d88:	0f be 55 e7          	movsbl -0x19(%ebp),%edx
  101d8c:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  101d90:	89 54 24 08          	mov    %edx,0x8(%esp)
  101d94:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d98:	c7 04 24 94 3b 10 00 	movl   $0x103b94,(%esp)
  101d9f:	e8 7f e5 ff ff       	call   100323 <cprintf>
        break;
  101da4:	e9 13 01 00 00       	jmp    101ebc <trap_dispatch+0x1c4>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101da9:	e8 75 f8 ff ff       	call   101623 <cons_getc>
  101dae:	88 45 e7             	mov    %al,-0x19(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101db1:	0f be 55 e7          	movsbl -0x19(%ebp),%edx
  101db5:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  101db9:	89 54 24 08          	mov    %edx,0x8(%esp)
  101dbd:	89 44 24 04          	mov    %eax,0x4(%esp)
  101dc1:	c7 04 24 a6 3b 10 00 	movl   $0x103ba6,(%esp)
  101dc8:	e8 56 e5 ff ff       	call   100323 <cprintf>
        break;
  101dcd:	e9 ea 00 00 00       	jmp    101ebc <trap_dispatch+0x1c4>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
        utk=*tf;
  101dd2:	8b 45 08             	mov    0x8(%ebp),%eax
  101dd5:	8d 55 94             	lea    -0x6c(%ebp),%edx
  101dd8:	89 c3                	mov    %eax,%ebx
  101dda:	b8 13 00 00 00       	mov    $0x13,%eax
  101ddf:	89 d7                	mov    %edx,%edi
  101de1:	89 de                	mov    %ebx,%esi
  101de3:	89 c1                	mov    %eax,%ecx
  101de5:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
        utk.tf_cs=USER_CS;
  101de7:	66 c7 45 d0 1b 00    	movw   $0x1b,-0x30(%ebp)
        utk.tf_ds=USER_DS;
  101ded:	66 c7 45 c0 23 00    	movw   $0x23,-0x40(%ebp)
        utk.tf_es=USER_DS;
  101df3:	66 c7 45 bc 23 00    	movw   $0x23,-0x44(%ebp)
        utk.tf_ss=USER_DS;
  101df9:	66 c7 45 dc 23 00    	movw   $0x23,-0x24(%ebp)
        utk.tf_eflags|=(3<<12);
  101dff:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101e02:	80 cc 30             	or     $0x30,%ah
  101e05:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        
        utk.tf_esp=(int)tf+sizeof(*tf)-8;
  101e08:	8b 45 08             	mov    0x8(%ebp),%eax
  101e0b:	83 c0 44             	add    $0x44,%eax
  101e0e:	89 45 d8             	mov    %eax,-0x28(%ebp)
        *((int*)tf-1)=&utk;
  101e11:	8b 45 08             	mov    0x8(%ebp),%eax
  101e14:	8d 50 fc             	lea    -0x4(%eax),%edx
  101e17:	8d 45 94             	lea    -0x6c(%ebp),%eax
  101e1a:	89 02                	mov    %eax,(%edx)
        
        break;
  101e1c:	e9 9b 00 00 00       	jmp    101ebc <trap_dispatch+0x1c4>
    case T_SWITCH_TOK:
        tf->tf_cs=KERNEL_CS;
  101e21:	8b 45 08             	mov    0x8(%ebp),%eax
  101e24:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
        tf->tf_ds=KERNEL_DS;
  101e2a:	8b 45 08             	mov    0x8(%ebp),%eax
  101e2d:	66 c7 40 2c 10 00    	movw   $0x10,0x2c(%eax)
        tf->tf_es=KERNEL_DS;
  101e33:	8b 45 08             	mov    0x8(%ebp),%eax
  101e36:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
        tf->tf_eflags&=~(3<<12);
  101e3c:	8b 45 08             	mov    0x8(%ebp),%eax
  101e3f:	8b 40 40             	mov    0x40(%eax),%eax
  101e42:	89 c2                	mov    %eax,%edx
  101e44:	80 e6 cf             	and    $0xcf,%dh
  101e47:	8b 45 08             	mov    0x8(%ebp),%eax
  101e4a:	89 50 40             	mov    %edx,0x40(%eax)
        ktu=(struct trapframe *)(tf->tf_esp-(sizeof(struct trapframe)-8));
  101e4d:	8b 45 08             	mov    0x8(%ebp),%eax
  101e50:	8b 40 44             	mov    0x44(%eax),%eax
  101e53:	83 e8 44             	sub    $0x44,%eax
  101e56:	89 45 e0             	mov    %eax,-0x20(%ebp)
        //ktu.tf_esp=(int)tf+sizeof(*tf)-8;
        memmove(ktu,tf,sizeof(struct trapframe)-8);
  101e59:	c7 44 24 08 44 00 00 	movl   $0x44,0x8(%esp)
  101e60:	00 
  101e61:	8b 45 08             	mov    0x8(%ebp),%eax
  101e64:	89 44 24 04          	mov    %eax,0x4(%esp)
  101e68:	8b 45 e0             	mov    -0x20(%ebp),%eax
  101e6b:	89 04 24             	mov    %eax,(%esp)
  101e6e:	e8 87 16 00 00       	call   1034fa <memmove>
        *((int*)tf-1)=ktu;
  101e73:	8b 45 08             	mov    0x8(%ebp),%eax
  101e76:	8d 50 fc             	lea    -0x4(%eax),%edx
  101e79:	8b 45 e0             	mov    -0x20(%ebp),%eax
  101e7c:	89 02                	mov    %eax,(%edx)
       
       
        //panic("T_SWITCH_** ??\n");
       
        break;
  101e7e:	eb 3c                	jmp    101ebc <trap_dispatch+0x1c4>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101e80:	8b 45 08             	mov    0x8(%ebp),%eax
  101e83:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e87:	0f b7 c0             	movzwl %ax,%eax
  101e8a:	83 e0 03             	and    $0x3,%eax
  101e8d:	85 c0                	test   %eax,%eax
  101e8f:	75 2b                	jne    101ebc <trap_dispatch+0x1c4>
            print_trapframe(tf);
  101e91:	8b 45 08             	mov    0x8(%ebp),%eax
  101e94:	89 04 24             	mov    %eax,(%esp)
  101e97:	e8 e0 fb ff ff       	call   101a7c <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101e9c:	c7 44 24 08 b5 3b 10 	movl   $0x103bb5,0x8(%esp)
  101ea3:	00 
  101ea4:	c7 44 24 04 cf 00 00 	movl   $0xcf,0x4(%esp)
  101eab:	00 
  101eac:	c7 04 24 d1 3b 10 00 	movl   $0x103bd1,(%esp)
  101eb3:	e8 a4 ed ff ff       	call   100c5c <__panic>
       
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101eb8:	90                   	nop
  101eb9:	eb 01                	jmp    101ebc <trap_dispatch+0x1c4>
         * (3) Too Simple? Yes, I think so!
         */
        ticks=ticks+1;
        if(ticks%100==0)
        print_ticks();
        break;
  101ebb:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101ebc:	83 c4 7c             	add    $0x7c,%esp
  101ebf:	5b                   	pop    %ebx
  101ec0:	5e                   	pop    %esi
  101ec1:	5f                   	pop    %edi
  101ec2:	5d                   	pop    %ebp
  101ec3:	c3                   	ret    

00101ec4 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101ec4:	55                   	push   %ebp
  101ec5:	89 e5                	mov    %esp,%ebp
  101ec7:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101eca:	8b 45 08             	mov    0x8(%ebp),%eax
  101ecd:	89 04 24             	mov    %eax,(%esp)
  101ed0:	e8 23 fe ff ff       	call   101cf8 <trap_dispatch>
}
  101ed5:	c9                   	leave  
  101ed6:	c3                   	ret    
	...

00101ed8 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  101ed8:	1e                   	push   %ds
    pushl %es
  101ed9:	06                   	push   %es
    pushl %fs
  101eda:	0f a0                	push   %fs
    pushl %gs
  101edc:	0f a8                	push   %gs
    pushal
  101ede:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  101edf:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  101ee4:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  101ee6:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  101ee8:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  101ee9:	e8 d6 ff ff ff       	call   101ec4 <trap>

    # pop the pushed stack pointer
    popl %esp
  101eee:	5c                   	pop    %esp

00101eef <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  101eef:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  101ef0:	0f a9                	pop    %gs
    popl %fs
  101ef2:	0f a1                	pop    %fs
    popl %es
  101ef4:	07                   	pop    %es
    popl %ds
  101ef5:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  101ef6:	83 c4 08             	add    $0x8,%esp
    iret
  101ef9:	cf                   	iret   
	...

00101efc <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101efc:	6a 00                	push   $0x0
  pushl $0
  101efe:	6a 00                	push   $0x0
  jmp __alltraps
  101f00:	e9 d3 ff ff ff       	jmp    101ed8 <__alltraps>

00101f05 <vector1>:
.globl vector1
vector1:
  pushl $0
  101f05:	6a 00                	push   $0x0
  pushl $1
  101f07:	6a 01                	push   $0x1
  jmp __alltraps
  101f09:	e9 ca ff ff ff       	jmp    101ed8 <__alltraps>

00101f0e <vector2>:
.globl vector2
vector2:
  pushl $0
  101f0e:	6a 00                	push   $0x0
  pushl $2
  101f10:	6a 02                	push   $0x2
  jmp __alltraps
  101f12:	e9 c1 ff ff ff       	jmp    101ed8 <__alltraps>

00101f17 <vector3>:
.globl vector3
vector3:
  pushl $0
  101f17:	6a 00                	push   $0x0
  pushl $3
  101f19:	6a 03                	push   $0x3
  jmp __alltraps
  101f1b:	e9 b8 ff ff ff       	jmp    101ed8 <__alltraps>

00101f20 <vector4>:
.globl vector4
vector4:
  pushl $0
  101f20:	6a 00                	push   $0x0
  pushl $4
  101f22:	6a 04                	push   $0x4
  jmp __alltraps
  101f24:	e9 af ff ff ff       	jmp    101ed8 <__alltraps>

00101f29 <vector5>:
.globl vector5
vector5:
  pushl $0
  101f29:	6a 00                	push   $0x0
  pushl $5
  101f2b:	6a 05                	push   $0x5
  jmp __alltraps
  101f2d:	e9 a6 ff ff ff       	jmp    101ed8 <__alltraps>

00101f32 <vector6>:
.globl vector6
vector6:
  pushl $0
  101f32:	6a 00                	push   $0x0
  pushl $6
  101f34:	6a 06                	push   $0x6
  jmp __alltraps
  101f36:	e9 9d ff ff ff       	jmp    101ed8 <__alltraps>

00101f3b <vector7>:
.globl vector7
vector7:
  pushl $0
  101f3b:	6a 00                	push   $0x0
  pushl $7
  101f3d:	6a 07                	push   $0x7
  jmp __alltraps
  101f3f:	e9 94 ff ff ff       	jmp    101ed8 <__alltraps>

00101f44 <vector8>:
.globl vector8
vector8:
  pushl $8
  101f44:	6a 08                	push   $0x8
  jmp __alltraps
  101f46:	e9 8d ff ff ff       	jmp    101ed8 <__alltraps>

00101f4b <vector9>:
.globl vector9
vector9:
  pushl $9
  101f4b:	6a 09                	push   $0x9
  jmp __alltraps
  101f4d:	e9 86 ff ff ff       	jmp    101ed8 <__alltraps>

00101f52 <vector10>:
.globl vector10
vector10:
  pushl $10
  101f52:	6a 0a                	push   $0xa
  jmp __alltraps
  101f54:	e9 7f ff ff ff       	jmp    101ed8 <__alltraps>

00101f59 <vector11>:
.globl vector11
vector11:
  pushl $11
  101f59:	6a 0b                	push   $0xb
  jmp __alltraps
  101f5b:	e9 78 ff ff ff       	jmp    101ed8 <__alltraps>

00101f60 <vector12>:
.globl vector12
vector12:
  pushl $12
  101f60:	6a 0c                	push   $0xc
  jmp __alltraps
  101f62:	e9 71 ff ff ff       	jmp    101ed8 <__alltraps>

00101f67 <vector13>:
.globl vector13
vector13:
  pushl $13
  101f67:	6a 0d                	push   $0xd
  jmp __alltraps
  101f69:	e9 6a ff ff ff       	jmp    101ed8 <__alltraps>

00101f6e <vector14>:
.globl vector14
vector14:
  pushl $14
  101f6e:	6a 0e                	push   $0xe
  jmp __alltraps
  101f70:	e9 63 ff ff ff       	jmp    101ed8 <__alltraps>

00101f75 <vector15>:
.globl vector15
vector15:
  pushl $0
  101f75:	6a 00                	push   $0x0
  pushl $15
  101f77:	6a 0f                	push   $0xf
  jmp __alltraps
  101f79:	e9 5a ff ff ff       	jmp    101ed8 <__alltraps>

00101f7e <vector16>:
.globl vector16
vector16:
  pushl $0
  101f7e:	6a 00                	push   $0x0
  pushl $16
  101f80:	6a 10                	push   $0x10
  jmp __alltraps
  101f82:	e9 51 ff ff ff       	jmp    101ed8 <__alltraps>

00101f87 <vector17>:
.globl vector17
vector17:
  pushl $17
  101f87:	6a 11                	push   $0x11
  jmp __alltraps
  101f89:	e9 4a ff ff ff       	jmp    101ed8 <__alltraps>

00101f8e <vector18>:
.globl vector18
vector18:
  pushl $0
  101f8e:	6a 00                	push   $0x0
  pushl $18
  101f90:	6a 12                	push   $0x12
  jmp __alltraps
  101f92:	e9 41 ff ff ff       	jmp    101ed8 <__alltraps>

00101f97 <vector19>:
.globl vector19
vector19:
  pushl $0
  101f97:	6a 00                	push   $0x0
  pushl $19
  101f99:	6a 13                	push   $0x13
  jmp __alltraps
  101f9b:	e9 38 ff ff ff       	jmp    101ed8 <__alltraps>

00101fa0 <vector20>:
.globl vector20
vector20:
  pushl $0
  101fa0:	6a 00                	push   $0x0
  pushl $20
  101fa2:	6a 14                	push   $0x14
  jmp __alltraps
  101fa4:	e9 2f ff ff ff       	jmp    101ed8 <__alltraps>

00101fa9 <vector21>:
.globl vector21
vector21:
  pushl $0
  101fa9:	6a 00                	push   $0x0
  pushl $21
  101fab:	6a 15                	push   $0x15
  jmp __alltraps
  101fad:	e9 26 ff ff ff       	jmp    101ed8 <__alltraps>

00101fb2 <vector22>:
.globl vector22
vector22:
  pushl $0
  101fb2:	6a 00                	push   $0x0
  pushl $22
  101fb4:	6a 16                	push   $0x16
  jmp __alltraps
  101fb6:	e9 1d ff ff ff       	jmp    101ed8 <__alltraps>

00101fbb <vector23>:
.globl vector23
vector23:
  pushl $0
  101fbb:	6a 00                	push   $0x0
  pushl $23
  101fbd:	6a 17                	push   $0x17
  jmp __alltraps
  101fbf:	e9 14 ff ff ff       	jmp    101ed8 <__alltraps>

00101fc4 <vector24>:
.globl vector24
vector24:
  pushl $0
  101fc4:	6a 00                	push   $0x0
  pushl $24
  101fc6:	6a 18                	push   $0x18
  jmp __alltraps
  101fc8:	e9 0b ff ff ff       	jmp    101ed8 <__alltraps>

00101fcd <vector25>:
.globl vector25
vector25:
  pushl $0
  101fcd:	6a 00                	push   $0x0
  pushl $25
  101fcf:	6a 19                	push   $0x19
  jmp __alltraps
  101fd1:	e9 02 ff ff ff       	jmp    101ed8 <__alltraps>

00101fd6 <vector26>:
.globl vector26
vector26:
  pushl $0
  101fd6:	6a 00                	push   $0x0
  pushl $26
  101fd8:	6a 1a                	push   $0x1a
  jmp __alltraps
  101fda:	e9 f9 fe ff ff       	jmp    101ed8 <__alltraps>

00101fdf <vector27>:
.globl vector27
vector27:
  pushl $0
  101fdf:	6a 00                	push   $0x0
  pushl $27
  101fe1:	6a 1b                	push   $0x1b
  jmp __alltraps
  101fe3:	e9 f0 fe ff ff       	jmp    101ed8 <__alltraps>

00101fe8 <vector28>:
.globl vector28
vector28:
  pushl $0
  101fe8:	6a 00                	push   $0x0
  pushl $28
  101fea:	6a 1c                	push   $0x1c
  jmp __alltraps
  101fec:	e9 e7 fe ff ff       	jmp    101ed8 <__alltraps>

00101ff1 <vector29>:
.globl vector29
vector29:
  pushl $0
  101ff1:	6a 00                	push   $0x0
  pushl $29
  101ff3:	6a 1d                	push   $0x1d
  jmp __alltraps
  101ff5:	e9 de fe ff ff       	jmp    101ed8 <__alltraps>

00101ffa <vector30>:
.globl vector30
vector30:
  pushl $0
  101ffa:	6a 00                	push   $0x0
  pushl $30
  101ffc:	6a 1e                	push   $0x1e
  jmp __alltraps
  101ffe:	e9 d5 fe ff ff       	jmp    101ed8 <__alltraps>

00102003 <vector31>:
.globl vector31
vector31:
  pushl $0
  102003:	6a 00                	push   $0x0
  pushl $31
  102005:	6a 1f                	push   $0x1f
  jmp __alltraps
  102007:	e9 cc fe ff ff       	jmp    101ed8 <__alltraps>

0010200c <vector32>:
.globl vector32
vector32:
  pushl $0
  10200c:	6a 00                	push   $0x0
  pushl $32
  10200e:	6a 20                	push   $0x20
  jmp __alltraps
  102010:	e9 c3 fe ff ff       	jmp    101ed8 <__alltraps>

00102015 <vector33>:
.globl vector33
vector33:
  pushl $0
  102015:	6a 00                	push   $0x0
  pushl $33
  102017:	6a 21                	push   $0x21
  jmp __alltraps
  102019:	e9 ba fe ff ff       	jmp    101ed8 <__alltraps>

0010201e <vector34>:
.globl vector34
vector34:
  pushl $0
  10201e:	6a 00                	push   $0x0
  pushl $34
  102020:	6a 22                	push   $0x22
  jmp __alltraps
  102022:	e9 b1 fe ff ff       	jmp    101ed8 <__alltraps>

00102027 <vector35>:
.globl vector35
vector35:
  pushl $0
  102027:	6a 00                	push   $0x0
  pushl $35
  102029:	6a 23                	push   $0x23
  jmp __alltraps
  10202b:	e9 a8 fe ff ff       	jmp    101ed8 <__alltraps>

00102030 <vector36>:
.globl vector36
vector36:
  pushl $0
  102030:	6a 00                	push   $0x0
  pushl $36
  102032:	6a 24                	push   $0x24
  jmp __alltraps
  102034:	e9 9f fe ff ff       	jmp    101ed8 <__alltraps>

00102039 <vector37>:
.globl vector37
vector37:
  pushl $0
  102039:	6a 00                	push   $0x0
  pushl $37
  10203b:	6a 25                	push   $0x25
  jmp __alltraps
  10203d:	e9 96 fe ff ff       	jmp    101ed8 <__alltraps>

00102042 <vector38>:
.globl vector38
vector38:
  pushl $0
  102042:	6a 00                	push   $0x0
  pushl $38
  102044:	6a 26                	push   $0x26
  jmp __alltraps
  102046:	e9 8d fe ff ff       	jmp    101ed8 <__alltraps>

0010204b <vector39>:
.globl vector39
vector39:
  pushl $0
  10204b:	6a 00                	push   $0x0
  pushl $39
  10204d:	6a 27                	push   $0x27
  jmp __alltraps
  10204f:	e9 84 fe ff ff       	jmp    101ed8 <__alltraps>

00102054 <vector40>:
.globl vector40
vector40:
  pushl $0
  102054:	6a 00                	push   $0x0
  pushl $40
  102056:	6a 28                	push   $0x28
  jmp __alltraps
  102058:	e9 7b fe ff ff       	jmp    101ed8 <__alltraps>

0010205d <vector41>:
.globl vector41
vector41:
  pushl $0
  10205d:	6a 00                	push   $0x0
  pushl $41
  10205f:	6a 29                	push   $0x29
  jmp __alltraps
  102061:	e9 72 fe ff ff       	jmp    101ed8 <__alltraps>

00102066 <vector42>:
.globl vector42
vector42:
  pushl $0
  102066:	6a 00                	push   $0x0
  pushl $42
  102068:	6a 2a                	push   $0x2a
  jmp __alltraps
  10206a:	e9 69 fe ff ff       	jmp    101ed8 <__alltraps>

0010206f <vector43>:
.globl vector43
vector43:
  pushl $0
  10206f:	6a 00                	push   $0x0
  pushl $43
  102071:	6a 2b                	push   $0x2b
  jmp __alltraps
  102073:	e9 60 fe ff ff       	jmp    101ed8 <__alltraps>

00102078 <vector44>:
.globl vector44
vector44:
  pushl $0
  102078:	6a 00                	push   $0x0
  pushl $44
  10207a:	6a 2c                	push   $0x2c
  jmp __alltraps
  10207c:	e9 57 fe ff ff       	jmp    101ed8 <__alltraps>

00102081 <vector45>:
.globl vector45
vector45:
  pushl $0
  102081:	6a 00                	push   $0x0
  pushl $45
  102083:	6a 2d                	push   $0x2d
  jmp __alltraps
  102085:	e9 4e fe ff ff       	jmp    101ed8 <__alltraps>

0010208a <vector46>:
.globl vector46
vector46:
  pushl $0
  10208a:	6a 00                	push   $0x0
  pushl $46
  10208c:	6a 2e                	push   $0x2e
  jmp __alltraps
  10208e:	e9 45 fe ff ff       	jmp    101ed8 <__alltraps>

00102093 <vector47>:
.globl vector47
vector47:
  pushl $0
  102093:	6a 00                	push   $0x0
  pushl $47
  102095:	6a 2f                	push   $0x2f
  jmp __alltraps
  102097:	e9 3c fe ff ff       	jmp    101ed8 <__alltraps>

0010209c <vector48>:
.globl vector48
vector48:
  pushl $0
  10209c:	6a 00                	push   $0x0
  pushl $48
  10209e:	6a 30                	push   $0x30
  jmp __alltraps
  1020a0:	e9 33 fe ff ff       	jmp    101ed8 <__alltraps>

001020a5 <vector49>:
.globl vector49
vector49:
  pushl $0
  1020a5:	6a 00                	push   $0x0
  pushl $49
  1020a7:	6a 31                	push   $0x31
  jmp __alltraps
  1020a9:	e9 2a fe ff ff       	jmp    101ed8 <__alltraps>

001020ae <vector50>:
.globl vector50
vector50:
  pushl $0
  1020ae:	6a 00                	push   $0x0
  pushl $50
  1020b0:	6a 32                	push   $0x32
  jmp __alltraps
  1020b2:	e9 21 fe ff ff       	jmp    101ed8 <__alltraps>

001020b7 <vector51>:
.globl vector51
vector51:
  pushl $0
  1020b7:	6a 00                	push   $0x0
  pushl $51
  1020b9:	6a 33                	push   $0x33
  jmp __alltraps
  1020bb:	e9 18 fe ff ff       	jmp    101ed8 <__alltraps>

001020c0 <vector52>:
.globl vector52
vector52:
  pushl $0
  1020c0:	6a 00                	push   $0x0
  pushl $52
  1020c2:	6a 34                	push   $0x34
  jmp __alltraps
  1020c4:	e9 0f fe ff ff       	jmp    101ed8 <__alltraps>

001020c9 <vector53>:
.globl vector53
vector53:
  pushl $0
  1020c9:	6a 00                	push   $0x0
  pushl $53
  1020cb:	6a 35                	push   $0x35
  jmp __alltraps
  1020cd:	e9 06 fe ff ff       	jmp    101ed8 <__alltraps>

001020d2 <vector54>:
.globl vector54
vector54:
  pushl $0
  1020d2:	6a 00                	push   $0x0
  pushl $54
  1020d4:	6a 36                	push   $0x36
  jmp __alltraps
  1020d6:	e9 fd fd ff ff       	jmp    101ed8 <__alltraps>

001020db <vector55>:
.globl vector55
vector55:
  pushl $0
  1020db:	6a 00                	push   $0x0
  pushl $55
  1020dd:	6a 37                	push   $0x37
  jmp __alltraps
  1020df:	e9 f4 fd ff ff       	jmp    101ed8 <__alltraps>

001020e4 <vector56>:
.globl vector56
vector56:
  pushl $0
  1020e4:	6a 00                	push   $0x0
  pushl $56
  1020e6:	6a 38                	push   $0x38
  jmp __alltraps
  1020e8:	e9 eb fd ff ff       	jmp    101ed8 <__alltraps>

001020ed <vector57>:
.globl vector57
vector57:
  pushl $0
  1020ed:	6a 00                	push   $0x0
  pushl $57
  1020ef:	6a 39                	push   $0x39
  jmp __alltraps
  1020f1:	e9 e2 fd ff ff       	jmp    101ed8 <__alltraps>

001020f6 <vector58>:
.globl vector58
vector58:
  pushl $0
  1020f6:	6a 00                	push   $0x0
  pushl $58
  1020f8:	6a 3a                	push   $0x3a
  jmp __alltraps
  1020fa:	e9 d9 fd ff ff       	jmp    101ed8 <__alltraps>

001020ff <vector59>:
.globl vector59
vector59:
  pushl $0
  1020ff:	6a 00                	push   $0x0
  pushl $59
  102101:	6a 3b                	push   $0x3b
  jmp __alltraps
  102103:	e9 d0 fd ff ff       	jmp    101ed8 <__alltraps>

00102108 <vector60>:
.globl vector60
vector60:
  pushl $0
  102108:	6a 00                	push   $0x0
  pushl $60
  10210a:	6a 3c                	push   $0x3c
  jmp __alltraps
  10210c:	e9 c7 fd ff ff       	jmp    101ed8 <__alltraps>

00102111 <vector61>:
.globl vector61
vector61:
  pushl $0
  102111:	6a 00                	push   $0x0
  pushl $61
  102113:	6a 3d                	push   $0x3d
  jmp __alltraps
  102115:	e9 be fd ff ff       	jmp    101ed8 <__alltraps>

0010211a <vector62>:
.globl vector62
vector62:
  pushl $0
  10211a:	6a 00                	push   $0x0
  pushl $62
  10211c:	6a 3e                	push   $0x3e
  jmp __alltraps
  10211e:	e9 b5 fd ff ff       	jmp    101ed8 <__alltraps>

00102123 <vector63>:
.globl vector63
vector63:
  pushl $0
  102123:	6a 00                	push   $0x0
  pushl $63
  102125:	6a 3f                	push   $0x3f
  jmp __alltraps
  102127:	e9 ac fd ff ff       	jmp    101ed8 <__alltraps>

0010212c <vector64>:
.globl vector64
vector64:
  pushl $0
  10212c:	6a 00                	push   $0x0
  pushl $64
  10212e:	6a 40                	push   $0x40
  jmp __alltraps
  102130:	e9 a3 fd ff ff       	jmp    101ed8 <__alltraps>

00102135 <vector65>:
.globl vector65
vector65:
  pushl $0
  102135:	6a 00                	push   $0x0
  pushl $65
  102137:	6a 41                	push   $0x41
  jmp __alltraps
  102139:	e9 9a fd ff ff       	jmp    101ed8 <__alltraps>

0010213e <vector66>:
.globl vector66
vector66:
  pushl $0
  10213e:	6a 00                	push   $0x0
  pushl $66
  102140:	6a 42                	push   $0x42
  jmp __alltraps
  102142:	e9 91 fd ff ff       	jmp    101ed8 <__alltraps>

00102147 <vector67>:
.globl vector67
vector67:
  pushl $0
  102147:	6a 00                	push   $0x0
  pushl $67
  102149:	6a 43                	push   $0x43
  jmp __alltraps
  10214b:	e9 88 fd ff ff       	jmp    101ed8 <__alltraps>

00102150 <vector68>:
.globl vector68
vector68:
  pushl $0
  102150:	6a 00                	push   $0x0
  pushl $68
  102152:	6a 44                	push   $0x44
  jmp __alltraps
  102154:	e9 7f fd ff ff       	jmp    101ed8 <__alltraps>

00102159 <vector69>:
.globl vector69
vector69:
  pushl $0
  102159:	6a 00                	push   $0x0
  pushl $69
  10215b:	6a 45                	push   $0x45
  jmp __alltraps
  10215d:	e9 76 fd ff ff       	jmp    101ed8 <__alltraps>

00102162 <vector70>:
.globl vector70
vector70:
  pushl $0
  102162:	6a 00                	push   $0x0
  pushl $70
  102164:	6a 46                	push   $0x46
  jmp __alltraps
  102166:	e9 6d fd ff ff       	jmp    101ed8 <__alltraps>

0010216b <vector71>:
.globl vector71
vector71:
  pushl $0
  10216b:	6a 00                	push   $0x0
  pushl $71
  10216d:	6a 47                	push   $0x47
  jmp __alltraps
  10216f:	e9 64 fd ff ff       	jmp    101ed8 <__alltraps>

00102174 <vector72>:
.globl vector72
vector72:
  pushl $0
  102174:	6a 00                	push   $0x0
  pushl $72
  102176:	6a 48                	push   $0x48
  jmp __alltraps
  102178:	e9 5b fd ff ff       	jmp    101ed8 <__alltraps>

0010217d <vector73>:
.globl vector73
vector73:
  pushl $0
  10217d:	6a 00                	push   $0x0
  pushl $73
  10217f:	6a 49                	push   $0x49
  jmp __alltraps
  102181:	e9 52 fd ff ff       	jmp    101ed8 <__alltraps>

00102186 <vector74>:
.globl vector74
vector74:
  pushl $0
  102186:	6a 00                	push   $0x0
  pushl $74
  102188:	6a 4a                	push   $0x4a
  jmp __alltraps
  10218a:	e9 49 fd ff ff       	jmp    101ed8 <__alltraps>

0010218f <vector75>:
.globl vector75
vector75:
  pushl $0
  10218f:	6a 00                	push   $0x0
  pushl $75
  102191:	6a 4b                	push   $0x4b
  jmp __alltraps
  102193:	e9 40 fd ff ff       	jmp    101ed8 <__alltraps>

00102198 <vector76>:
.globl vector76
vector76:
  pushl $0
  102198:	6a 00                	push   $0x0
  pushl $76
  10219a:	6a 4c                	push   $0x4c
  jmp __alltraps
  10219c:	e9 37 fd ff ff       	jmp    101ed8 <__alltraps>

001021a1 <vector77>:
.globl vector77
vector77:
  pushl $0
  1021a1:	6a 00                	push   $0x0
  pushl $77
  1021a3:	6a 4d                	push   $0x4d
  jmp __alltraps
  1021a5:	e9 2e fd ff ff       	jmp    101ed8 <__alltraps>

001021aa <vector78>:
.globl vector78
vector78:
  pushl $0
  1021aa:	6a 00                	push   $0x0
  pushl $78
  1021ac:	6a 4e                	push   $0x4e
  jmp __alltraps
  1021ae:	e9 25 fd ff ff       	jmp    101ed8 <__alltraps>

001021b3 <vector79>:
.globl vector79
vector79:
  pushl $0
  1021b3:	6a 00                	push   $0x0
  pushl $79
  1021b5:	6a 4f                	push   $0x4f
  jmp __alltraps
  1021b7:	e9 1c fd ff ff       	jmp    101ed8 <__alltraps>

001021bc <vector80>:
.globl vector80
vector80:
  pushl $0
  1021bc:	6a 00                	push   $0x0
  pushl $80
  1021be:	6a 50                	push   $0x50
  jmp __alltraps
  1021c0:	e9 13 fd ff ff       	jmp    101ed8 <__alltraps>

001021c5 <vector81>:
.globl vector81
vector81:
  pushl $0
  1021c5:	6a 00                	push   $0x0
  pushl $81
  1021c7:	6a 51                	push   $0x51
  jmp __alltraps
  1021c9:	e9 0a fd ff ff       	jmp    101ed8 <__alltraps>

001021ce <vector82>:
.globl vector82
vector82:
  pushl $0
  1021ce:	6a 00                	push   $0x0
  pushl $82
  1021d0:	6a 52                	push   $0x52
  jmp __alltraps
  1021d2:	e9 01 fd ff ff       	jmp    101ed8 <__alltraps>

001021d7 <vector83>:
.globl vector83
vector83:
  pushl $0
  1021d7:	6a 00                	push   $0x0
  pushl $83
  1021d9:	6a 53                	push   $0x53
  jmp __alltraps
  1021db:	e9 f8 fc ff ff       	jmp    101ed8 <__alltraps>

001021e0 <vector84>:
.globl vector84
vector84:
  pushl $0
  1021e0:	6a 00                	push   $0x0
  pushl $84
  1021e2:	6a 54                	push   $0x54
  jmp __alltraps
  1021e4:	e9 ef fc ff ff       	jmp    101ed8 <__alltraps>

001021e9 <vector85>:
.globl vector85
vector85:
  pushl $0
  1021e9:	6a 00                	push   $0x0
  pushl $85
  1021eb:	6a 55                	push   $0x55
  jmp __alltraps
  1021ed:	e9 e6 fc ff ff       	jmp    101ed8 <__alltraps>

001021f2 <vector86>:
.globl vector86
vector86:
  pushl $0
  1021f2:	6a 00                	push   $0x0
  pushl $86
  1021f4:	6a 56                	push   $0x56
  jmp __alltraps
  1021f6:	e9 dd fc ff ff       	jmp    101ed8 <__alltraps>

001021fb <vector87>:
.globl vector87
vector87:
  pushl $0
  1021fb:	6a 00                	push   $0x0
  pushl $87
  1021fd:	6a 57                	push   $0x57
  jmp __alltraps
  1021ff:	e9 d4 fc ff ff       	jmp    101ed8 <__alltraps>

00102204 <vector88>:
.globl vector88
vector88:
  pushl $0
  102204:	6a 00                	push   $0x0
  pushl $88
  102206:	6a 58                	push   $0x58
  jmp __alltraps
  102208:	e9 cb fc ff ff       	jmp    101ed8 <__alltraps>

0010220d <vector89>:
.globl vector89
vector89:
  pushl $0
  10220d:	6a 00                	push   $0x0
  pushl $89
  10220f:	6a 59                	push   $0x59
  jmp __alltraps
  102211:	e9 c2 fc ff ff       	jmp    101ed8 <__alltraps>

00102216 <vector90>:
.globl vector90
vector90:
  pushl $0
  102216:	6a 00                	push   $0x0
  pushl $90
  102218:	6a 5a                	push   $0x5a
  jmp __alltraps
  10221a:	e9 b9 fc ff ff       	jmp    101ed8 <__alltraps>

0010221f <vector91>:
.globl vector91
vector91:
  pushl $0
  10221f:	6a 00                	push   $0x0
  pushl $91
  102221:	6a 5b                	push   $0x5b
  jmp __alltraps
  102223:	e9 b0 fc ff ff       	jmp    101ed8 <__alltraps>

00102228 <vector92>:
.globl vector92
vector92:
  pushl $0
  102228:	6a 00                	push   $0x0
  pushl $92
  10222a:	6a 5c                	push   $0x5c
  jmp __alltraps
  10222c:	e9 a7 fc ff ff       	jmp    101ed8 <__alltraps>

00102231 <vector93>:
.globl vector93
vector93:
  pushl $0
  102231:	6a 00                	push   $0x0
  pushl $93
  102233:	6a 5d                	push   $0x5d
  jmp __alltraps
  102235:	e9 9e fc ff ff       	jmp    101ed8 <__alltraps>

0010223a <vector94>:
.globl vector94
vector94:
  pushl $0
  10223a:	6a 00                	push   $0x0
  pushl $94
  10223c:	6a 5e                	push   $0x5e
  jmp __alltraps
  10223e:	e9 95 fc ff ff       	jmp    101ed8 <__alltraps>

00102243 <vector95>:
.globl vector95
vector95:
  pushl $0
  102243:	6a 00                	push   $0x0
  pushl $95
  102245:	6a 5f                	push   $0x5f
  jmp __alltraps
  102247:	e9 8c fc ff ff       	jmp    101ed8 <__alltraps>

0010224c <vector96>:
.globl vector96
vector96:
  pushl $0
  10224c:	6a 00                	push   $0x0
  pushl $96
  10224e:	6a 60                	push   $0x60
  jmp __alltraps
  102250:	e9 83 fc ff ff       	jmp    101ed8 <__alltraps>

00102255 <vector97>:
.globl vector97
vector97:
  pushl $0
  102255:	6a 00                	push   $0x0
  pushl $97
  102257:	6a 61                	push   $0x61
  jmp __alltraps
  102259:	e9 7a fc ff ff       	jmp    101ed8 <__alltraps>

0010225e <vector98>:
.globl vector98
vector98:
  pushl $0
  10225e:	6a 00                	push   $0x0
  pushl $98
  102260:	6a 62                	push   $0x62
  jmp __alltraps
  102262:	e9 71 fc ff ff       	jmp    101ed8 <__alltraps>

00102267 <vector99>:
.globl vector99
vector99:
  pushl $0
  102267:	6a 00                	push   $0x0
  pushl $99
  102269:	6a 63                	push   $0x63
  jmp __alltraps
  10226b:	e9 68 fc ff ff       	jmp    101ed8 <__alltraps>

00102270 <vector100>:
.globl vector100
vector100:
  pushl $0
  102270:	6a 00                	push   $0x0
  pushl $100
  102272:	6a 64                	push   $0x64
  jmp __alltraps
  102274:	e9 5f fc ff ff       	jmp    101ed8 <__alltraps>

00102279 <vector101>:
.globl vector101
vector101:
  pushl $0
  102279:	6a 00                	push   $0x0
  pushl $101
  10227b:	6a 65                	push   $0x65
  jmp __alltraps
  10227d:	e9 56 fc ff ff       	jmp    101ed8 <__alltraps>

00102282 <vector102>:
.globl vector102
vector102:
  pushl $0
  102282:	6a 00                	push   $0x0
  pushl $102
  102284:	6a 66                	push   $0x66
  jmp __alltraps
  102286:	e9 4d fc ff ff       	jmp    101ed8 <__alltraps>

0010228b <vector103>:
.globl vector103
vector103:
  pushl $0
  10228b:	6a 00                	push   $0x0
  pushl $103
  10228d:	6a 67                	push   $0x67
  jmp __alltraps
  10228f:	e9 44 fc ff ff       	jmp    101ed8 <__alltraps>

00102294 <vector104>:
.globl vector104
vector104:
  pushl $0
  102294:	6a 00                	push   $0x0
  pushl $104
  102296:	6a 68                	push   $0x68
  jmp __alltraps
  102298:	e9 3b fc ff ff       	jmp    101ed8 <__alltraps>

0010229d <vector105>:
.globl vector105
vector105:
  pushl $0
  10229d:	6a 00                	push   $0x0
  pushl $105
  10229f:	6a 69                	push   $0x69
  jmp __alltraps
  1022a1:	e9 32 fc ff ff       	jmp    101ed8 <__alltraps>

001022a6 <vector106>:
.globl vector106
vector106:
  pushl $0
  1022a6:	6a 00                	push   $0x0
  pushl $106
  1022a8:	6a 6a                	push   $0x6a
  jmp __alltraps
  1022aa:	e9 29 fc ff ff       	jmp    101ed8 <__alltraps>

001022af <vector107>:
.globl vector107
vector107:
  pushl $0
  1022af:	6a 00                	push   $0x0
  pushl $107
  1022b1:	6a 6b                	push   $0x6b
  jmp __alltraps
  1022b3:	e9 20 fc ff ff       	jmp    101ed8 <__alltraps>

001022b8 <vector108>:
.globl vector108
vector108:
  pushl $0
  1022b8:	6a 00                	push   $0x0
  pushl $108
  1022ba:	6a 6c                	push   $0x6c
  jmp __alltraps
  1022bc:	e9 17 fc ff ff       	jmp    101ed8 <__alltraps>

001022c1 <vector109>:
.globl vector109
vector109:
  pushl $0
  1022c1:	6a 00                	push   $0x0
  pushl $109
  1022c3:	6a 6d                	push   $0x6d
  jmp __alltraps
  1022c5:	e9 0e fc ff ff       	jmp    101ed8 <__alltraps>

001022ca <vector110>:
.globl vector110
vector110:
  pushl $0
  1022ca:	6a 00                	push   $0x0
  pushl $110
  1022cc:	6a 6e                	push   $0x6e
  jmp __alltraps
  1022ce:	e9 05 fc ff ff       	jmp    101ed8 <__alltraps>

001022d3 <vector111>:
.globl vector111
vector111:
  pushl $0
  1022d3:	6a 00                	push   $0x0
  pushl $111
  1022d5:	6a 6f                	push   $0x6f
  jmp __alltraps
  1022d7:	e9 fc fb ff ff       	jmp    101ed8 <__alltraps>

001022dc <vector112>:
.globl vector112
vector112:
  pushl $0
  1022dc:	6a 00                	push   $0x0
  pushl $112
  1022de:	6a 70                	push   $0x70
  jmp __alltraps
  1022e0:	e9 f3 fb ff ff       	jmp    101ed8 <__alltraps>

001022e5 <vector113>:
.globl vector113
vector113:
  pushl $0
  1022e5:	6a 00                	push   $0x0
  pushl $113
  1022e7:	6a 71                	push   $0x71
  jmp __alltraps
  1022e9:	e9 ea fb ff ff       	jmp    101ed8 <__alltraps>

001022ee <vector114>:
.globl vector114
vector114:
  pushl $0
  1022ee:	6a 00                	push   $0x0
  pushl $114
  1022f0:	6a 72                	push   $0x72
  jmp __alltraps
  1022f2:	e9 e1 fb ff ff       	jmp    101ed8 <__alltraps>

001022f7 <vector115>:
.globl vector115
vector115:
  pushl $0
  1022f7:	6a 00                	push   $0x0
  pushl $115
  1022f9:	6a 73                	push   $0x73
  jmp __alltraps
  1022fb:	e9 d8 fb ff ff       	jmp    101ed8 <__alltraps>

00102300 <vector116>:
.globl vector116
vector116:
  pushl $0
  102300:	6a 00                	push   $0x0
  pushl $116
  102302:	6a 74                	push   $0x74
  jmp __alltraps
  102304:	e9 cf fb ff ff       	jmp    101ed8 <__alltraps>

00102309 <vector117>:
.globl vector117
vector117:
  pushl $0
  102309:	6a 00                	push   $0x0
  pushl $117
  10230b:	6a 75                	push   $0x75
  jmp __alltraps
  10230d:	e9 c6 fb ff ff       	jmp    101ed8 <__alltraps>

00102312 <vector118>:
.globl vector118
vector118:
  pushl $0
  102312:	6a 00                	push   $0x0
  pushl $118
  102314:	6a 76                	push   $0x76
  jmp __alltraps
  102316:	e9 bd fb ff ff       	jmp    101ed8 <__alltraps>

0010231b <vector119>:
.globl vector119
vector119:
  pushl $0
  10231b:	6a 00                	push   $0x0
  pushl $119
  10231d:	6a 77                	push   $0x77
  jmp __alltraps
  10231f:	e9 b4 fb ff ff       	jmp    101ed8 <__alltraps>

00102324 <vector120>:
.globl vector120
vector120:
  pushl $0
  102324:	6a 00                	push   $0x0
  pushl $120
  102326:	6a 78                	push   $0x78
  jmp __alltraps
  102328:	e9 ab fb ff ff       	jmp    101ed8 <__alltraps>

0010232d <vector121>:
.globl vector121
vector121:
  pushl $0
  10232d:	6a 00                	push   $0x0
  pushl $121
  10232f:	6a 79                	push   $0x79
  jmp __alltraps
  102331:	e9 a2 fb ff ff       	jmp    101ed8 <__alltraps>

00102336 <vector122>:
.globl vector122
vector122:
  pushl $0
  102336:	6a 00                	push   $0x0
  pushl $122
  102338:	6a 7a                	push   $0x7a
  jmp __alltraps
  10233a:	e9 99 fb ff ff       	jmp    101ed8 <__alltraps>

0010233f <vector123>:
.globl vector123
vector123:
  pushl $0
  10233f:	6a 00                	push   $0x0
  pushl $123
  102341:	6a 7b                	push   $0x7b
  jmp __alltraps
  102343:	e9 90 fb ff ff       	jmp    101ed8 <__alltraps>

00102348 <vector124>:
.globl vector124
vector124:
  pushl $0
  102348:	6a 00                	push   $0x0
  pushl $124
  10234a:	6a 7c                	push   $0x7c
  jmp __alltraps
  10234c:	e9 87 fb ff ff       	jmp    101ed8 <__alltraps>

00102351 <vector125>:
.globl vector125
vector125:
  pushl $0
  102351:	6a 00                	push   $0x0
  pushl $125
  102353:	6a 7d                	push   $0x7d
  jmp __alltraps
  102355:	e9 7e fb ff ff       	jmp    101ed8 <__alltraps>

0010235a <vector126>:
.globl vector126
vector126:
  pushl $0
  10235a:	6a 00                	push   $0x0
  pushl $126
  10235c:	6a 7e                	push   $0x7e
  jmp __alltraps
  10235e:	e9 75 fb ff ff       	jmp    101ed8 <__alltraps>

00102363 <vector127>:
.globl vector127
vector127:
  pushl $0
  102363:	6a 00                	push   $0x0
  pushl $127
  102365:	6a 7f                	push   $0x7f
  jmp __alltraps
  102367:	e9 6c fb ff ff       	jmp    101ed8 <__alltraps>

0010236c <vector128>:
.globl vector128
vector128:
  pushl $0
  10236c:	6a 00                	push   $0x0
  pushl $128
  10236e:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102373:	e9 60 fb ff ff       	jmp    101ed8 <__alltraps>

00102378 <vector129>:
.globl vector129
vector129:
  pushl $0
  102378:	6a 00                	push   $0x0
  pushl $129
  10237a:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  10237f:	e9 54 fb ff ff       	jmp    101ed8 <__alltraps>

00102384 <vector130>:
.globl vector130
vector130:
  pushl $0
  102384:	6a 00                	push   $0x0
  pushl $130
  102386:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  10238b:	e9 48 fb ff ff       	jmp    101ed8 <__alltraps>

00102390 <vector131>:
.globl vector131
vector131:
  pushl $0
  102390:	6a 00                	push   $0x0
  pushl $131
  102392:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102397:	e9 3c fb ff ff       	jmp    101ed8 <__alltraps>

0010239c <vector132>:
.globl vector132
vector132:
  pushl $0
  10239c:	6a 00                	push   $0x0
  pushl $132
  10239e:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  1023a3:	e9 30 fb ff ff       	jmp    101ed8 <__alltraps>

001023a8 <vector133>:
.globl vector133
vector133:
  pushl $0
  1023a8:	6a 00                	push   $0x0
  pushl $133
  1023aa:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  1023af:	e9 24 fb ff ff       	jmp    101ed8 <__alltraps>

001023b4 <vector134>:
.globl vector134
vector134:
  pushl $0
  1023b4:	6a 00                	push   $0x0
  pushl $134
  1023b6:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  1023bb:	e9 18 fb ff ff       	jmp    101ed8 <__alltraps>

001023c0 <vector135>:
.globl vector135
vector135:
  pushl $0
  1023c0:	6a 00                	push   $0x0
  pushl $135
  1023c2:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  1023c7:	e9 0c fb ff ff       	jmp    101ed8 <__alltraps>

001023cc <vector136>:
.globl vector136
vector136:
  pushl $0
  1023cc:	6a 00                	push   $0x0
  pushl $136
  1023ce:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  1023d3:	e9 00 fb ff ff       	jmp    101ed8 <__alltraps>

001023d8 <vector137>:
.globl vector137
vector137:
  pushl $0
  1023d8:	6a 00                	push   $0x0
  pushl $137
  1023da:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1023df:	e9 f4 fa ff ff       	jmp    101ed8 <__alltraps>

001023e4 <vector138>:
.globl vector138
vector138:
  pushl $0
  1023e4:	6a 00                	push   $0x0
  pushl $138
  1023e6:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1023eb:	e9 e8 fa ff ff       	jmp    101ed8 <__alltraps>

001023f0 <vector139>:
.globl vector139
vector139:
  pushl $0
  1023f0:	6a 00                	push   $0x0
  pushl $139
  1023f2:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1023f7:	e9 dc fa ff ff       	jmp    101ed8 <__alltraps>

001023fc <vector140>:
.globl vector140
vector140:
  pushl $0
  1023fc:	6a 00                	push   $0x0
  pushl $140
  1023fe:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  102403:	e9 d0 fa ff ff       	jmp    101ed8 <__alltraps>

00102408 <vector141>:
.globl vector141
vector141:
  pushl $0
  102408:	6a 00                	push   $0x0
  pushl $141
  10240a:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  10240f:	e9 c4 fa ff ff       	jmp    101ed8 <__alltraps>

00102414 <vector142>:
.globl vector142
vector142:
  pushl $0
  102414:	6a 00                	push   $0x0
  pushl $142
  102416:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  10241b:	e9 b8 fa ff ff       	jmp    101ed8 <__alltraps>

00102420 <vector143>:
.globl vector143
vector143:
  pushl $0
  102420:	6a 00                	push   $0x0
  pushl $143
  102422:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  102427:	e9 ac fa ff ff       	jmp    101ed8 <__alltraps>

0010242c <vector144>:
.globl vector144
vector144:
  pushl $0
  10242c:	6a 00                	push   $0x0
  pushl $144
  10242e:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  102433:	e9 a0 fa ff ff       	jmp    101ed8 <__alltraps>

00102438 <vector145>:
.globl vector145
vector145:
  pushl $0
  102438:	6a 00                	push   $0x0
  pushl $145
  10243a:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  10243f:	e9 94 fa ff ff       	jmp    101ed8 <__alltraps>

00102444 <vector146>:
.globl vector146
vector146:
  pushl $0
  102444:	6a 00                	push   $0x0
  pushl $146
  102446:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  10244b:	e9 88 fa ff ff       	jmp    101ed8 <__alltraps>

00102450 <vector147>:
.globl vector147
vector147:
  pushl $0
  102450:	6a 00                	push   $0x0
  pushl $147
  102452:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  102457:	e9 7c fa ff ff       	jmp    101ed8 <__alltraps>

0010245c <vector148>:
.globl vector148
vector148:
  pushl $0
  10245c:	6a 00                	push   $0x0
  pushl $148
  10245e:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102463:	e9 70 fa ff ff       	jmp    101ed8 <__alltraps>

00102468 <vector149>:
.globl vector149
vector149:
  pushl $0
  102468:	6a 00                	push   $0x0
  pushl $149
  10246a:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  10246f:	e9 64 fa ff ff       	jmp    101ed8 <__alltraps>

00102474 <vector150>:
.globl vector150
vector150:
  pushl $0
  102474:	6a 00                	push   $0x0
  pushl $150
  102476:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  10247b:	e9 58 fa ff ff       	jmp    101ed8 <__alltraps>

00102480 <vector151>:
.globl vector151
vector151:
  pushl $0
  102480:	6a 00                	push   $0x0
  pushl $151
  102482:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102487:	e9 4c fa ff ff       	jmp    101ed8 <__alltraps>

0010248c <vector152>:
.globl vector152
vector152:
  pushl $0
  10248c:	6a 00                	push   $0x0
  pushl $152
  10248e:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102493:	e9 40 fa ff ff       	jmp    101ed8 <__alltraps>

00102498 <vector153>:
.globl vector153
vector153:
  pushl $0
  102498:	6a 00                	push   $0x0
  pushl $153
  10249a:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  10249f:	e9 34 fa ff ff       	jmp    101ed8 <__alltraps>

001024a4 <vector154>:
.globl vector154
vector154:
  pushl $0
  1024a4:	6a 00                	push   $0x0
  pushl $154
  1024a6:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  1024ab:	e9 28 fa ff ff       	jmp    101ed8 <__alltraps>

001024b0 <vector155>:
.globl vector155
vector155:
  pushl $0
  1024b0:	6a 00                	push   $0x0
  pushl $155
  1024b2:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  1024b7:	e9 1c fa ff ff       	jmp    101ed8 <__alltraps>

001024bc <vector156>:
.globl vector156
vector156:
  pushl $0
  1024bc:	6a 00                	push   $0x0
  pushl $156
  1024be:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  1024c3:	e9 10 fa ff ff       	jmp    101ed8 <__alltraps>

001024c8 <vector157>:
.globl vector157
vector157:
  pushl $0
  1024c8:	6a 00                	push   $0x0
  pushl $157
  1024ca:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  1024cf:	e9 04 fa ff ff       	jmp    101ed8 <__alltraps>

001024d4 <vector158>:
.globl vector158
vector158:
  pushl $0
  1024d4:	6a 00                	push   $0x0
  pushl $158
  1024d6:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1024db:	e9 f8 f9 ff ff       	jmp    101ed8 <__alltraps>

001024e0 <vector159>:
.globl vector159
vector159:
  pushl $0
  1024e0:	6a 00                	push   $0x0
  pushl $159
  1024e2:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1024e7:	e9 ec f9 ff ff       	jmp    101ed8 <__alltraps>

001024ec <vector160>:
.globl vector160
vector160:
  pushl $0
  1024ec:	6a 00                	push   $0x0
  pushl $160
  1024ee:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1024f3:	e9 e0 f9 ff ff       	jmp    101ed8 <__alltraps>

001024f8 <vector161>:
.globl vector161
vector161:
  pushl $0
  1024f8:	6a 00                	push   $0x0
  pushl $161
  1024fa:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1024ff:	e9 d4 f9 ff ff       	jmp    101ed8 <__alltraps>

00102504 <vector162>:
.globl vector162
vector162:
  pushl $0
  102504:	6a 00                	push   $0x0
  pushl $162
  102506:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  10250b:	e9 c8 f9 ff ff       	jmp    101ed8 <__alltraps>

00102510 <vector163>:
.globl vector163
vector163:
  pushl $0
  102510:	6a 00                	push   $0x0
  pushl $163
  102512:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  102517:	e9 bc f9 ff ff       	jmp    101ed8 <__alltraps>

0010251c <vector164>:
.globl vector164
vector164:
  pushl $0
  10251c:	6a 00                	push   $0x0
  pushl $164
  10251e:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  102523:	e9 b0 f9 ff ff       	jmp    101ed8 <__alltraps>

00102528 <vector165>:
.globl vector165
vector165:
  pushl $0
  102528:	6a 00                	push   $0x0
  pushl $165
  10252a:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  10252f:	e9 a4 f9 ff ff       	jmp    101ed8 <__alltraps>

00102534 <vector166>:
.globl vector166
vector166:
  pushl $0
  102534:	6a 00                	push   $0x0
  pushl $166
  102536:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  10253b:	e9 98 f9 ff ff       	jmp    101ed8 <__alltraps>

00102540 <vector167>:
.globl vector167
vector167:
  pushl $0
  102540:	6a 00                	push   $0x0
  pushl $167
  102542:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102547:	e9 8c f9 ff ff       	jmp    101ed8 <__alltraps>

0010254c <vector168>:
.globl vector168
vector168:
  pushl $0
  10254c:	6a 00                	push   $0x0
  pushl $168
  10254e:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102553:	e9 80 f9 ff ff       	jmp    101ed8 <__alltraps>

00102558 <vector169>:
.globl vector169
vector169:
  pushl $0
  102558:	6a 00                	push   $0x0
  pushl $169
  10255a:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  10255f:	e9 74 f9 ff ff       	jmp    101ed8 <__alltraps>

00102564 <vector170>:
.globl vector170
vector170:
  pushl $0
  102564:	6a 00                	push   $0x0
  pushl $170
  102566:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  10256b:	e9 68 f9 ff ff       	jmp    101ed8 <__alltraps>

00102570 <vector171>:
.globl vector171
vector171:
  pushl $0
  102570:	6a 00                	push   $0x0
  pushl $171
  102572:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102577:	e9 5c f9 ff ff       	jmp    101ed8 <__alltraps>

0010257c <vector172>:
.globl vector172
vector172:
  pushl $0
  10257c:	6a 00                	push   $0x0
  pushl $172
  10257e:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102583:	e9 50 f9 ff ff       	jmp    101ed8 <__alltraps>

00102588 <vector173>:
.globl vector173
vector173:
  pushl $0
  102588:	6a 00                	push   $0x0
  pushl $173
  10258a:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  10258f:	e9 44 f9 ff ff       	jmp    101ed8 <__alltraps>

00102594 <vector174>:
.globl vector174
vector174:
  pushl $0
  102594:	6a 00                	push   $0x0
  pushl $174
  102596:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  10259b:	e9 38 f9 ff ff       	jmp    101ed8 <__alltraps>

001025a0 <vector175>:
.globl vector175
vector175:
  pushl $0
  1025a0:	6a 00                	push   $0x0
  pushl $175
  1025a2:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  1025a7:	e9 2c f9 ff ff       	jmp    101ed8 <__alltraps>

001025ac <vector176>:
.globl vector176
vector176:
  pushl $0
  1025ac:	6a 00                	push   $0x0
  pushl $176
  1025ae:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  1025b3:	e9 20 f9 ff ff       	jmp    101ed8 <__alltraps>

001025b8 <vector177>:
.globl vector177
vector177:
  pushl $0
  1025b8:	6a 00                	push   $0x0
  pushl $177
  1025ba:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  1025bf:	e9 14 f9 ff ff       	jmp    101ed8 <__alltraps>

001025c4 <vector178>:
.globl vector178
vector178:
  pushl $0
  1025c4:	6a 00                	push   $0x0
  pushl $178
  1025c6:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  1025cb:	e9 08 f9 ff ff       	jmp    101ed8 <__alltraps>

001025d0 <vector179>:
.globl vector179
vector179:
  pushl $0
  1025d0:	6a 00                	push   $0x0
  pushl $179
  1025d2:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  1025d7:	e9 fc f8 ff ff       	jmp    101ed8 <__alltraps>

001025dc <vector180>:
.globl vector180
vector180:
  pushl $0
  1025dc:	6a 00                	push   $0x0
  pushl $180
  1025de:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1025e3:	e9 f0 f8 ff ff       	jmp    101ed8 <__alltraps>

001025e8 <vector181>:
.globl vector181
vector181:
  pushl $0
  1025e8:	6a 00                	push   $0x0
  pushl $181
  1025ea:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1025ef:	e9 e4 f8 ff ff       	jmp    101ed8 <__alltraps>

001025f4 <vector182>:
.globl vector182
vector182:
  pushl $0
  1025f4:	6a 00                	push   $0x0
  pushl $182
  1025f6:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1025fb:	e9 d8 f8 ff ff       	jmp    101ed8 <__alltraps>

00102600 <vector183>:
.globl vector183
vector183:
  pushl $0
  102600:	6a 00                	push   $0x0
  pushl $183
  102602:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  102607:	e9 cc f8 ff ff       	jmp    101ed8 <__alltraps>

0010260c <vector184>:
.globl vector184
vector184:
  pushl $0
  10260c:	6a 00                	push   $0x0
  pushl $184
  10260e:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  102613:	e9 c0 f8 ff ff       	jmp    101ed8 <__alltraps>

00102618 <vector185>:
.globl vector185
vector185:
  pushl $0
  102618:	6a 00                	push   $0x0
  pushl $185
  10261a:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  10261f:	e9 b4 f8 ff ff       	jmp    101ed8 <__alltraps>

00102624 <vector186>:
.globl vector186
vector186:
  pushl $0
  102624:	6a 00                	push   $0x0
  pushl $186
  102626:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  10262b:	e9 a8 f8 ff ff       	jmp    101ed8 <__alltraps>

00102630 <vector187>:
.globl vector187
vector187:
  pushl $0
  102630:	6a 00                	push   $0x0
  pushl $187
  102632:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  102637:	e9 9c f8 ff ff       	jmp    101ed8 <__alltraps>

0010263c <vector188>:
.globl vector188
vector188:
  pushl $0
  10263c:	6a 00                	push   $0x0
  pushl $188
  10263e:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102643:	e9 90 f8 ff ff       	jmp    101ed8 <__alltraps>

00102648 <vector189>:
.globl vector189
vector189:
  pushl $0
  102648:	6a 00                	push   $0x0
  pushl $189
  10264a:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  10264f:	e9 84 f8 ff ff       	jmp    101ed8 <__alltraps>

00102654 <vector190>:
.globl vector190
vector190:
  pushl $0
  102654:	6a 00                	push   $0x0
  pushl $190
  102656:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  10265b:	e9 78 f8 ff ff       	jmp    101ed8 <__alltraps>

00102660 <vector191>:
.globl vector191
vector191:
  pushl $0
  102660:	6a 00                	push   $0x0
  pushl $191
  102662:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102667:	e9 6c f8 ff ff       	jmp    101ed8 <__alltraps>

0010266c <vector192>:
.globl vector192
vector192:
  pushl $0
  10266c:	6a 00                	push   $0x0
  pushl $192
  10266e:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102673:	e9 60 f8 ff ff       	jmp    101ed8 <__alltraps>

00102678 <vector193>:
.globl vector193
vector193:
  pushl $0
  102678:	6a 00                	push   $0x0
  pushl $193
  10267a:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  10267f:	e9 54 f8 ff ff       	jmp    101ed8 <__alltraps>

00102684 <vector194>:
.globl vector194
vector194:
  pushl $0
  102684:	6a 00                	push   $0x0
  pushl $194
  102686:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  10268b:	e9 48 f8 ff ff       	jmp    101ed8 <__alltraps>

00102690 <vector195>:
.globl vector195
vector195:
  pushl $0
  102690:	6a 00                	push   $0x0
  pushl $195
  102692:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102697:	e9 3c f8 ff ff       	jmp    101ed8 <__alltraps>

0010269c <vector196>:
.globl vector196
vector196:
  pushl $0
  10269c:	6a 00                	push   $0x0
  pushl $196
  10269e:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  1026a3:	e9 30 f8 ff ff       	jmp    101ed8 <__alltraps>

001026a8 <vector197>:
.globl vector197
vector197:
  pushl $0
  1026a8:	6a 00                	push   $0x0
  pushl $197
  1026aa:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  1026af:	e9 24 f8 ff ff       	jmp    101ed8 <__alltraps>

001026b4 <vector198>:
.globl vector198
vector198:
  pushl $0
  1026b4:	6a 00                	push   $0x0
  pushl $198
  1026b6:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  1026bb:	e9 18 f8 ff ff       	jmp    101ed8 <__alltraps>

001026c0 <vector199>:
.globl vector199
vector199:
  pushl $0
  1026c0:	6a 00                	push   $0x0
  pushl $199
  1026c2:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  1026c7:	e9 0c f8 ff ff       	jmp    101ed8 <__alltraps>

001026cc <vector200>:
.globl vector200
vector200:
  pushl $0
  1026cc:	6a 00                	push   $0x0
  pushl $200
  1026ce:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  1026d3:	e9 00 f8 ff ff       	jmp    101ed8 <__alltraps>

001026d8 <vector201>:
.globl vector201
vector201:
  pushl $0
  1026d8:	6a 00                	push   $0x0
  pushl $201
  1026da:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1026df:	e9 f4 f7 ff ff       	jmp    101ed8 <__alltraps>

001026e4 <vector202>:
.globl vector202
vector202:
  pushl $0
  1026e4:	6a 00                	push   $0x0
  pushl $202
  1026e6:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1026eb:	e9 e8 f7 ff ff       	jmp    101ed8 <__alltraps>

001026f0 <vector203>:
.globl vector203
vector203:
  pushl $0
  1026f0:	6a 00                	push   $0x0
  pushl $203
  1026f2:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1026f7:	e9 dc f7 ff ff       	jmp    101ed8 <__alltraps>

001026fc <vector204>:
.globl vector204
vector204:
  pushl $0
  1026fc:	6a 00                	push   $0x0
  pushl $204
  1026fe:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  102703:	e9 d0 f7 ff ff       	jmp    101ed8 <__alltraps>

00102708 <vector205>:
.globl vector205
vector205:
  pushl $0
  102708:	6a 00                	push   $0x0
  pushl $205
  10270a:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  10270f:	e9 c4 f7 ff ff       	jmp    101ed8 <__alltraps>

00102714 <vector206>:
.globl vector206
vector206:
  pushl $0
  102714:	6a 00                	push   $0x0
  pushl $206
  102716:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  10271b:	e9 b8 f7 ff ff       	jmp    101ed8 <__alltraps>

00102720 <vector207>:
.globl vector207
vector207:
  pushl $0
  102720:	6a 00                	push   $0x0
  pushl $207
  102722:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  102727:	e9 ac f7 ff ff       	jmp    101ed8 <__alltraps>

0010272c <vector208>:
.globl vector208
vector208:
  pushl $0
  10272c:	6a 00                	push   $0x0
  pushl $208
  10272e:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  102733:	e9 a0 f7 ff ff       	jmp    101ed8 <__alltraps>

00102738 <vector209>:
.globl vector209
vector209:
  pushl $0
  102738:	6a 00                	push   $0x0
  pushl $209
  10273a:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  10273f:	e9 94 f7 ff ff       	jmp    101ed8 <__alltraps>

00102744 <vector210>:
.globl vector210
vector210:
  pushl $0
  102744:	6a 00                	push   $0x0
  pushl $210
  102746:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  10274b:	e9 88 f7 ff ff       	jmp    101ed8 <__alltraps>

00102750 <vector211>:
.globl vector211
vector211:
  pushl $0
  102750:	6a 00                	push   $0x0
  pushl $211
  102752:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102757:	e9 7c f7 ff ff       	jmp    101ed8 <__alltraps>

0010275c <vector212>:
.globl vector212
vector212:
  pushl $0
  10275c:	6a 00                	push   $0x0
  pushl $212
  10275e:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102763:	e9 70 f7 ff ff       	jmp    101ed8 <__alltraps>

00102768 <vector213>:
.globl vector213
vector213:
  pushl $0
  102768:	6a 00                	push   $0x0
  pushl $213
  10276a:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  10276f:	e9 64 f7 ff ff       	jmp    101ed8 <__alltraps>

00102774 <vector214>:
.globl vector214
vector214:
  pushl $0
  102774:	6a 00                	push   $0x0
  pushl $214
  102776:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  10277b:	e9 58 f7 ff ff       	jmp    101ed8 <__alltraps>

00102780 <vector215>:
.globl vector215
vector215:
  pushl $0
  102780:	6a 00                	push   $0x0
  pushl $215
  102782:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102787:	e9 4c f7 ff ff       	jmp    101ed8 <__alltraps>

0010278c <vector216>:
.globl vector216
vector216:
  pushl $0
  10278c:	6a 00                	push   $0x0
  pushl $216
  10278e:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102793:	e9 40 f7 ff ff       	jmp    101ed8 <__alltraps>

00102798 <vector217>:
.globl vector217
vector217:
  pushl $0
  102798:	6a 00                	push   $0x0
  pushl $217
  10279a:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  10279f:	e9 34 f7 ff ff       	jmp    101ed8 <__alltraps>

001027a4 <vector218>:
.globl vector218
vector218:
  pushl $0
  1027a4:	6a 00                	push   $0x0
  pushl $218
  1027a6:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  1027ab:	e9 28 f7 ff ff       	jmp    101ed8 <__alltraps>

001027b0 <vector219>:
.globl vector219
vector219:
  pushl $0
  1027b0:	6a 00                	push   $0x0
  pushl $219
  1027b2:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  1027b7:	e9 1c f7 ff ff       	jmp    101ed8 <__alltraps>

001027bc <vector220>:
.globl vector220
vector220:
  pushl $0
  1027bc:	6a 00                	push   $0x0
  pushl $220
  1027be:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  1027c3:	e9 10 f7 ff ff       	jmp    101ed8 <__alltraps>

001027c8 <vector221>:
.globl vector221
vector221:
  pushl $0
  1027c8:	6a 00                	push   $0x0
  pushl $221
  1027ca:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  1027cf:	e9 04 f7 ff ff       	jmp    101ed8 <__alltraps>

001027d4 <vector222>:
.globl vector222
vector222:
  pushl $0
  1027d4:	6a 00                	push   $0x0
  pushl $222
  1027d6:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1027db:	e9 f8 f6 ff ff       	jmp    101ed8 <__alltraps>

001027e0 <vector223>:
.globl vector223
vector223:
  pushl $0
  1027e0:	6a 00                	push   $0x0
  pushl $223
  1027e2:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1027e7:	e9 ec f6 ff ff       	jmp    101ed8 <__alltraps>

001027ec <vector224>:
.globl vector224
vector224:
  pushl $0
  1027ec:	6a 00                	push   $0x0
  pushl $224
  1027ee:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1027f3:	e9 e0 f6 ff ff       	jmp    101ed8 <__alltraps>

001027f8 <vector225>:
.globl vector225
vector225:
  pushl $0
  1027f8:	6a 00                	push   $0x0
  pushl $225
  1027fa:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1027ff:	e9 d4 f6 ff ff       	jmp    101ed8 <__alltraps>

00102804 <vector226>:
.globl vector226
vector226:
  pushl $0
  102804:	6a 00                	push   $0x0
  pushl $226
  102806:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  10280b:	e9 c8 f6 ff ff       	jmp    101ed8 <__alltraps>

00102810 <vector227>:
.globl vector227
vector227:
  pushl $0
  102810:	6a 00                	push   $0x0
  pushl $227
  102812:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  102817:	e9 bc f6 ff ff       	jmp    101ed8 <__alltraps>

0010281c <vector228>:
.globl vector228
vector228:
  pushl $0
  10281c:	6a 00                	push   $0x0
  pushl $228
  10281e:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  102823:	e9 b0 f6 ff ff       	jmp    101ed8 <__alltraps>

00102828 <vector229>:
.globl vector229
vector229:
  pushl $0
  102828:	6a 00                	push   $0x0
  pushl $229
  10282a:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  10282f:	e9 a4 f6 ff ff       	jmp    101ed8 <__alltraps>

00102834 <vector230>:
.globl vector230
vector230:
  pushl $0
  102834:	6a 00                	push   $0x0
  pushl $230
  102836:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  10283b:	e9 98 f6 ff ff       	jmp    101ed8 <__alltraps>

00102840 <vector231>:
.globl vector231
vector231:
  pushl $0
  102840:	6a 00                	push   $0x0
  pushl $231
  102842:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102847:	e9 8c f6 ff ff       	jmp    101ed8 <__alltraps>

0010284c <vector232>:
.globl vector232
vector232:
  pushl $0
  10284c:	6a 00                	push   $0x0
  pushl $232
  10284e:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102853:	e9 80 f6 ff ff       	jmp    101ed8 <__alltraps>

00102858 <vector233>:
.globl vector233
vector233:
  pushl $0
  102858:	6a 00                	push   $0x0
  pushl $233
  10285a:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  10285f:	e9 74 f6 ff ff       	jmp    101ed8 <__alltraps>

00102864 <vector234>:
.globl vector234
vector234:
  pushl $0
  102864:	6a 00                	push   $0x0
  pushl $234
  102866:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  10286b:	e9 68 f6 ff ff       	jmp    101ed8 <__alltraps>

00102870 <vector235>:
.globl vector235
vector235:
  pushl $0
  102870:	6a 00                	push   $0x0
  pushl $235
  102872:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102877:	e9 5c f6 ff ff       	jmp    101ed8 <__alltraps>

0010287c <vector236>:
.globl vector236
vector236:
  pushl $0
  10287c:	6a 00                	push   $0x0
  pushl $236
  10287e:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102883:	e9 50 f6 ff ff       	jmp    101ed8 <__alltraps>

00102888 <vector237>:
.globl vector237
vector237:
  pushl $0
  102888:	6a 00                	push   $0x0
  pushl $237
  10288a:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  10288f:	e9 44 f6 ff ff       	jmp    101ed8 <__alltraps>

00102894 <vector238>:
.globl vector238
vector238:
  pushl $0
  102894:	6a 00                	push   $0x0
  pushl $238
  102896:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  10289b:	e9 38 f6 ff ff       	jmp    101ed8 <__alltraps>

001028a0 <vector239>:
.globl vector239
vector239:
  pushl $0
  1028a0:	6a 00                	push   $0x0
  pushl $239
  1028a2:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  1028a7:	e9 2c f6 ff ff       	jmp    101ed8 <__alltraps>

001028ac <vector240>:
.globl vector240
vector240:
  pushl $0
  1028ac:	6a 00                	push   $0x0
  pushl $240
  1028ae:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  1028b3:	e9 20 f6 ff ff       	jmp    101ed8 <__alltraps>

001028b8 <vector241>:
.globl vector241
vector241:
  pushl $0
  1028b8:	6a 00                	push   $0x0
  pushl $241
  1028ba:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  1028bf:	e9 14 f6 ff ff       	jmp    101ed8 <__alltraps>

001028c4 <vector242>:
.globl vector242
vector242:
  pushl $0
  1028c4:	6a 00                	push   $0x0
  pushl $242
  1028c6:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  1028cb:	e9 08 f6 ff ff       	jmp    101ed8 <__alltraps>

001028d0 <vector243>:
.globl vector243
vector243:
  pushl $0
  1028d0:	6a 00                	push   $0x0
  pushl $243
  1028d2:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  1028d7:	e9 fc f5 ff ff       	jmp    101ed8 <__alltraps>

001028dc <vector244>:
.globl vector244
vector244:
  pushl $0
  1028dc:	6a 00                	push   $0x0
  pushl $244
  1028de:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1028e3:	e9 f0 f5 ff ff       	jmp    101ed8 <__alltraps>

001028e8 <vector245>:
.globl vector245
vector245:
  pushl $0
  1028e8:	6a 00                	push   $0x0
  pushl $245
  1028ea:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1028ef:	e9 e4 f5 ff ff       	jmp    101ed8 <__alltraps>

001028f4 <vector246>:
.globl vector246
vector246:
  pushl $0
  1028f4:	6a 00                	push   $0x0
  pushl $246
  1028f6:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1028fb:	e9 d8 f5 ff ff       	jmp    101ed8 <__alltraps>

00102900 <vector247>:
.globl vector247
vector247:
  pushl $0
  102900:	6a 00                	push   $0x0
  pushl $247
  102902:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102907:	e9 cc f5 ff ff       	jmp    101ed8 <__alltraps>

0010290c <vector248>:
.globl vector248
vector248:
  pushl $0
  10290c:	6a 00                	push   $0x0
  pushl $248
  10290e:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  102913:	e9 c0 f5 ff ff       	jmp    101ed8 <__alltraps>

00102918 <vector249>:
.globl vector249
vector249:
  pushl $0
  102918:	6a 00                	push   $0x0
  pushl $249
  10291a:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  10291f:	e9 b4 f5 ff ff       	jmp    101ed8 <__alltraps>

00102924 <vector250>:
.globl vector250
vector250:
  pushl $0
  102924:	6a 00                	push   $0x0
  pushl $250
  102926:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  10292b:	e9 a8 f5 ff ff       	jmp    101ed8 <__alltraps>

00102930 <vector251>:
.globl vector251
vector251:
  pushl $0
  102930:	6a 00                	push   $0x0
  pushl $251
  102932:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102937:	e9 9c f5 ff ff       	jmp    101ed8 <__alltraps>

0010293c <vector252>:
.globl vector252
vector252:
  pushl $0
  10293c:	6a 00                	push   $0x0
  pushl $252
  10293e:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102943:	e9 90 f5 ff ff       	jmp    101ed8 <__alltraps>

00102948 <vector253>:
.globl vector253
vector253:
  pushl $0
  102948:	6a 00                	push   $0x0
  pushl $253
  10294a:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  10294f:	e9 84 f5 ff ff       	jmp    101ed8 <__alltraps>

00102954 <vector254>:
.globl vector254
vector254:
  pushl $0
  102954:	6a 00                	push   $0x0
  pushl $254
  102956:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  10295b:	e9 78 f5 ff ff       	jmp    101ed8 <__alltraps>

00102960 <vector255>:
.globl vector255
vector255:
  pushl $0
  102960:	6a 00                	push   $0x0
  pushl $255
  102962:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102967:	e9 6c f5 ff ff       	jmp    101ed8 <__alltraps>

0010296c <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  10296c:	55                   	push   %ebp
  10296d:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  10296f:	8b 45 08             	mov    0x8(%ebp),%eax
  102972:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102975:	b8 23 00 00 00       	mov    $0x23,%eax
  10297a:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  10297c:	b8 23 00 00 00       	mov    $0x23,%eax
  102981:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102983:	b8 10 00 00 00       	mov    $0x10,%eax
  102988:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  10298a:	b8 10 00 00 00       	mov    $0x10,%eax
  10298f:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102991:	b8 10 00 00 00       	mov    $0x10,%eax
  102996:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102998:	ea 9f 29 10 00 08 00 	ljmp   $0x8,$0x10299f
}
  10299f:	5d                   	pop    %ebp
  1029a0:	c3                   	ret    

001029a1 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  1029a1:	55                   	push   %ebp
  1029a2:	89 e5                	mov    %esp,%ebp
  1029a4:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  1029a7:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  1029ac:	05 00 04 00 00       	add    $0x400,%eax
  1029b1:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  1029b6:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  1029bd:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  1029bf:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  1029c6:	68 00 
  1029c8:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1029cd:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  1029d3:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1029d8:	c1 e8 10             	shr    $0x10,%eax
  1029db:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  1029e0:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1029e7:	83 e0 f0             	and    $0xfffffff0,%eax
  1029ea:	83 c8 09             	or     $0x9,%eax
  1029ed:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1029f2:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1029f9:	83 c8 10             	or     $0x10,%eax
  1029fc:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102a01:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a08:	83 e0 9f             	and    $0xffffff9f,%eax
  102a0b:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102a10:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a17:	83 c8 80             	or     $0xffffff80,%eax
  102a1a:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102a1f:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a26:	83 e0 f0             	and    $0xfffffff0,%eax
  102a29:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a2e:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a35:	83 e0 ef             	and    $0xffffffef,%eax
  102a38:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a3d:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a44:	83 e0 df             	and    $0xffffffdf,%eax
  102a47:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a4c:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a53:	83 c8 40             	or     $0x40,%eax
  102a56:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a5b:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a62:	83 e0 7f             	and    $0x7f,%eax
  102a65:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a6a:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102a6f:	c1 e8 18             	shr    $0x18,%eax
  102a72:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  102a77:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a7e:	83 e0 ef             	and    $0xffffffef,%eax
  102a81:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102a86:	c7 04 24 10 ea 10 00 	movl   $0x10ea10,(%esp)
  102a8d:	e8 da fe ff ff       	call   10296c <lgdt>
  102a92:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102a98:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102a9c:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102a9f:	c9                   	leave  
  102aa0:	c3                   	ret    

00102aa1 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102aa1:	55                   	push   %ebp
  102aa2:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102aa4:	e8 f8 fe ff ff       	call   1029a1 <gdt_init>
}
  102aa9:	5d                   	pop    %ebp
  102aaa:	c3                   	ret    
	...

00102aac <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102aac:	55                   	push   %ebp
  102aad:	89 e5                	mov    %esp,%ebp
  102aaf:	56                   	push   %esi
  102ab0:	53                   	push   %ebx
  102ab1:	83 ec 60             	sub    $0x60,%esp
  102ab4:	8b 45 10             	mov    0x10(%ebp),%eax
  102ab7:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102aba:	8b 45 14             	mov    0x14(%ebp),%eax
  102abd:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102ac0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102ac3:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102ac6:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102ac9:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102acc:	8b 45 18             	mov    0x18(%ebp),%eax
  102acf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102ad2:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102ad5:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102ad8:	89 45 c8             	mov    %eax,-0x38(%ebp)
  102adb:	89 55 cc             	mov    %edx,-0x34(%ebp)
  102ade:	8b 45 c8             	mov    -0x38(%ebp),%eax
  102ae1:	8b 55 cc             	mov    -0x34(%ebp),%edx
  102ae4:	89 d3                	mov    %edx,%ebx
  102ae6:	89 c6                	mov    %eax,%esi
  102ae8:	89 75 e0             	mov    %esi,-0x20(%ebp)
  102aeb:	89 5d f0             	mov    %ebx,-0x10(%ebp)
  102aee:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102af1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102af4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102af8:	74 1c                	je     102b16 <printnum+0x6a>
  102afa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102afd:	ba 00 00 00 00       	mov    $0x0,%edx
  102b02:	f7 75 e4             	divl   -0x1c(%ebp)
  102b05:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102b08:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b0b:	ba 00 00 00 00       	mov    $0x0,%edx
  102b10:	f7 75 e4             	divl   -0x1c(%ebp)
  102b13:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102b16:	8b 55 e0             	mov    -0x20(%ebp),%edx
  102b19:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b1c:	89 d6                	mov    %edx,%esi
  102b1e:	89 c3                	mov    %eax,%ebx
  102b20:	89 f0                	mov    %esi,%eax
  102b22:	89 da                	mov    %ebx,%edx
  102b24:	f7 75 e4             	divl   -0x1c(%ebp)
  102b27:	89 d3                	mov    %edx,%ebx
  102b29:	89 c6                	mov    %eax,%esi
  102b2b:	89 75 e0             	mov    %esi,-0x20(%ebp)
  102b2e:	89 5d dc             	mov    %ebx,-0x24(%ebp)
  102b31:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102b34:	89 45 c8             	mov    %eax,-0x38(%ebp)
  102b37:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102b3a:	89 55 c4             	mov    %edx,-0x3c(%ebp)
  102b3d:	8b 45 c8             	mov    -0x38(%ebp),%eax
  102b40:	8b 55 c4             	mov    -0x3c(%ebp),%edx
  102b43:	89 c3                	mov    %eax,%ebx
  102b45:	89 d6                	mov    %edx,%esi
  102b47:	89 5d e8             	mov    %ebx,-0x18(%ebp)
  102b4a:	89 75 ec             	mov    %esi,-0x14(%ebp)
  102b4d:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102b50:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102b53:	8b 45 18             	mov    0x18(%ebp),%eax
  102b56:	ba 00 00 00 00       	mov    $0x0,%edx
  102b5b:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102b5e:	77 56                	ja     102bb6 <printnum+0x10a>
  102b60:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102b63:	72 05                	jb     102b6a <printnum+0xbe>
  102b65:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  102b68:	77 4c                	ja     102bb6 <printnum+0x10a>
        printnum(putch, putdat, result, base, width - 1, padc);
  102b6a:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102b6d:	8d 50 ff             	lea    -0x1(%eax),%edx
  102b70:	8b 45 20             	mov    0x20(%ebp),%eax
  102b73:	89 44 24 18          	mov    %eax,0x18(%esp)
  102b77:	89 54 24 14          	mov    %edx,0x14(%esp)
  102b7b:	8b 45 18             	mov    0x18(%ebp),%eax
  102b7e:	89 44 24 10          	mov    %eax,0x10(%esp)
  102b82:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102b85:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102b88:	89 44 24 08          	mov    %eax,0x8(%esp)
  102b8c:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102b90:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b93:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b97:	8b 45 08             	mov    0x8(%ebp),%eax
  102b9a:	89 04 24             	mov    %eax,(%esp)
  102b9d:	e8 0a ff ff ff       	call   102aac <printnum>
  102ba2:	eb 1c                	jmp    102bc0 <printnum+0x114>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102ba4:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ba7:	89 44 24 04          	mov    %eax,0x4(%esp)
  102bab:	8b 45 20             	mov    0x20(%ebp),%eax
  102bae:	89 04 24             	mov    %eax,(%esp)
  102bb1:	8b 45 08             	mov    0x8(%ebp),%eax
  102bb4:	ff d0                	call   *%eax
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  102bb6:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  102bba:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102bbe:	7f e4                	jg     102ba4 <printnum+0xf8>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102bc0:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102bc3:	05 10 3e 10 00       	add    $0x103e10,%eax
  102bc8:	0f b6 00             	movzbl (%eax),%eax
  102bcb:	0f be c0             	movsbl %al,%eax
  102bce:	8b 55 0c             	mov    0xc(%ebp),%edx
  102bd1:	89 54 24 04          	mov    %edx,0x4(%esp)
  102bd5:	89 04 24             	mov    %eax,(%esp)
  102bd8:	8b 45 08             	mov    0x8(%ebp),%eax
  102bdb:	ff d0                	call   *%eax
}
  102bdd:	83 c4 60             	add    $0x60,%esp
  102be0:	5b                   	pop    %ebx
  102be1:	5e                   	pop    %esi
  102be2:	5d                   	pop    %ebp
  102be3:	c3                   	ret    

00102be4 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102be4:	55                   	push   %ebp
  102be5:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102be7:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102beb:	7e 14                	jle    102c01 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102bed:	8b 45 08             	mov    0x8(%ebp),%eax
  102bf0:	8b 00                	mov    (%eax),%eax
  102bf2:	8d 48 08             	lea    0x8(%eax),%ecx
  102bf5:	8b 55 08             	mov    0x8(%ebp),%edx
  102bf8:	89 0a                	mov    %ecx,(%edx)
  102bfa:	8b 50 04             	mov    0x4(%eax),%edx
  102bfd:	8b 00                	mov    (%eax),%eax
  102bff:	eb 30                	jmp    102c31 <getuint+0x4d>
    }
    else if (lflag) {
  102c01:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102c05:	74 16                	je     102c1d <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102c07:	8b 45 08             	mov    0x8(%ebp),%eax
  102c0a:	8b 00                	mov    (%eax),%eax
  102c0c:	8d 48 04             	lea    0x4(%eax),%ecx
  102c0f:	8b 55 08             	mov    0x8(%ebp),%edx
  102c12:	89 0a                	mov    %ecx,(%edx)
  102c14:	8b 00                	mov    (%eax),%eax
  102c16:	ba 00 00 00 00       	mov    $0x0,%edx
  102c1b:	eb 14                	jmp    102c31 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102c1d:	8b 45 08             	mov    0x8(%ebp),%eax
  102c20:	8b 00                	mov    (%eax),%eax
  102c22:	8d 48 04             	lea    0x4(%eax),%ecx
  102c25:	8b 55 08             	mov    0x8(%ebp),%edx
  102c28:	89 0a                	mov    %ecx,(%edx)
  102c2a:	8b 00                	mov    (%eax),%eax
  102c2c:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102c31:	5d                   	pop    %ebp
  102c32:	c3                   	ret    

00102c33 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102c33:	55                   	push   %ebp
  102c34:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102c36:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102c3a:	7e 14                	jle    102c50 <getint+0x1d>
        return va_arg(*ap, long long);
  102c3c:	8b 45 08             	mov    0x8(%ebp),%eax
  102c3f:	8b 00                	mov    (%eax),%eax
  102c41:	8d 48 08             	lea    0x8(%eax),%ecx
  102c44:	8b 55 08             	mov    0x8(%ebp),%edx
  102c47:	89 0a                	mov    %ecx,(%edx)
  102c49:	8b 50 04             	mov    0x4(%eax),%edx
  102c4c:	8b 00                	mov    (%eax),%eax
  102c4e:	eb 30                	jmp    102c80 <getint+0x4d>
    }
    else if (lflag) {
  102c50:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102c54:	74 16                	je     102c6c <getint+0x39>
        return va_arg(*ap, long);
  102c56:	8b 45 08             	mov    0x8(%ebp),%eax
  102c59:	8b 00                	mov    (%eax),%eax
  102c5b:	8d 48 04             	lea    0x4(%eax),%ecx
  102c5e:	8b 55 08             	mov    0x8(%ebp),%edx
  102c61:	89 0a                	mov    %ecx,(%edx)
  102c63:	8b 00                	mov    (%eax),%eax
  102c65:	89 c2                	mov    %eax,%edx
  102c67:	c1 fa 1f             	sar    $0x1f,%edx
  102c6a:	eb 14                	jmp    102c80 <getint+0x4d>
    }
    else {
        return va_arg(*ap, int);
  102c6c:	8b 45 08             	mov    0x8(%ebp),%eax
  102c6f:	8b 00                	mov    (%eax),%eax
  102c71:	8d 48 04             	lea    0x4(%eax),%ecx
  102c74:	8b 55 08             	mov    0x8(%ebp),%edx
  102c77:	89 0a                	mov    %ecx,(%edx)
  102c79:	8b 00                	mov    (%eax),%eax
  102c7b:	89 c2                	mov    %eax,%edx
  102c7d:	c1 fa 1f             	sar    $0x1f,%edx
    }
}
  102c80:	5d                   	pop    %ebp
  102c81:	c3                   	ret    

00102c82 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102c82:	55                   	push   %ebp
  102c83:	89 e5                	mov    %esp,%ebp
  102c85:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102c88:	8d 55 14             	lea    0x14(%ebp),%edx
  102c8b:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102c8e:	89 10                	mov    %edx,(%eax)
    vprintfmt(putch, putdat, fmt, ap);
  102c90:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c93:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102c97:	8b 45 10             	mov    0x10(%ebp),%eax
  102c9a:	89 44 24 08          	mov    %eax,0x8(%esp)
  102c9e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ca1:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ca5:	8b 45 08             	mov    0x8(%ebp),%eax
  102ca8:	89 04 24             	mov    %eax,(%esp)
  102cab:	e8 02 00 00 00       	call   102cb2 <vprintfmt>
    va_end(ap);
}
  102cb0:	c9                   	leave  
  102cb1:	c3                   	ret    

00102cb2 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102cb2:	55                   	push   %ebp
  102cb3:	89 e5                	mov    %esp,%ebp
  102cb5:	56                   	push   %esi
  102cb6:	53                   	push   %ebx
  102cb7:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102cba:	eb 17                	jmp    102cd3 <vprintfmt+0x21>
            if (ch == '\0') {
  102cbc:	85 db                	test   %ebx,%ebx
  102cbe:	0f 84 db 03 00 00    	je     10309f <vprintfmt+0x3ed>
                return;
            }
            putch(ch, putdat);
  102cc4:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cc7:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ccb:	89 1c 24             	mov    %ebx,(%esp)
  102cce:	8b 45 08             	mov    0x8(%ebp),%eax
  102cd1:	ff d0                	call   *%eax
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102cd3:	8b 45 10             	mov    0x10(%ebp),%eax
  102cd6:	0f b6 00             	movzbl (%eax),%eax
  102cd9:	0f b6 d8             	movzbl %al,%ebx
  102cdc:	83 fb 25             	cmp    $0x25,%ebx
  102cdf:	0f 95 c0             	setne  %al
  102ce2:	83 45 10 01          	addl   $0x1,0x10(%ebp)
  102ce6:	84 c0                	test   %al,%al
  102ce8:	75 d2                	jne    102cbc <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  102cea:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102cee:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102cf5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102cf8:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102cfb:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102d02:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102d05:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102d08:	eb 04                	jmp    102d0e <vprintfmt+0x5c>
            goto process_precision;

        case '.':
            if (width < 0)
                width = 0;
            goto reswitch;
  102d0a:	90                   	nop
  102d0b:	eb 01                	jmp    102d0e <vprintfmt+0x5c>
            goto reswitch;

        process_precision:
            if (width < 0)
                width = precision, precision = -1;
            goto reswitch;
  102d0d:	90                   	nop
        char padc = ' ';
        width = precision = -1;
        lflag = altflag = 0;

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102d0e:	8b 45 10             	mov    0x10(%ebp),%eax
  102d11:	0f b6 00             	movzbl (%eax),%eax
  102d14:	0f b6 d8             	movzbl %al,%ebx
  102d17:	89 d8                	mov    %ebx,%eax
  102d19:	83 45 10 01          	addl   $0x1,0x10(%ebp)
  102d1d:	83 e8 23             	sub    $0x23,%eax
  102d20:	83 f8 55             	cmp    $0x55,%eax
  102d23:	0f 87 45 03 00 00    	ja     10306e <vprintfmt+0x3bc>
  102d29:	8b 04 85 34 3e 10 00 	mov    0x103e34(,%eax,4),%eax
  102d30:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102d32:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102d36:	eb d6                	jmp    102d0e <vprintfmt+0x5c>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102d38:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102d3c:	eb d0                	jmp    102d0e <vprintfmt+0x5c>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102d3e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102d45:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102d48:	89 d0                	mov    %edx,%eax
  102d4a:	c1 e0 02             	shl    $0x2,%eax
  102d4d:	01 d0                	add    %edx,%eax
  102d4f:	01 c0                	add    %eax,%eax
  102d51:	01 d8                	add    %ebx,%eax
  102d53:	83 e8 30             	sub    $0x30,%eax
  102d56:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102d59:	8b 45 10             	mov    0x10(%ebp),%eax
  102d5c:	0f b6 00             	movzbl (%eax),%eax
  102d5f:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102d62:	83 fb 2f             	cmp    $0x2f,%ebx
  102d65:	7e 39                	jle    102da0 <vprintfmt+0xee>
  102d67:	83 fb 39             	cmp    $0x39,%ebx
  102d6a:	7f 34                	jg     102da0 <vprintfmt+0xee>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102d6c:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  102d70:	eb d3                	jmp    102d45 <vprintfmt+0x93>
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  102d72:	8b 45 14             	mov    0x14(%ebp),%eax
  102d75:	8d 50 04             	lea    0x4(%eax),%edx
  102d78:	89 55 14             	mov    %edx,0x14(%ebp)
  102d7b:	8b 00                	mov    (%eax),%eax
  102d7d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102d80:	eb 1f                	jmp    102da1 <vprintfmt+0xef>

        case '.':
            if (width < 0)
  102d82:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102d86:	79 82                	jns    102d0a <vprintfmt+0x58>
                width = 0;
  102d88:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102d8f:	e9 76 ff ff ff       	jmp    102d0a <vprintfmt+0x58>

        case '#':
            altflag = 1;
  102d94:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102d9b:	e9 6e ff ff ff       	jmp    102d0e <vprintfmt+0x5c>
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
            goto process_precision;
  102da0:	90                   	nop
        case '#':
            altflag = 1;
            goto reswitch;

        process_precision:
            if (width < 0)
  102da1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102da5:	0f 89 62 ff ff ff    	jns    102d0d <vprintfmt+0x5b>
                width = precision, precision = -1;
  102dab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102dae:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102db1:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102db8:	e9 50 ff ff ff       	jmp    102d0d <vprintfmt+0x5b>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102dbd:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  102dc1:	e9 48 ff ff ff       	jmp    102d0e <vprintfmt+0x5c>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102dc6:	8b 45 14             	mov    0x14(%ebp),%eax
  102dc9:	8d 50 04             	lea    0x4(%eax),%edx
  102dcc:	89 55 14             	mov    %edx,0x14(%ebp)
  102dcf:	8b 00                	mov    (%eax),%eax
  102dd1:	8b 55 0c             	mov    0xc(%ebp),%edx
  102dd4:	89 54 24 04          	mov    %edx,0x4(%esp)
  102dd8:	89 04 24             	mov    %eax,(%esp)
  102ddb:	8b 45 08             	mov    0x8(%ebp),%eax
  102dde:	ff d0                	call   *%eax
            break;
  102de0:	e9 b4 02 00 00       	jmp    103099 <vprintfmt+0x3e7>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102de5:	8b 45 14             	mov    0x14(%ebp),%eax
  102de8:	8d 50 04             	lea    0x4(%eax),%edx
  102deb:	89 55 14             	mov    %edx,0x14(%ebp)
  102dee:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102df0:	85 db                	test   %ebx,%ebx
  102df2:	79 02                	jns    102df6 <vprintfmt+0x144>
                err = -err;
  102df4:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102df6:	83 fb 06             	cmp    $0x6,%ebx
  102df9:	7f 0b                	jg     102e06 <vprintfmt+0x154>
  102dfb:	8b 34 9d f4 3d 10 00 	mov    0x103df4(,%ebx,4),%esi
  102e02:	85 f6                	test   %esi,%esi
  102e04:	75 23                	jne    102e29 <vprintfmt+0x177>
                printfmt(putch, putdat, "error %d", err);
  102e06:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  102e0a:	c7 44 24 08 21 3e 10 	movl   $0x103e21,0x8(%esp)
  102e11:	00 
  102e12:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e15:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e19:	8b 45 08             	mov    0x8(%ebp),%eax
  102e1c:	89 04 24             	mov    %eax,(%esp)
  102e1f:	e8 5e fe ff ff       	call   102c82 <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102e24:	e9 70 02 00 00       	jmp    103099 <vprintfmt+0x3e7>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  102e29:	89 74 24 0c          	mov    %esi,0xc(%esp)
  102e2d:	c7 44 24 08 2a 3e 10 	movl   $0x103e2a,0x8(%esp)
  102e34:	00 
  102e35:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e38:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e3c:	8b 45 08             	mov    0x8(%ebp),%eax
  102e3f:	89 04 24             	mov    %eax,(%esp)
  102e42:	e8 3b fe ff ff       	call   102c82 <printfmt>
            }
            break;
  102e47:	e9 4d 02 00 00       	jmp    103099 <vprintfmt+0x3e7>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102e4c:	8b 45 14             	mov    0x14(%ebp),%eax
  102e4f:	8d 50 04             	lea    0x4(%eax),%edx
  102e52:	89 55 14             	mov    %edx,0x14(%ebp)
  102e55:	8b 30                	mov    (%eax),%esi
  102e57:	85 f6                	test   %esi,%esi
  102e59:	75 05                	jne    102e60 <vprintfmt+0x1ae>
                p = "(null)";
  102e5b:	be 2d 3e 10 00       	mov    $0x103e2d,%esi
            }
            if (width > 0 && padc != '-') {
  102e60:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102e64:	7e 7c                	jle    102ee2 <vprintfmt+0x230>
  102e66:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102e6a:	74 76                	je     102ee2 <vprintfmt+0x230>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102e6c:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  102e6f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102e72:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e76:	89 34 24             	mov    %esi,(%esp)
  102e79:	e8 21 03 00 00       	call   10319f <strnlen>
  102e7e:	89 da                	mov    %ebx,%edx
  102e80:	29 c2                	sub    %eax,%edx
  102e82:	89 d0                	mov    %edx,%eax
  102e84:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102e87:	eb 17                	jmp    102ea0 <vprintfmt+0x1ee>
                    putch(padc, putdat);
  102e89:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102e8d:	8b 55 0c             	mov    0xc(%ebp),%edx
  102e90:	89 54 24 04          	mov    %edx,0x4(%esp)
  102e94:	89 04 24             	mov    %eax,(%esp)
  102e97:	8b 45 08             	mov    0x8(%ebp),%eax
  102e9a:	ff d0                	call   *%eax
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  102e9c:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102ea0:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102ea4:	7f e3                	jg     102e89 <vprintfmt+0x1d7>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102ea6:	eb 3a                	jmp    102ee2 <vprintfmt+0x230>
                if (altflag && (ch < ' ' || ch > '~')) {
  102ea8:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102eac:	74 1f                	je     102ecd <vprintfmt+0x21b>
  102eae:	83 fb 1f             	cmp    $0x1f,%ebx
  102eb1:	7e 05                	jle    102eb8 <vprintfmt+0x206>
  102eb3:	83 fb 7e             	cmp    $0x7e,%ebx
  102eb6:	7e 15                	jle    102ecd <vprintfmt+0x21b>
                    putch('?', putdat);
  102eb8:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ebb:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ebf:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  102ec6:	8b 45 08             	mov    0x8(%ebp),%eax
  102ec9:	ff d0                	call   *%eax
  102ecb:	eb 0f                	jmp    102edc <vprintfmt+0x22a>
                }
                else {
                    putch(ch, putdat);
  102ecd:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ed0:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ed4:	89 1c 24             	mov    %ebx,(%esp)
  102ed7:	8b 45 08             	mov    0x8(%ebp),%eax
  102eda:	ff d0                	call   *%eax
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102edc:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102ee0:	eb 01                	jmp    102ee3 <vprintfmt+0x231>
  102ee2:	90                   	nop
  102ee3:	0f b6 06             	movzbl (%esi),%eax
  102ee6:	0f be d8             	movsbl %al,%ebx
  102ee9:	85 db                	test   %ebx,%ebx
  102eeb:	0f 95 c0             	setne  %al
  102eee:	83 c6 01             	add    $0x1,%esi
  102ef1:	84 c0                	test   %al,%al
  102ef3:	74 29                	je     102f1e <vprintfmt+0x26c>
  102ef5:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102ef9:	78 ad                	js     102ea8 <vprintfmt+0x1f6>
  102efb:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  102eff:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102f03:	79 a3                	jns    102ea8 <vprintfmt+0x1f6>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102f05:	eb 17                	jmp    102f1e <vprintfmt+0x26c>
                putch(' ', putdat);
  102f07:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f0a:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f0e:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  102f15:	8b 45 08             	mov    0x8(%ebp),%eax
  102f18:	ff d0                	call   *%eax
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102f1a:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102f1e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102f22:	7f e3                	jg     102f07 <vprintfmt+0x255>
                putch(' ', putdat);
            }
            break;
  102f24:	e9 70 01 00 00       	jmp    103099 <vprintfmt+0x3e7>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  102f29:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102f2c:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f30:	8d 45 14             	lea    0x14(%ebp),%eax
  102f33:	89 04 24             	mov    %eax,(%esp)
  102f36:	e8 f8 fc ff ff       	call   102c33 <getint>
  102f3b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f3e:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  102f41:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f44:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102f47:	85 d2                	test   %edx,%edx
  102f49:	79 26                	jns    102f71 <vprintfmt+0x2bf>
                putch('-', putdat);
  102f4b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f4e:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f52:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  102f59:	8b 45 08             	mov    0x8(%ebp),%eax
  102f5c:	ff d0                	call   *%eax
                num = -(long long)num;
  102f5e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f61:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102f64:	f7 d8                	neg    %eax
  102f66:	83 d2 00             	adc    $0x0,%edx
  102f69:	f7 da                	neg    %edx
  102f6b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f6e:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  102f71:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102f78:	e9 a8 00 00 00       	jmp    103025 <vprintfmt+0x373>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  102f7d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102f80:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f84:	8d 45 14             	lea    0x14(%ebp),%eax
  102f87:	89 04 24             	mov    %eax,(%esp)
  102f8a:	e8 55 fc ff ff       	call   102be4 <getuint>
  102f8f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f92:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  102f95:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102f9c:	e9 84 00 00 00       	jmp    103025 <vprintfmt+0x373>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  102fa1:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102fa4:	89 44 24 04          	mov    %eax,0x4(%esp)
  102fa8:	8d 45 14             	lea    0x14(%ebp),%eax
  102fab:	89 04 24             	mov    %eax,(%esp)
  102fae:	e8 31 fc ff ff       	call   102be4 <getuint>
  102fb3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102fb6:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  102fb9:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  102fc0:	eb 63                	jmp    103025 <vprintfmt+0x373>

        // pointer
        case 'p':
            putch('0', putdat);
  102fc2:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fc5:	89 44 24 04          	mov    %eax,0x4(%esp)
  102fc9:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  102fd0:	8b 45 08             	mov    0x8(%ebp),%eax
  102fd3:	ff d0                	call   *%eax
            putch('x', putdat);
  102fd5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fd8:	89 44 24 04          	mov    %eax,0x4(%esp)
  102fdc:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  102fe3:	8b 45 08             	mov    0x8(%ebp),%eax
  102fe6:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  102fe8:	8b 45 14             	mov    0x14(%ebp),%eax
  102feb:	8d 50 04             	lea    0x4(%eax),%edx
  102fee:	89 55 14             	mov    %edx,0x14(%ebp)
  102ff1:	8b 00                	mov    (%eax),%eax
  102ff3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102ff6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  102ffd:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  103004:	eb 1f                	jmp    103025 <vprintfmt+0x373>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  103006:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103009:	89 44 24 04          	mov    %eax,0x4(%esp)
  10300d:	8d 45 14             	lea    0x14(%ebp),%eax
  103010:	89 04 24             	mov    %eax,(%esp)
  103013:	e8 cc fb ff ff       	call   102be4 <getuint>
  103018:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10301b:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  10301e:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  103025:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  103029:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10302c:	89 54 24 18          	mov    %edx,0x18(%esp)
  103030:	8b 55 e8             	mov    -0x18(%ebp),%edx
  103033:	89 54 24 14          	mov    %edx,0x14(%esp)
  103037:	89 44 24 10          	mov    %eax,0x10(%esp)
  10303b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10303e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103041:	89 44 24 08          	mov    %eax,0x8(%esp)
  103045:	89 54 24 0c          	mov    %edx,0xc(%esp)
  103049:	8b 45 0c             	mov    0xc(%ebp),%eax
  10304c:	89 44 24 04          	mov    %eax,0x4(%esp)
  103050:	8b 45 08             	mov    0x8(%ebp),%eax
  103053:	89 04 24             	mov    %eax,(%esp)
  103056:	e8 51 fa ff ff       	call   102aac <printnum>
            break;
  10305b:	eb 3c                	jmp    103099 <vprintfmt+0x3e7>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  10305d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103060:	89 44 24 04          	mov    %eax,0x4(%esp)
  103064:	89 1c 24             	mov    %ebx,(%esp)
  103067:	8b 45 08             	mov    0x8(%ebp),%eax
  10306a:	ff d0                	call   *%eax
            break;
  10306c:	eb 2b                	jmp    103099 <vprintfmt+0x3e7>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  10306e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103071:	89 44 24 04          	mov    %eax,0x4(%esp)
  103075:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  10307c:	8b 45 08             	mov    0x8(%ebp),%eax
  10307f:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  103081:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103085:	eb 04                	jmp    10308b <vprintfmt+0x3d9>
  103087:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10308b:	8b 45 10             	mov    0x10(%ebp),%eax
  10308e:	83 e8 01             	sub    $0x1,%eax
  103091:	0f b6 00             	movzbl (%eax),%eax
  103094:	3c 25                	cmp    $0x25,%al
  103096:	75 ef                	jne    103087 <vprintfmt+0x3d5>
                /* do nothing */;
            break;
  103098:	90                   	nop
        }
    }
  103099:	90                   	nop
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  10309a:	e9 34 fc ff ff       	jmp    102cd3 <vprintfmt+0x21>
            if (ch == '\0') {
                return;
  10309f:	90                   	nop
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
  1030a0:	83 c4 40             	add    $0x40,%esp
  1030a3:	5b                   	pop    %ebx
  1030a4:	5e                   	pop    %esi
  1030a5:	5d                   	pop    %ebp
  1030a6:	c3                   	ret    

001030a7 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  1030a7:	55                   	push   %ebp
  1030a8:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  1030aa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030ad:	8b 40 08             	mov    0x8(%eax),%eax
  1030b0:	8d 50 01             	lea    0x1(%eax),%edx
  1030b3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030b6:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  1030b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030bc:	8b 10                	mov    (%eax),%edx
  1030be:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030c1:	8b 40 04             	mov    0x4(%eax),%eax
  1030c4:	39 c2                	cmp    %eax,%edx
  1030c6:	73 12                	jae    1030da <sprintputch+0x33>
        *b->buf ++ = ch;
  1030c8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030cb:	8b 00                	mov    (%eax),%eax
  1030cd:	8b 55 08             	mov    0x8(%ebp),%edx
  1030d0:	88 10                	mov    %dl,(%eax)
  1030d2:	8d 50 01             	lea    0x1(%eax),%edx
  1030d5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030d8:	89 10                	mov    %edx,(%eax)
    }
}
  1030da:	5d                   	pop    %ebp
  1030db:	c3                   	ret    

001030dc <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  1030dc:	55                   	push   %ebp
  1030dd:	89 e5                	mov    %esp,%ebp
  1030df:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  1030e2:	8d 55 14             	lea    0x14(%ebp),%edx
  1030e5:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1030e8:	89 10                	mov    %edx,(%eax)
    cnt = vsnprintf(str, size, fmt, ap);
  1030ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1030ed:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1030f1:	8b 45 10             	mov    0x10(%ebp),%eax
  1030f4:	89 44 24 08          	mov    %eax,0x8(%esp)
  1030f8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030fb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030ff:	8b 45 08             	mov    0x8(%ebp),%eax
  103102:	89 04 24             	mov    %eax,(%esp)
  103105:	e8 08 00 00 00       	call   103112 <vsnprintf>
  10310a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10310d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103110:	c9                   	leave  
  103111:	c3                   	ret    

00103112 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  103112:	55                   	push   %ebp
  103113:	89 e5                	mov    %esp,%ebp
  103115:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  103118:	8b 45 08             	mov    0x8(%ebp),%eax
  10311b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10311e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103121:	83 e8 01             	sub    $0x1,%eax
  103124:	03 45 08             	add    0x8(%ebp),%eax
  103127:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10312a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  103131:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  103135:	74 0a                	je     103141 <vsnprintf+0x2f>
  103137:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10313a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10313d:	39 c2                	cmp    %eax,%edx
  10313f:	76 07                	jbe    103148 <vsnprintf+0x36>
        return -E_INVAL;
  103141:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  103146:	eb 2a                	jmp    103172 <vsnprintf+0x60>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  103148:	8b 45 14             	mov    0x14(%ebp),%eax
  10314b:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10314f:	8b 45 10             	mov    0x10(%ebp),%eax
  103152:	89 44 24 08          	mov    %eax,0x8(%esp)
  103156:	8d 45 ec             	lea    -0x14(%ebp),%eax
  103159:	89 44 24 04          	mov    %eax,0x4(%esp)
  10315d:	c7 04 24 a7 30 10 00 	movl   $0x1030a7,(%esp)
  103164:	e8 49 fb ff ff       	call   102cb2 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  103169:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10316c:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  10316f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103172:	c9                   	leave  
  103173:	c3                   	ret    

00103174 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  103174:	55                   	push   %ebp
  103175:	89 e5                	mov    %esp,%ebp
  103177:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  10317a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  103181:	eb 04                	jmp    103187 <strlen+0x13>
        cnt ++;
  103183:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  103187:	8b 45 08             	mov    0x8(%ebp),%eax
  10318a:	0f b6 00             	movzbl (%eax),%eax
  10318d:	84 c0                	test   %al,%al
  10318f:	0f 95 c0             	setne  %al
  103192:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103196:	84 c0                	test   %al,%al
  103198:	75 e9                	jne    103183 <strlen+0xf>
        cnt ++;
    }
    return cnt;
  10319a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10319d:	c9                   	leave  
  10319e:	c3                   	ret    

0010319f <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  10319f:	55                   	push   %ebp
  1031a0:	89 e5                	mov    %esp,%ebp
  1031a2:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  1031a5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  1031ac:	eb 04                	jmp    1031b2 <strnlen+0x13>
        cnt ++;
  1031ae:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  1031b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1031b5:	3b 45 0c             	cmp    0xc(%ebp),%eax
  1031b8:	73 13                	jae    1031cd <strnlen+0x2e>
  1031ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1031bd:	0f b6 00             	movzbl (%eax),%eax
  1031c0:	84 c0                	test   %al,%al
  1031c2:	0f 95 c0             	setne  %al
  1031c5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1031c9:	84 c0                	test   %al,%al
  1031cb:	75 e1                	jne    1031ae <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  1031cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1031d0:	c9                   	leave  
  1031d1:	c3                   	ret    

001031d2 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  1031d2:	55                   	push   %ebp
  1031d3:	89 e5                	mov    %esp,%ebp
  1031d5:	57                   	push   %edi
  1031d6:	56                   	push   %esi
  1031d7:	53                   	push   %ebx
  1031d8:	83 ec 24             	sub    $0x24,%esp
  1031db:	8b 45 08             	mov    0x8(%ebp),%eax
  1031de:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1031e1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031e4:	89 45 ec             	mov    %eax,-0x14(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  1031e7:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1031ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1031ed:	89 d6                	mov    %edx,%esi
  1031ef:	89 c3                	mov    %eax,%ebx
  1031f1:	89 df                	mov    %ebx,%edi
  1031f3:	ac                   	lods   %ds:(%esi),%al
  1031f4:	aa                   	stos   %al,%es:(%edi)
  1031f5:	84 c0                	test   %al,%al
  1031f7:	75 fa                	jne    1031f3 <strcpy+0x21>
  1031f9:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1031fc:	89 fb                	mov    %edi,%ebx
  1031fe:	89 75 e8             	mov    %esi,-0x18(%ebp)
  103201:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
  103204:	8b 45 d0             	mov    -0x30(%ebp),%eax
  103207:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  10320a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  10320d:	83 c4 24             	add    $0x24,%esp
  103210:	5b                   	pop    %ebx
  103211:	5e                   	pop    %esi
  103212:	5f                   	pop    %edi
  103213:	5d                   	pop    %ebp
  103214:	c3                   	ret    

00103215 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  103215:	55                   	push   %ebp
  103216:	89 e5                	mov    %esp,%ebp
  103218:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  10321b:	8b 45 08             	mov    0x8(%ebp),%eax
  10321e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  103221:	eb 21                	jmp    103244 <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  103223:	8b 45 0c             	mov    0xc(%ebp),%eax
  103226:	0f b6 10             	movzbl (%eax),%edx
  103229:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10322c:	88 10                	mov    %dl,(%eax)
  10322e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103231:	0f b6 00             	movzbl (%eax),%eax
  103234:	84 c0                	test   %al,%al
  103236:	74 04                	je     10323c <strncpy+0x27>
            src ++;
  103238:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  10323c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  103240:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  103244:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103248:	75 d9                	jne    103223 <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  10324a:	8b 45 08             	mov    0x8(%ebp),%eax
}
  10324d:	c9                   	leave  
  10324e:	c3                   	ret    

0010324f <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  10324f:	55                   	push   %ebp
  103250:	89 e5                	mov    %esp,%ebp
  103252:	57                   	push   %edi
  103253:	56                   	push   %esi
  103254:	53                   	push   %ebx
  103255:	83 ec 24             	sub    $0x24,%esp
  103258:	8b 45 08             	mov    0x8(%ebp),%eax
  10325b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10325e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103261:	89 45 ec             	mov    %eax,-0x14(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  103264:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103267:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10326a:	89 d6                	mov    %edx,%esi
  10326c:	89 c3                	mov    %eax,%ebx
  10326e:	89 df                	mov    %ebx,%edi
  103270:	ac                   	lods   %ds:(%esi),%al
  103271:	ae                   	scas   %es:(%edi),%al
  103272:	75 08                	jne    10327c <strcmp+0x2d>
  103274:	84 c0                	test   %al,%al
  103276:	75 f8                	jne    103270 <strcmp+0x21>
  103278:	31 c0                	xor    %eax,%eax
  10327a:	eb 04                	jmp    103280 <strcmp+0x31>
  10327c:	19 c0                	sbb    %eax,%eax
  10327e:	0c 01                	or     $0x1,%al
  103280:	89 fb                	mov    %edi,%ebx
  103282:	89 45 d0             	mov    %eax,-0x30(%ebp)
  103285:	8b 45 d0             	mov    -0x30(%ebp),%eax
  103288:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10328b:	89 75 e4             	mov    %esi,-0x1c(%ebp)
  10328e:	89 5d e0             	mov    %ebx,-0x20(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  103291:	8b 45 e8             	mov    -0x18(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  103294:	83 c4 24             	add    $0x24,%esp
  103297:	5b                   	pop    %ebx
  103298:	5e                   	pop    %esi
  103299:	5f                   	pop    %edi
  10329a:	5d                   	pop    %ebp
  10329b:	c3                   	ret    

0010329c <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  10329c:	55                   	push   %ebp
  10329d:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  10329f:	eb 0c                	jmp    1032ad <strncmp+0x11>
        n --, s1 ++, s2 ++;
  1032a1:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  1032a5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1032a9:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1032ad:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1032b1:	74 1a                	je     1032cd <strncmp+0x31>
  1032b3:	8b 45 08             	mov    0x8(%ebp),%eax
  1032b6:	0f b6 00             	movzbl (%eax),%eax
  1032b9:	84 c0                	test   %al,%al
  1032bb:	74 10                	je     1032cd <strncmp+0x31>
  1032bd:	8b 45 08             	mov    0x8(%ebp),%eax
  1032c0:	0f b6 10             	movzbl (%eax),%edx
  1032c3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032c6:	0f b6 00             	movzbl (%eax),%eax
  1032c9:	38 c2                	cmp    %al,%dl
  1032cb:	74 d4                	je     1032a1 <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  1032cd:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1032d1:	74 1a                	je     1032ed <strncmp+0x51>
  1032d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1032d6:	0f b6 00             	movzbl (%eax),%eax
  1032d9:	0f b6 d0             	movzbl %al,%edx
  1032dc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032df:	0f b6 00             	movzbl (%eax),%eax
  1032e2:	0f b6 c0             	movzbl %al,%eax
  1032e5:	89 d1                	mov    %edx,%ecx
  1032e7:	29 c1                	sub    %eax,%ecx
  1032e9:	89 c8                	mov    %ecx,%eax
  1032eb:	eb 05                	jmp    1032f2 <strncmp+0x56>
  1032ed:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1032f2:	5d                   	pop    %ebp
  1032f3:	c3                   	ret    

001032f4 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  1032f4:	55                   	push   %ebp
  1032f5:	89 e5                	mov    %esp,%ebp
  1032f7:	83 ec 04             	sub    $0x4,%esp
  1032fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032fd:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  103300:	eb 14                	jmp    103316 <strchr+0x22>
        if (*s == c) {
  103302:	8b 45 08             	mov    0x8(%ebp),%eax
  103305:	0f b6 00             	movzbl (%eax),%eax
  103308:	3a 45 fc             	cmp    -0x4(%ebp),%al
  10330b:	75 05                	jne    103312 <strchr+0x1e>
            return (char *)s;
  10330d:	8b 45 08             	mov    0x8(%ebp),%eax
  103310:	eb 13                	jmp    103325 <strchr+0x31>
        }
        s ++;
  103312:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  103316:	8b 45 08             	mov    0x8(%ebp),%eax
  103319:	0f b6 00             	movzbl (%eax),%eax
  10331c:	84 c0                	test   %al,%al
  10331e:	75 e2                	jne    103302 <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  103320:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103325:	c9                   	leave  
  103326:	c3                   	ret    

00103327 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  103327:	55                   	push   %ebp
  103328:	89 e5                	mov    %esp,%ebp
  10332a:	83 ec 04             	sub    $0x4,%esp
  10332d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103330:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  103333:	eb 0f                	jmp    103344 <strfind+0x1d>
        if (*s == c) {
  103335:	8b 45 08             	mov    0x8(%ebp),%eax
  103338:	0f b6 00             	movzbl (%eax),%eax
  10333b:	3a 45 fc             	cmp    -0x4(%ebp),%al
  10333e:	74 10                	je     103350 <strfind+0x29>
            break;
        }
        s ++;
  103340:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  103344:	8b 45 08             	mov    0x8(%ebp),%eax
  103347:	0f b6 00             	movzbl (%eax),%eax
  10334a:	84 c0                	test   %al,%al
  10334c:	75 e7                	jne    103335 <strfind+0xe>
  10334e:	eb 01                	jmp    103351 <strfind+0x2a>
        if (*s == c) {
            break;
  103350:	90                   	nop
        }
        s ++;
    }
    return (char *)s;
  103351:	8b 45 08             	mov    0x8(%ebp),%eax
}
  103354:	c9                   	leave  
  103355:	c3                   	ret    

00103356 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  103356:	55                   	push   %ebp
  103357:	89 e5                	mov    %esp,%ebp
  103359:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  10335c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  103363:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  10336a:	eb 04                	jmp    103370 <strtol+0x1a>
        s ++;
  10336c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  103370:	8b 45 08             	mov    0x8(%ebp),%eax
  103373:	0f b6 00             	movzbl (%eax),%eax
  103376:	3c 20                	cmp    $0x20,%al
  103378:	74 f2                	je     10336c <strtol+0x16>
  10337a:	8b 45 08             	mov    0x8(%ebp),%eax
  10337d:	0f b6 00             	movzbl (%eax),%eax
  103380:	3c 09                	cmp    $0x9,%al
  103382:	74 e8                	je     10336c <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  103384:	8b 45 08             	mov    0x8(%ebp),%eax
  103387:	0f b6 00             	movzbl (%eax),%eax
  10338a:	3c 2b                	cmp    $0x2b,%al
  10338c:	75 06                	jne    103394 <strtol+0x3e>
        s ++;
  10338e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103392:	eb 15                	jmp    1033a9 <strtol+0x53>
    }
    else if (*s == '-') {
  103394:	8b 45 08             	mov    0x8(%ebp),%eax
  103397:	0f b6 00             	movzbl (%eax),%eax
  10339a:	3c 2d                	cmp    $0x2d,%al
  10339c:	75 0b                	jne    1033a9 <strtol+0x53>
        s ++, neg = 1;
  10339e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1033a2:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  1033a9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1033ad:	74 06                	je     1033b5 <strtol+0x5f>
  1033af:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  1033b3:	75 24                	jne    1033d9 <strtol+0x83>
  1033b5:	8b 45 08             	mov    0x8(%ebp),%eax
  1033b8:	0f b6 00             	movzbl (%eax),%eax
  1033bb:	3c 30                	cmp    $0x30,%al
  1033bd:	75 1a                	jne    1033d9 <strtol+0x83>
  1033bf:	8b 45 08             	mov    0x8(%ebp),%eax
  1033c2:	83 c0 01             	add    $0x1,%eax
  1033c5:	0f b6 00             	movzbl (%eax),%eax
  1033c8:	3c 78                	cmp    $0x78,%al
  1033ca:	75 0d                	jne    1033d9 <strtol+0x83>
        s += 2, base = 16;
  1033cc:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  1033d0:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  1033d7:	eb 2a                	jmp    103403 <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  1033d9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1033dd:	75 17                	jne    1033f6 <strtol+0xa0>
  1033df:	8b 45 08             	mov    0x8(%ebp),%eax
  1033e2:	0f b6 00             	movzbl (%eax),%eax
  1033e5:	3c 30                	cmp    $0x30,%al
  1033e7:	75 0d                	jne    1033f6 <strtol+0xa0>
        s ++, base = 8;
  1033e9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1033ed:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  1033f4:	eb 0d                	jmp    103403 <strtol+0xad>
    }
    else if (base == 0) {
  1033f6:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1033fa:	75 07                	jne    103403 <strtol+0xad>
        base = 10;
  1033fc:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  103403:	8b 45 08             	mov    0x8(%ebp),%eax
  103406:	0f b6 00             	movzbl (%eax),%eax
  103409:	3c 2f                	cmp    $0x2f,%al
  10340b:	7e 1b                	jle    103428 <strtol+0xd2>
  10340d:	8b 45 08             	mov    0x8(%ebp),%eax
  103410:	0f b6 00             	movzbl (%eax),%eax
  103413:	3c 39                	cmp    $0x39,%al
  103415:	7f 11                	jg     103428 <strtol+0xd2>
            dig = *s - '0';
  103417:	8b 45 08             	mov    0x8(%ebp),%eax
  10341a:	0f b6 00             	movzbl (%eax),%eax
  10341d:	0f be c0             	movsbl %al,%eax
  103420:	83 e8 30             	sub    $0x30,%eax
  103423:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103426:	eb 48                	jmp    103470 <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  103428:	8b 45 08             	mov    0x8(%ebp),%eax
  10342b:	0f b6 00             	movzbl (%eax),%eax
  10342e:	3c 60                	cmp    $0x60,%al
  103430:	7e 1b                	jle    10344d <strtol+0xf7>
  103432:	8b 45 08             	mov    0x8(%ebp),%eax
  103435:	0f b6 00             	movzbl (%eax),%eax
  103438:	3c 7a                	cmp    $0x7a,%al
  10343a:	7f 11                	jg     10344d <strtol+0xf7>
            dig = *s - 'a' + 10;
  10343c:	8b 45 08             	mov    0x8(%ebp),%eax
  10343f:	0f b6 00             	movzbl (%eax),%eax
  103442:	0f be c0             	movsbl %al,%eax
  103445:	83 e8 57             	sub    $0x57,%eax
  103448:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10344b:	eb 23                	jmp    103470 <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  10344d:	8b 45 08             	mov    0x8(%ebp),%eax
  103450:	0f b6 00             	movzbl (%eax),%eax
  103453:	3c 40                	cmp    $0x40,%al
  103455:	7e 38                	jle    10348f <strtol+0x139>
  103457:	8b 45 08             	mov    0x8(%ebp),%eax
  10345a:	0f b6 00             	movzbl (%eax),%eax
  10345d:	3c 5a                	cmp    $0x5a,%al
  10345f:	7f 2e                	jg     10348f <strtol+0x139>
            dig = *s - 'A' + 10;
  103461:	8b 45 08             	mov    0x8(%ebp),%eax
  103464:	0f b6 00             	movzbl (%eax),%eax
  103467:	0f be c0             	movsbl %al,%eax
  10346a:	83 e8 37             	sub    $0x37,%eax
  10346d:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  103470:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103473:	3b 45 10             	cmp    0x10(%ebp),%eax
  103476:	7d 16                	jge    10348e <strtol+0x138>
            break;
        }
        s ++, val = (val * base) + dig;
  103478:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10347c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10347f:	0f af 45 10          	imul   0x10(%ebp),%eax
  103483:	03 45 f4             	add    -0xc(%ebp),%eax
  103486:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  103489:	e9 75 ff ff ff       	jmp    103403 <strtol+0xad>
        }
        else {
            break;
        }
        if (dig >= base) {
            break;
  10348e:	90                   	nop
        }
        s ++, val = (val * base) + dig;
        // we don't properly detect overflow!
    }

    if (endptr) {
  10348f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103493:	74 08                	je     10349d <strtol+0x147>
        *endptr = (char *) s;
  103495:	8b 45 0c             	mov    0xc(%ebp),%eax
  103498:	8b 55 08             	mov    0x8(%ebp),%edx
  10349b:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  10349d:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  1034a1:	74 07                	je     1034aa <strtol+0x154>
  1034a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1034a6:	f7 d8                	neg    %eax
  1034a8:	eb 03                	jmp    1034ad <strtol+0x157>
  1034aa:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  1034ad:	c9                   	leave  
  1034ae:	c3                   	ret    

001034af <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  1034af:	55                   	push   %ebp
  1034b0:	89 e5                	mov    %esp,%ebp
  1034b2:	57                   	push   %edi
  1034b3:	56                   	push   %esi
  1034b4:	53                   	push   %ebx
  1034b5:	83 ec 24             	sub    $0x24,%esp
  1034b8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034bb:	88 45 d0             	mov    %al,-0x30(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  1034be:	0f be 45 d0          	movsbl -0x30(%ebp),%eax
  1034c2:	8b 55 08             	mov    0x8(%ebp),%edx
  1034c5:	89 55 f0             	mov    %edx,-0x10(%ebp)
  1034c8:	88 45 ef             	mov    %al,-0x11(%ebp)
  1034cb:	8b 45 10             	mov    0x10(%ebp),%eax
  1034ce:	89 45 e8             	mov    %eax,-0x18(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  1034d1:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1034d4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  1034d8:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1034db:	89 ce                	mov    %ecx,%esi
  1034dd:	89 d3                	mov    %edx,%ebx
  1034df:	89 f1                	mov    %esi,%ecx
  1034e1:	89 df                	mov    %ebx,%edi
  1034e3:	f3 aa                	rep stos %al,%es:(%edi)
  1034e5:	89 fb                	mov    %edi,%ebx
  1034e7:	89 ce                	mov    %ecx,%esi
  1034e9:	89 75 e4             	mov    %esi,-0x1c(%ebp)
  1034ec:	89 5d e0             	mov    %ebx,-0x20(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  1034ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  1034f2:	83 c4 24             	add    $0x24,%esp
  1034f5:	5b                   	pop    %ebx
  1034f6:	5e                   	pop    %esi
  1034f7:	5f                   	pop    %edi
  1034f8:	5d                   	pop    %ebp
  1034f9:	c3                   	ret    

001034fa <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  1034fa:	55                   	push   %ebp
  1034fb:	89 e5                	mov    %esp,%ebp
  1034fd:	57                   	push   %edi
  1034fe:	56                   	push   %esi
  1034ff:	53                   	push   %ebx
  103500:	83 ec 38             	sub    $0x38,%esp
  103503:	8b 45 08             	mov    0x8(%ebp),%eax
  103506:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103509:	8b 45 0c             	mov    0xc(%ebp),%eax
  10350c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10350f:	8b 45 10             	mov    0x10(%ebp),%eax
  103512:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  103515:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103518:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10351b:	73 4e                	jae    10356b <memmove+0x71>
  10351d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103520:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  103523:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103526:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103529:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10352c:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  10352f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103532:	89 c1                	mov    %eax,%ecx
  103534:	c1 e9 02             	shr    $0x2,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  103537:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10353a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10353d:	89 4d c0             	mov    %ecx,-0x40(%ebp)
  103540:	89 d7                	mov    %edx,%edi
  103542:	89 c3                	mov    %eax,%ebx
  103544:	8b 4d c0             	mov    -0x40(%ebp),%ecx
  103547:	89 de                	mov    %ebx,%esi
  103549:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10354b:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  10354e:	83 e1 03             	and    $0x3,%ecx
  103551:	74 02                	je     103555 <memmove+0x5b>
  103553:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103555:	89 f3                	mov    %esi,%ebx
  103557:	89 4d c0             	mov    %ecx,-0x40(%ebp)
  10355a:	8b 4d c0             	mov    -0x40(%ebp),%ecx
  10355d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  103560:	89 7d d4             	mov    %edi,-0x2c(%ebp)
  103563:	89 5d d0             	mov    %ebx,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  103566:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103569:	eb 3b                	jmp    1035a6 <memmove+0xac>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  10356b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10356e:	83 e8 01             	sub    $0x1,%eax
  103571:	89 c2                	mov    %eax,%edx
  103573:	03 55 ec             	add    -0x14(%ebp),%edx
  103576:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103579:	83 e8 01             	sub    $0x1,%eax
  10357c:	03 45 f0             	add    -0x10(%ebp),%eax
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  10357f:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  103582:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  103585:	89 d6                	mov    %edx,%esi
  103587:	89 c3                	mov    %eax,%ebx
  103589:	8b 4d bc             	mov    -0x44(%ebp),%ecx
  10358c:	89 df                	mov    %ebx,%edi
  10358e:	fd                   	std    
  10358f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103591:	fc                   	cld    
  103592:	89 fb                	mov    %edi,%ebx
  103594:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  103597:	8b 4d bc             	mov    -0x44(%ebp),%ecx
  10359a:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  10359d:	89 75 c8             	mov    %esi,-0x38(%ebp)
  1035a0:	89 5d c4             	mov    %ebx,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  1035a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  1035a6:	83 c4 38             	add    $0x38,%esp
  1035a9:	5b                   	pop    %ebx
  1035aa:	5e                   	pop    %esi
  1035ab:	5f                   	pop    %edi
  1035ac:	5d                   	pop    %ebp
  1035ad:	c3                   	ret    

001035ae <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  1035ae:	55                   	push   %ebp
  1035af:	89 e5                	mov    %esp,%ebp
  1035b1:	57                   	push   %edi
  1035b2:	56                   	push   %esi
  1035b3:	53                   	push   %ebx
  1035b4:	83 ec 24             	sub    $0x24,%esp
  1035b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1035ba:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1035bd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1035c0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1035c3:	8b 45 10             	mov    0x10(%ebp),%eax
  1035c6:	89 45 e8             	mov    %eax,-0x18(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  1035c9:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1035cc:	89 c1                	mov    %eax,%ecx
  1035ce:	c1 e9 02             	shr    $0x2,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  1035d1:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1035d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1035d7:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  1035da:	89 d7                	mov    %edx,%edi
  1035dc:	89 c3                	mov    %eax,%ebx
  1035de:	8b 4d d0             	mov    -0x30(%ebp),%ecx
  1035e1:	89 de                	mov    %ebx,%esi
  1035e3:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1035e5:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1035e8:	83 e1 03             	and    $0x3,%ecx
  1035eb:	74 02                	je     1035ef <memcpy+0x41>
  1035ed:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1035ef:	89 f3                	mov    %esi,%ebx
  1035f1:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  1035f4:	8b 4d d0             	mov    -0x30(%ebp),%ecx
  1035f7:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  1035fa:	89 7d e0             	mov    %edi,-0x20(%ebp)
  1035fd:	89 5d dc             	mov    %ebx,-0x24(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  103600:	8b 45 f0             	mov    -0x10(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  103603:	83 c4 24             	add    $0x24,%esp
  103606:	5b                   	pop    %ebx
  103607:	5e                   	pop    %esi
  103608:	5f                   	pop    %edi
  103609:	5d                   	pop    %ebp
  10360a:	c3                   	ret    

0010360b <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  10360b:	55                   	push   %ebp
  10360c:	89 e5                	mov    %esp,%ebp
  10360e:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  103611:	8b 45 08             	mov    0x8(%ebp),%eax
  103614:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  103617:	8b 45 0c             	mov    0xc(%ebp),%eax
  10361a:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  10361d:	eb 32                	jmp    103651 <memcmp+0x46>
        if (*s1 != *s2) {
  10361f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103622:	0f b6 10             	movzbl (%eax),%edx
  103625:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103628:	0f b6 00             	movzbl (%eax),%eax
  10362b:	38 c2                	cmp    %al,%dl
  10362d:	74 1a                	je     103649 <memcmp+0x3e>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  10362f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103632:	0f b6 00             	movzbl (%eax),%eax
  103635:	0f b6 d0             	movzbl %al,%edx
  103638:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10363b:	0f b6 00             	movzbl (%eax),%eax
  10363e:	0f b6 c0             	movzbl %al,%eax
  103641:	89 d1                	mov    %edx,%ecx
  103643:	29 c1                	sub    %eax,%ecx
  103645:	89 c8                	mov    %ecx,%eax
  103647:	eb 1c                	jmp    103665 <memcmp+0x5a>
        }
        s1 ++, s2 ++;
  103649:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10364d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  103651:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103655:	0f 95 c0             	setne  %al
  103658:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10365c:	84 c0                	test   %al,%al
  10365e:	75 bf                	jne    10361f <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  103660:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103665:	c9                   	leave  
  103666:	c3                   	ret    
