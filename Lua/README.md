
# 有关Lua/LuaJIT™

## 一. Lua基本语法

![](有关Lua.png)

## 二. Lua源码分析

![](Lua语言架构图.jpg)

### Lua源码结构

*虚拟机核心*

| 文件 | 作用     | 重要函数 |
| :---- | ---- | ---- |
| lua.c | lua主程入口 | main |
| lapi.c | C语言接口 | lua_pcallk |
| ldebug.c |      |      |
| ldo.c | | luaD_pcall<br />luaD_rawrunprotected<br />luaD_closeprotected |
| lfunc.c | | |
| lgc.c | | |
| lmem.c | | luaM_malloc_ |
| lobject.c | | |
| lopcodes.c | | |
| lstate.c | 全局状态机 | lua_newstate<br />stack_init |
| lstring.c | 字符串函数 | luaS_hash |
| ltable.c | | |
| ltm.c | | |
| lvm.c | | |
| lzio.c | | |
| | | |

*源代码解析和预编译*

*内嵌库*

## 三. LuaJIT源码分析

## 参考资料

1. 官网 [http://www.lua.org/](http://www.lua.org/)
2. [lua教程](https://www.runoob.com/lua/lua-tutorial.html)
3. [Lua 5.3 参考手册](https://www.runoob.com/manual/lua53doc/contents.html)
4. [Lua程序设计](http://www.mianshigee.com/tutorial/LuaBook/)
5. [Lua在线运行](https://www.runoob.com/try/runcode.php?filename=HelloWorld&type=lua)
6. [Azure/golua](https://github.com/Azure/golua)
7. [yuin/gopher-lua](https://github.com/yuin/gopher-lua)
8. [zxh0/lua.go](https://github.com/zxh0/lua.go)
9. [Shopify/go-lua](https://github.com/Shopify/go-lua)
10. [Lua Performance Tips By Roberto Ierusalimschy](http://www.lua.org/gems/sample.pdf)

