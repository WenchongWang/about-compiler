# 微软Vcpkg包管理工具

---

## Vcpkg安装及基本命令

```shell
git clone https://github.com/microsoft/vcpkg.git
./bootstrap-vcpkg.sh

#集成到IDE
./vcpkg integrate install

#命令行补全
./vcpkg integrate bash

#可选: 设置默认Target,此处为Windows x64平台
VCPKG_DEFAULT_TRIPLET=x64-windows

#安装库
vcpkg install poco
#下载时指定版本
vcpkg install poco:x86-linux
```

## Vcpkg使用案例

## 参考资料

1. [Vcpkg总览](https://github.com/microsoft/vcpkg/blob/master/README_zh_CN.md)