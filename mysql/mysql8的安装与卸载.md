# MySQL8的安装与卸载（Windows）

## 安装
1. 命令行进入mysql目录下的bin目录
2. 运行命令，初始化：mysqld --initialize --console
3. 记下命令行中的临时密码
4. 运行命令，安装服务：mysqld --install
5. 运行命令，启动服务：net start mysql
6. 使用临时密码进入：mysql -uroot -p"temporary password"
7. 修改root密码

## 卸载
1. 停止服务：net stop mysql
2. 卸载服务：mysqld --remove
3. 删除mysql根目录下的data文件夹