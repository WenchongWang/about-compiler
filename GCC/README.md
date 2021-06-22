# 有关GCC

---

## 一. 编译GCC, [gitee](https://gitee.com/mirrors/gcc)

## 二. 编译选项, [详细参考:GCC Command Options](https://gcc.gnu.org/onlinedocs/gcc/Invoking-GCC.html)
	-D，定义命令宏
		//-DDEBUG相当于#define DEBUG
		#ifdef DEBUG
			printf("this code is for debugging\n");
		#endif
	
	-S，输出汇编文件
	-std，指定标准，例如-std=c99
	-O，指定优化级别，例如-O2,-Os
	-l，链接静态库，例如myprintf.a静态库，-lmyprintf
	-L, 指定库搜索路径
	-static, 静态库和共享库同名时，优先使用静态库

## 三. 探索GCC

## 四. 参考资料
1. [GCC online documentation](https://gcc.gnu.org/onlinedocs/)
1. [GNU Compiler Collection (GCC) Internals](https://gcc.gnu.org/onlinedocs/gccint/)
1. [GCC Command Options](https://gcc.gnu.org/onlinedocs/gcc/Invoking-GCC.html)
1. [Introduction to GCC, 中文名:GCC编程简介 作者:Brian Gough](https://share.weiyun.com/GFn5XIaC)
1. [The Definitive Guide to GCC]()
1. [The Complete Reference GCC]()
1. [The GNU C Library Reference Manual.pdf](http://www.gnu.org/software/libc/manual/pdf/libc.pdf)
1. [GCC and Make Compiling, Linking and Building C/C++ Applications, ehchua个人博客, 还包含比较多notes](https://personal.ntu.edu.sg/ehchua/programming/cpp/gcc_make.html) 
1. [GDB: The GNU Project Debugger](https://sourceware.org/gdb/current/onlinedocs/)
1. [compile cpp11 online](https://www.tutorialspoint.com/compile_cpp11_online.php)
1. [hellogcc/100-gcc-tips](https://github.com/hellogcc/100-gcc-tips)
1. [The 101 of ELF files on Linux: Understanding and Analysis](https://linux-audit.com/elf-binaries-on-linux-understanding-and-analysis/)