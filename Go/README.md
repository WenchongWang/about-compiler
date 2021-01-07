![](有关Go.png)

# Go语言

---

## 一. Go基础

## 二. Go深入

## 三. 实战案例

1. **项目包管理改造 - apprtc/collider为例 (>go1.11, go module方式)**

	```
	项目中的每个独立包都要建立mod, 自己负责依赖包的管理;
	如果依赖的是本地包, 要明确指定位置;
	```
	
	collider目录树
	```shell
	➜  collider git:(master) ✗ tree -a
		├── README.md
	  	├── collider //collider包
	  	│   ├── client.go
	  	│   ├── client_test.go
	  	│   ├── collider.go
	  	│   ├── collider_test.go
	  	│   ├── dashboard.go
	  	│   ├── dashboard_test.go
	  	│   ├── messages.go
	  	│   ├── room.go
	  	│   ├── roomTable.go
	  	│   └── room_test.go
	  	├── collidermain //main包
	  	│   └── main.go
	  	├── collidertest
	  	│   └── mockrwc.go
	```
	
	安装go 1.13及配置代理
	
	```
	gvm install go1.13 
	gvm use go1.13 
	export GO111MODULE=on
	export GOPROXY=https://goproxy.io
	```
	
	collider子目录改造
	```
	go mod init yejinlei/collider //生成go.mod
	go mod vendor				  //自动下载依赖包, 并放入同级vendor目录下													
	/*提示错误, 无法找到collidertest包位置*/
	➜  collider git:(master) ✗ go mod vendor                    
	go: finding golang.org/x/net latest
	yejinlei/collider tested by
	yejinlei/collider.test imports
	collidertest: malformed module path "collidertest": missing dot in first path element
	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	
	/*手动修改go.mod, 添加本地包位置*/
	replace collidertest => ../collidertest   //前者代表代码中import部分, 后者代表相对位置
	```
	
	collidermain子目录改造(步骤同上), 因为是package main, 可以生成可执行文件,命令如下:
	
	```
	go build -mod=vendor
	```
	

## 四. 参考资料

