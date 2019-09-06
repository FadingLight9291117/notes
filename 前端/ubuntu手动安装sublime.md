# ubuntu手动安装sublime

1. 首先下载安装包

2. 解压
  
   - tar -xvf name

3. 将解压文件包移动到/usr/lib/下（一般应用程序放这里）

   - mv name /usr/lib/

    ($PATH自动覆盖了/usr/lib这个目录，无需专门修改环境变量)

4. 添加软连接到/usr/bin（可通过terminal输入sublime进入）
  
   - ln -s /usr/lib/sublime_text_3/sublime_text /usr/bin/sublime

5. 将sublime目录下的sublime_text.desktop复制到/usr/share/applications/(这个路径是放置桌面侧边栏启动器的配置文件的),并编辑程序路径和图标路径

     - cp /usr/lib/sublime_text_3/sublime_text.desktop /usr/share/applications/
