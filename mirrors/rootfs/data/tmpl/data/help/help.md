## CentOS 镜像

CentOS 7 配置方法
```
wget -O /etc/yum.repos.d/CentOS-Base.repo http://{{.Env.MIRRORS_DOMAIN}}/repo/Centos-7.repo
```

## PyPI镜像

配置方法

a. 找到下列文件`~/.pip/pip.conf`

b. 在上述文件中添加或修改:

```
[global]
index-url = http://{{.Env.MIRRORS_DOMAIN}}/pypi/simple/

[install]
trusted-host={{.Env.MIRRORS_DOMAIN}}
```

## Epel 镜像

epel(RHEL 7) 配置方法

```
wget -O /etc/yum.repos.d/epel.repo http://{{.Env.MIRRORS_DOMAIN}}/repo/epel-7.repo
```

## Docker CE镜像

CentOS 7（使用 yum 进行安装）

```
# step 1: 安装必要的一些系统工具
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
# Step 2: 添加软件源信息
sudo yum-config-manager --add-repo http://{{.Env.MIRRORS_DOMAIN}}/docker-ce/linux/centos/docker-ce.repo
# Step 3
# sudo sed -i 's+download.docker.com+{{.Env.MIRRORS_DOMAIN}}/docker-ce+' /etc/yum.repos.d/docker-ce.repo
sudo sed -i 's+https://mirrors.aliyun.com+http://{{.Env.MIRRORS_DOMAIN}}+' /etc/yum.repos.d/docker-ce.repo
# Step 4: 更新并安装Docker-CE
sudo yum makecache fast
sudo yum -y install docker-ce
# Step 4: 开启Docker服务
sudo service docker start

# 注意：
# 官方软件源默认启用了最新的软件，您可以通过编辑软件源的方式获取各个版本的软件包。例如官方并没有将测试版本的软件源置为可用，您可以通过以下方式开启。同理可以开启各种测试版本等。
# vim /etc/yum.repos.d/docker-ce.repo
#   将[docker-ce-test]下方的enabled=0修改为enabled=1
#
# 安装指定版本的Docker-CE:
# Step 1: 查找Docker-CE的版本:
# yum list docker-ce.x86_64 --showduplicates | sort -r
#   Loading mirror speeds from cached hostfile
#   Loaded plugins: branch, fastestmirror, langpacks
#   docker-ce.x86_64            17.03.1.ce-1.el7.centos            docker-ce-stable
#   docker-ce.x86_64            17.03.1.ce-1.el7.centos            @docker-ce-stable
#   docker-ce.x86_64            17.03.0.ce-1.el7.centos            docker-ce-stable
#   Available Packages
# Step2: 安装指定版本的Docker-CE: (VERSION例如上面的17.03.0.ce.1-1.el7.centos)
# sudo yum -y install docker-ce-[VERSION]
```
