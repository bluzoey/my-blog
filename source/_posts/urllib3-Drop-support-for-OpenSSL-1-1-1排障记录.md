---
title: urllib3 Drop support for OpenSSL<1.1.1 排障记录
date: 2023-05-30 15:23:00
tags:
---
### 前言
urllib3 是一个 Python 的 HTTP 请求库，它提供了一种简单而强大的方式来发送 HTTP/1.1 请求，包括 GET、POST、PUT、DELETE 等方法。它还提供了连接池管理、重试、重定向、代理等功能，使得开发者能够更加灵活地控制 HTTP 请求。urllib3 还支持 SSL/TLS 安全传输协议，可以帮助开发者安全地进行网络通信。

在python django开发的web后台项目中，因为选用了腾讯云上的一些服务，如发送短信服务、cos服务等，所以用到两个了相关插件，分别是tencentcloud_sdk_python、cos_python_sdk_v5，
而他们底层都用到了urllib3的库来管理请求。

### 问题现场版本情况
```
cos_python_sdk_v5: 1.9.23
djangorestframework: 3.14.0
urllib3: 2.0.0
django: 4.2
python: 3.9
```
### 报错信息
```
File "/Users/choi/project/wusutong/backend/src/urls.py", line 20, in <module>
    from utils.tencent_cos import upload_file
  File "/Users/choi/project/wusutong/backend/utils/tencent_cos.py", line 1, in <module>
    from qcloud_cos import CosConfig
  File "/Users/choi/.local/share/virtualenvs/backend-IV37vFGU/lib/python3.9/site-packages/qcloud_cos/__init__.py", line 1, in <module>
    from .cos_client import CosS3Client
  File "/Users/choi/.local/share/virtualenvs/backend-IV37vFGU/lib/python3.9/site-packages/qcloud_cos/cos_client.py", line 3, in <module>
    import requests
  File "/Users/choi/.local/share/virtualenvs/backend-IV37vFGU/lib/python3.9/site-packages/requests/__init__.py", line 43, in <module>
    import urllib3
  File "/Users/choi/.local/share/virtualenvs/backend-IV37vFGU/lib/python3.9/site-packages/urllib3/__init__.py", line 38, in <module>
    raise ImportError(
ImportError: urllib3 v2.0 only supports OpenSSL 1.1.1+, currently the 'ssl' module is compiled with LibreSSL 2.8.3. See: https://github.com/urllib3/urllib3/issues/2168)
```
### 排障记录
#### 查看报错原因
通过错误信息的提示，我们来到对应的issue查看问题情况
![](/img/urllib3-Drop-support-for-OpenSSL-1-1-1排障记录/urllib3_issues_2168.jpg)
https://github.com/urllib3/urllib3/issues/2168

#### 尝试升级本机OpenSSL版本
#### 再次查看issue信息，发布日志等
![](/img/urllib3-Drop-support-for-OpenSSL-1-1-1排障记录/urllib3_release_note.jpg)


#### 断点调试项目后，尝试更新python语言内置的SSL模块

#### 尝试重新安装新版本的python

#### 打印python的SSL版本信息
#### 检查SSL模块的文件

#### 忽略了python虚拟环境的中使用的python和本机是隔离的

### 解决方案
- 降级当前的urllib3包版本到，可以支持LibreSSL等

### 知识补充
#### SSL协议
#### python虚拟环境

#### 编译python语言