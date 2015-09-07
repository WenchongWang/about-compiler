有关LLVM
=====

- 源码编译

> git clone [http://llvm.org/git/llvm.git](http://llvm.org/git/llvm.git)

> cd llvm/tools

> git clone [http://llvm.org/git/clang.git](http://llvm.org/git/clang.git)

> cd llvm/projects

> git clone [http://llvm.org/git/compiler-rt.git](http://llvm.org/git/compiler-rt.git) #侦测工具

- Clang
	- 多语言前端（multiple language front-ends）
	- 语言级别静态优化（Static Optimizer）
	- 虚拟指令集（virtual instruction set）
		- 虚拟寄存器Static Single Assignment（SSA）
	- 抽象语法树（AST）
	- 选项
		- -fsanitize=address
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