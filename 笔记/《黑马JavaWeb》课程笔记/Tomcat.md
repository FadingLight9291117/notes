# TOMCAT

## 项目发布的三种方式

1. 直接拷贝到TOMCAT的webapps文件及其对应位置

2. 配置虚拟路径(方法一)

     ```xml
     1. 找到server.xml中找到<Host>标签
     2. 添加<Context docBase="" path=""></Context>子节点
     	docBase: 项目的路径地址 
     	path: 对应的虚拟地址，一定要以/开头
     ```

3. 配置虚拟路径(方法二)

     ```xml
     1. 在tomcat/conf/catalina/localhost/ 文件夹下新建一个xml文件，名字自定
	2. 写入
		<?xml version = '1.0' encoding = 'uft-8'?>
		<Context docBase = ""></Context>
	```

