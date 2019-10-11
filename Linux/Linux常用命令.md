# Linux常用命令

## 系统管理类

1. su root 
   - 获取root权限
   - 若是第一次获取首先要设置root密码：sudo passwd root

2. who

3. whoami

5. passwd

6. ps 
	- a 显示一个终端的所有进程，除了会话引线
	- u uid or username 选择有效的用户id或者是用户名
	- x 显示没有控制终端的进程，同时显示各个命令的具体路径。
- 常用ps -aux

## 文件路径操纵类
1. tar
	- 主命令
	- c:建立解压档案
	- x:解压
	- t:查看内容
	- r:向压缩归档文件末尾追加文件
	- u:更新原压缩包中的文件
	- 可选命令
	- z:有gizp属性的
	- j:有bz2属性的
	- Z:有compress属性的
	- v:显示所有过程
	- O:将文件解开到标准输出
	- 必选命令
	- f:使用档案名字，最后一个参数
