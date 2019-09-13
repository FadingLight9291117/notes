# conda命令和anaconda

## 升级conda和anaconda

1. conda update conda

// 2. conda update anaconda

3. conda update anaconda-navigator

4. conda update navigator-updater

## 卸载anaconda

1. rm -rf anaconda

## 虚拟环境

1. conda create -n xxxx python=3.7//创建python3.7的虚拟环境xxxx

2. conda activate xxxx//开启xxxx环境

3. conda deactivate//关闭环境

4. conda env list//列出所有环境

5. conda remove -n xxxx -all//删除虚拟环境xxxx

6. conda create --clone xxxx -n xxxx//克隆一个环境

7. conda config --set auto_activte_base false//关闭每次打开terminal自动进入base虚拟环境

8. conda config --set auto_activate_base true//使自动进入base虚拟环境

## 包管理

1. conda search xxxx//查找包
   - conda search --full-name xxxx//查找包，此为精确查找

2. conda list //列出当前环境中已安装包
   - conda list -n xxxx//指定环境

3. conda install xxxx//在当前环境中安装包
   - conda install -n envxx xxxx//指定环境

4. conda update xxxx//更新当前环境指定包
   - conda update -n envxx xxxx//指定环境

5. conda update --all//更新全部包

6. conda uninstall/remove xxxx//卸载当前环境的包
   - -n 指定环境
