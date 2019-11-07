# MySql忘记密码怎么办(windows)?

- 以系统管理员身份运行cmd
- 关闭mysql服务：net stop mysql
- 输入命令：mysqld -nt --skip-grant-tables
- 打开另一个cmd命令行（管理员）
- 输入mysql -uroot ，即可进入mysql，而无需密码
- 最后，修改root密码
