# Clangd™

## 第一步, 生成编译选项数据库

### Makefile项目

```
#预装compilation-database
pip install compiledb

#项目中执行, 生成compile_commands.json
compiledb make -C .   
```

## 第二步, 编辑器适配
### VSCODE + Clangd

*备注*

1. 关闭ms-vscode.cpptools插件

## 参考资料

1. [langserver.org](https://langserver.org/)
2. [Implementations Language Servers](https://microsoft.github.io/language-server-protocol/implementors/servers/)
3. [Compilation database](https://sarcasm.github.io/notes/dev/compilation-database.html#compilation-database)
4. [What is clangd?](https://clangd.llvm.org/)
5. [Extra Clang Tools 5 documentation](https://releases.llvm.org/5.0.0/tools/clang/tools/extra/docs/index.html)

