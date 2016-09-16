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
lldb_git="http://llvm.org/git/llvm-project/lldb.git"
modules="$llvm_git $clang_git $tools_extra_git $compiler_rt_git $lldb_git"
for i in $modules
do
	echo "git clone $i"
done
