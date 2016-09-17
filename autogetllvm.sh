#!/bin/sh
#############################################
#         自动下载llvm及clang项目           #
############################################

##安装git
if [ -f /usr/bin/git ]; then
	echo "founding git"
else
	echo "installing git"
	sudo apt-get install git
fi 

##git库信息
llvm_git="http://llvm.org/git/llvm.git"
clang_git="http://llvm.org/git/clang.git"
tools_extra_git="http://llvm.org/git/clang-tools-extra.git"
compiler_rt_git="http://llvm.org/git/compiler-rt.git"
lldb_git="https://github.com/llvm-mirror/lldb.git"
dragonegg_git="https://github.com/llvm-mirror/dragonegg.git"
libcxx_git="https://github.com/llvm-mirror/libcxx.git"
modules="$llvm_git $clang_git $tools_extra_git $compiler_rt_git $lldb_git $dragonegg_git $libcxx_git"

##当前目录下创建src
if [ -e $PWD/src ]
then
	echo "founding $PWD/src"
else
	echo "mkdir $PWD/src"
	mkdir $PWD/src
fi
cd $PWD/src
echo "cd $PWD"

#                  目录层次                                                            git依赖关系
#	llvm										<-git
#		|tools
#			|clang								  <-git
#				tools
#					|extra or clang-tools-extra			    <-git
#		|projects
#			|lldb							          <-git
#			|test-suite							  <-git
#			|libcxxabi							  <-git
#			|libcxx								  <-git
#                       |dragonegg                                                        <-git
#                       |compiler-rt                                                      <-git

##并发克隆git库
for i in $modules
do
{
	echo "git clone $i"
	git clone $i
}&
done
wait
echo "finish clone!"

##调整目录层次
cp -r ./clang ./llvm/tools/
cp -r ./clang-tools-extra ./llvm/tools/clang/tools/
cp -r ./lldb ./llvm/projects/
cp -r ./dragonegg ./llvm/projects/
cp -r ./libcxx ./llvm/projects/
cp -r ./compiler-rt ./llvm/projects/

exit 0
