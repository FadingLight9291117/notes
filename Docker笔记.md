# Docker笔记

## 1. 简介

​	Docker是一个**开源的应用容器引擎**，基于**GO语言**并遵从Apache2.0开源协议。

​	容器是完全沙箱机制，相互之间不会有任何的接口，更重要的是容器性能开销极低。

​	Docker支持将软件编译成一个镜像；然后在镜像中将各种软件做好配置，将镜像发布出去，其他使用者可以直接使用这个镜像。运行中的这个镜像称为容器，容器启动时非常快速的。

## 2. 核心概念

- Docker主机（Host）：安装了Docker程序的机器（Docker直接安装在操作系统上）
- Docker客户端（Client）：连接Docker主机进行操作
- Docker仓库（Registry）：用来保存各种打包好的软件镜像
- Docker镜像（Container）：软件打包好的镜像，放在Docker仓库中
- Docker容器（Container）：镜像启动后的实例称为一个容器，容器是独立运行的一个或一组应用



使用Docker的步骤：

1. 安装Docker；
2. 去Docker仓库找到这个软件对应的镜像；
3. 使用Docker运行这个镜像，这个镜像就会生成一个Docker容器；
4. 对容器的启动停止就是对软件的启动和停止。

## 3. 安装Docker

Ubuntu上直接

```shell
sudo apt install docker.io
```

docker.io是ubuntu维护的版本

然后

```shell
sudo service docker start
```

启动docker

使用docker是必须要root权限.

## 4. Docker常用操作

1. 镜像操作

| 操作 | 命令                                            | 说明                       |
| ---- | ----------------------------------------------- | -------------------------- |
| 检索 | docker search 关键字<br>eg: docker search redis | 去docker hub上检索镜像     |
| 拉取 | docker pull 镜像名:tag                          | :tag可选，表示标签，即版本 |
| 列表 | docker images                                   | 查看本地所有镜像           |
| 删除 | docker rmi image-id                             | 删除指定本地镜像           |

2. 容器操作

| 操作 | 命令 | 说明 |
| ---- | ---- | ---- |
| 运行 |      |      |
|      |      |      |
|      |      |      |

