# 有关ELF #
## ELF文件格式 ##
- 显示所有节表信息，objdump -s bin
- 全部符号表.symtab和动态链接时需要的动态符号表.dynsym(动态加载的可执行文件)，readelf -s bin
- 显示重定位节信息，readelf -r bin
	- .rela.dyn节和.rela.plt节（动态加载的可执行文件）或使用objdump -R bin
	- .rela.plt节（静态编译的可执行文件）
	- .rela.text节和.rela.eh_frame节（目标文件.o）
- .interp段指向的解释器所需要的信息.dynamic（动态加载的可执行文件），readelf -d bin或objdump -T bin

*备注：*

- 静态编译的可执行文件，gcc -static，无需.interp、.dynamic、.rela.dyn段
- 链接相关：-static静态编译参数，-nostdlib不链接标准库
- .shstrtab节存放着所有节名称
- .symtab节存放的符号表，不是标准的字符串,不能使用readelf -p.symtab bin，而要使用-s或objdump -t bin

## 连接：生成ELF ##
## 加载：加载ELF ##
- sys\_execve
	- do\_execve
		- do\_execveat_common
			- do\_open_execat
			- sched\_exec
			- bprm\_mm_init，**初始化linux\_binprm数据结构**
			- exec\_binprm
				- search\_binary_handler
					- list\_for\_each_entry(fmt, &formats, lh) {，//遍历formats,
						- fmt->load_binary(bprm)，**加载linux\_binfmt数据结构**
							- case ELF：load\_elf_library
								- kernel_read从file读取ELF头部elfhdr
		
										typedef struct
										{
										  		unsigned char e_ident[EI_NIDENT];     /* 魔数和相关信息 */
										  		Elf32_Half    e_type;                 /* 目标文件类型 */
										  		Elf32_Half    e_machine;              /* 硬件体系 */
										  		Elf32_Word    e_version;              /* 目标文件版本 */
										  		Elf32_Addr    e_entry;                /* 程序进入点 */
										  		Elf32_Off     e_phoff;                /* 程序头部偏移量 */
										  		Elf32_Off     e_shoff;                /* 节头部偏移量 */
										  		Elf32_Word    e_flags;                /* 处理器特定标志 */
										  		Elf32_Half    e_ehsize;               /* ELF头部长度 */
										  		Elf32_Half    e_phentsize;            /* 程序头部中一个条目的长度 */
										  		Elf32_Half    e_phnum;                /* 程序头部条目个数  */
										  		Elf32_Half    e_shentsize;            /* 节头部中一个条目的长度 */
										  		Elf32_Half    e_shnum;                /* 节头部条目个数 */
										  		Elf32_Half    e_shstrndx;             /* 节头部字符表索引 */
										} Elf32_Ehdr;

								- 校验ELF头部信息
								- elf_phdr段表数据结构申请空间
								- kernel\_read从file偏移e_phoff读取段表信息()
								
										typedef struct {
									      Elf32_Word  p_type;				/* 段类型 */
									      Elf32_Off   p_offset;     	 	/* 段位置相对于文件开始处的偏移量 */
									      Elf32_Addr  p_vaddr;   			/* 段在内存中的地址 */
									      Elf32_Addr  p_paddr;   			/* 段的物理地址 */
									      Elf32_Word  p_filesz;				/* 段在文件中的长度 */
									      Elf32_Word  p_memsz;				/* 段在内存中的长度 */
									      Elf32_Word  p_flags;				/* 段的标记 */
									      Elf32_Word  p_align;				/* 段在内存中对齐标记 */
									  } Elf32_Phdr;

								- vm_mmap映射到内存
					- put_binfmt	
- struct linux_binprm数据结构，存放可执行关键数据
- struct linux_binfmt数据结构，存放解释器关键数据
	- elf\_format，elf解释器
		- module		= THIS_MODULE,
		- .load\_binary	= **load\_elf_binary**,
		- .load\_shlib	= load\_elf_library,
		- .core\_dump	= elf\_core_dump,
		- .min\_coredump	= ELF\_EXEC_PAGESIZE,
- register_binfmt,注册binfmt