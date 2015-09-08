有关LLVM
=====

----------

- Linux下源码编译

	> $git clone [http://llvm.org/git/llvm.git](http://llvm.org/git/llvm.git)
	
	> $cd llvm/tools
	
	> $git clone [http://llvm.org/git/clang.git](http://llvm.org/git/clang.git)
	
	> $cd clang/tools
	
	> $git clone [http://llvm.org/git/clang-tools-extra.git](http://llvm.org/git/clang-tools-extra.git) extra
	
	> $cd ../../llvm/projects
	
	> $git clone [http://llvm.org/git/compiler-rt.git](http://llvm.org/git/compiler-rt.git)

	> $ git clone [http://llvm.org/git/llvm-project/test-suite.git](http://llvm.org/git/llvm-project/test-suite.git)   #测试套，可选

	> $cd ../llvm/tools
	
	> $git clone http://llvm.org/git/llvm-project/lldb.git #低级别调试器，可选
	
	> $mkdir where-you-want-to-install	#安装目录
	
	> $mkdir where-you-want-to-build		#编译目录
	
	> $cd where-you-want-to-build
	
	> $/PATH_TO_SOURCE/configure --disable-optimized --prefix=../where-youwant-to-install  #--enable-optimized(off),--enable-assertions(on),--enable-shared(off),--enable-jit(on),--enable-targets(all)
	
	> $make && make install				#开始编译
	
	> $echo $?    #返回0.表明编译成功
	
	> $export PATH="$PATH:where-you-want-to-install/bin"		#加到PATH环境变量中
	
	> $clang –v

- Windows下源码编译
	> 下载源码，同上

	> 下载[cmake-3.3.1-win32-x86.exe](http://www.cmake.org/files/v3.3/cmake-3.3.1-win32-x86.exe)，安装cmake

	> 打开cmake GUI， ADD Entry。 CMAKE_INSTALL_PREFIX等同于--prefix；LLVM_TARGETS_
TO_BUILD("ARM;Mips;X86")等同于--enable-targets

----------

- Mac OS X下源码编译
	> 比windows,cmake多一个变量LLVM\_ENABLE\_PIC

----------


- Clang
	- 多语言前端（multiple language front-ends）
	- 语言级别静态优化（Static Optimizer）
	- 虚拟指令集（virtual instruction set）
		- 虚拟寄存器Static Single Assignment（SSA）
	- 抽象语法树（AST）
	- 选项
		- -fsanitize=address
	- extras工具
		- Clang Check：语法检查，输出AST
		- Clang Format: 代码格式化
		- Clang Modernizer: C++11风格
		- Clang Tidy: Google代码风格检查
		- Modularize: 模块化
		- PPTrace: C++预编译跟踪 
	- 流程分析
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