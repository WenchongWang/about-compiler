#有关LLVM

##一、编译与安装
###1、Linux下源码编译

	$ git clone [http://llvm.org/git/llvm.git](http://llvm.org/git/llvm.git)
	$ cd llvm/tools
	$ git clone [http://llvm.org/git/clang.git](http://llvm.org/git/clang.git)
	$ cd clang/tools
	$ git clone [http://llvm.org/git/clang-tools-extra.git](http://llvm.org/git/clang-tools-extra.git) extra
	$ cd ../../llvm/projects
	$ git clone [http://llvm.org/git/compiler-rt.git](http://llvm.org/git/compiler-rt.git)
	$ git clone [http://llvm.org/git/llvm-project/test-suite.git](http://llvm.org/git/llvm-project/test-suite.git)   #测试套，可选
	$ cd ../llvm/tools
	$ git clone http://llvm.org/git/llvm-project/lldb.git #低级别调试器，可选
	$ mkdir where-you-want-to-install	#安装目录
	$ mkdir where-you-want-to-build		#编译目录
	$ cd where-you-want-to-build
	$ /PATH_TO_SOURCE/configure --disable-optimized --prefix=../where-youwant-to-install  #--enable-optimized(off),--enable-assertions(on),--enable-shared(off),--enable-jit(on),--enable-targets(all)
	$ make && make install				#开始编译
	$ echo $?    #返回0.表明编译成功
	$ export PATH="$PATH:where-you-want-to-install/bin"		#加到PATH环境变量中
	$ clang –v

###2、Windows下源码编译
	下载源码，同上
	下载[cmake-3.3.1-win32-x86.exe](http://www.cmake.org/files/v3.3/cmake-3.3.1-win32-x86.exe)，安装cmake
	打开cmake GUI， ADD Entry。 CMAKE_INSTALL_PREFIX等同于--prefix；LLVM_TARGETS_TO_BUILD("ARM;Mips;X86")等同于--enable-targets

###3、Mac OS X下源码编译
	比windows,cmake多一个变量LLVM\_ENABLE\_PIC



##二、Clang

###1、Clang由各个库组成的逻辑结构，参考["Clang" CFE Internals Manual](http://clang.llvm.org/docs/InternalsManual.html#basic-blocks)

- **LLVM Support Library**

		提供基本的库和数据结构，包括命令行选项处理、各种容器、系统抽象层和文件系统操作

- **The Clang “Basic” Library**
	
		这个“基本”库包含了跟踪和操作代码缓存，源码缓存区中的定位，诊断，序列，目标抽取，和被编译的编程语言的子集的相关信息这
        一系列的底层公共操作。这个库的一部分是特别针对C语言的（比如TargetInfo类），剩下的部分可以被其他的不是基于C的编程语
		言重用（SourceLocation, SourceManager, Diagnostics, FileManager）。

- **诊断字系统（Diagnostics）**
	- **Diagnostic、DiagnosticConsumer类**
		- SourceLocation、SourceManager类
		- SourceManager类用于加载和缓存源代码
- **The Driver Library**
- **Precompiled Headers**
- **The Frontend Library**
- **The Lexer and Preprocessor Library**
	
		token分为：
			1、正常token 
			2、注解token


	- Preprocessor类
	- Token类
	- TokenLexer类
	- Lexer类
	- MultipleIncludeOpt类
	- The Parser Library
		- parser类
	- The AST Library
		- Type类及其子类
		- ASTContext类
		- QualType类
		- DeclarationName类
		- DeclContext类
		- CFG类
		
					源码级控制流图，专用于语句(Stmt\*),通常用于函数体CompoundStmt，通过查找“: public Stmt”可以找到所有
					的子类语句

			- 基本块 
			
					是一个只能从它的第一条指令进入，并从最后一条指令离开的最长的指令序列。

				- CFGBlock
			- 进入和出去块
				- null
			- 条件控制流
				- null   
- **The Sema Library**

		该库被Parser库调用用于作语义分析，输出AST

- **The CodeGen Library**

		输入AST输出LLVM IR

- 多语言前端（multiple language front-ends）
- 语言级别静态优化（Static Optimizer）
- 虚拟指令集（virtual instruction set）
	- 虚拟寄存器Static Single Assignment（SSA）
- 抽象语法树（AST）
- 选项（Options.td定义）
	- -###	打印clang driver Parse阶段命令行参数，参考：[Driver Design & Internals](http://clang.llvm.org/docs/DriverInternals.html)
	- -ccc-print-phases 打印clang driver Pipeline阶段信息
	- -ccc-print-bindings 打印clang driver Bind阶段各工具链及输入输出文件
	- --driver-mode=cl 等同于clang-cl，兼容VC
	- emit-llvm 生成.ll中间语言文件
	- -fsanitize=address
	- -fsyntax-only 语法检查
- 用例
	- ..\clang.exe  "-cc1" "-triple" "i686-pc-windows-msvc" "-emit-obj" "-mrelax-all" "-disable-free" "-main-file-name" "hello.c" "-mrelocation-model" "static" "-mthread-model" "posix" "-mdisable-fp-elim" "-relaxed-aliasing" "-fmath-errno" "-masm-verbose" "-mconstructor-aliases" "-target-cpu" "pentium4" "-D_MT" "--dependent-lib=libcmt" "--dependent-lib=oldnames" "-fdiagnostics-format" "msvc" "-dwarf-column-info" "-resource-dir" "D:\\LLVM\\bin\\..\\lib\\clang\\3.6.0" "-internal-isystem" "D:\\LLVM\\bin\\..\\lib\\clang\\3.6.0\\include" "-internal-isystem" "D:\\Microsoft Visual Studio 12.0\\VC\\include" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\8.1\\include\\shared" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\8.1\\include\\um" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\8.1\\include\\winrt" "-fdebug-compilation-dir" "D:\\LLVM\\bin\\test" "-ferror-limit" "19" "-mstackrealign" "-fms-extensions" "-fms-compatibility" "-fms-compatibility-version=17.00" "-fdelayed-template-parsing" "-fcolor-diagnostics" "-o" "C:\\Users\\mac\\AppData\\Local\\Temp\\hello-b2de2c.obj" "-x" "c" "hello.c" "-S" "-emit-llvm-bc" "-o" "hello.BC"
- extras工具
	- Clang Check：语法检查，输出AST
	- Clang Format: 代码格式化
	- Clang Modernizer: C++11风格
	- Clang Tidy: Google代码风格检查
	- Modularize: 模块化
	- PPTrace: C++预编译跟踪 
- 
- 流程分析

    ```
    graph TD
    A(main) --> B(cc1_main)
    A[main] --> C
    ```

	- 词法分析
		- class Sema
		- class Parser
			- Preprocessor &PP
			- Token Tok
		- class Preprocessor词法分析和预处理
			- Lex() 
	- 语法分析
		- ParseTopLevelDecl
			- ParseExternalDeclaration
			    - ParseDeclaration
			    	- 获取token类型
				    	- **case 模板、导出：**
				    		- ParseDeclarationStartingWithTemplate
				    	- **case 内联：**
				    		- ParseSimpleDeclaration
				    	- **case 名字空间：**
				    		- ParseNamespace
				    	- **case using：**
				    		- ParseUsingDirectiveOrDeclaration
				    	- **case assert：**
				    		- ParseStaticAssertDeclaration
						- **case 其他：**
				    		- ParseSimpleDeclaration
					- ConvertDeclToDeclGroup			    		
			    		
				- **case 未知：** ParseDeclarationOrFunctionDefinition
					- ParseDeclOrFunctionDefInternal
						- ParseDeclGroup			
							- ActOnDeclarator
								- HandleDeclarator
									- or ActOnTypedefDeclarator
									- or ActOnFunctionDeclarator
									- or ActOnVariableDeclarator
							- **函数定义**ParseFunctionDefinition
								- ParseFunctionDefinition
									- ParseCompoundStatementBody
										- ParseStatementOrDeclaration
											- ParseStatementOrDeclarationAfterAttributes
												- **case if语句**
													- ParseIfStatement
												- **case 其他语句**
													- Pasese_XX_Statement
													
	- **代码生成，**HandleTopLevelDecl
	


----------
									
- LLVM
	- bytecode
	- Three-address code
		- 算术操作arithmetic
		- 逻辑操作logical
	- Run-time optimization
	- Just-In-Time (JIT)
	- Multi-stage Optimization
	- native code
	
- Run Time
   - Profile
   		- 热点函数（hot functions）
   		- 循环（loops）
   		- 关键路径（hot paths）
   - Reoptimization
   		- offline reoptimizer


- 类索引
	- FileEntry类，文件
	- Token类，标记