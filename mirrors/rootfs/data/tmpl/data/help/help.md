## CentOS 镜像

配置方法
```
wget -O /etc/yum.repos.d/CentOS-Base.repo http://{{.Env.MIRRORS_DOMAIN}}/repo/Centos-7.repo
```

## PyPI镜像

配置方法
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
