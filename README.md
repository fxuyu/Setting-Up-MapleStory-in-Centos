# 序言
鉴于国内教程甚少，并且教程稀少<br>
本人抱着学习之心收集了一些maplestory资源，并且搭建079版本成功了。<br>
这下把搭建成功的经历发出来，仅供大家参考<br>

## 本人准备环境
1.服务器:阿里云 centos 7.6 <br>
2.客户端:
- wx文件（此文件很重要,需要和客户端的wx文件相同）
- jar文件(这是通过源码打包而成的jar文件，可以使用netbeans文件编译)
- dist文件夹里面的东西
- 数据库文件(上面有)
- 链接数据库的软件(Navicat8) 或者服务器安装phpmyadmin
- 链接Linux的软件(putty or xshell)
- 上传Linux的软件(FileZilla or winscp)

## 开始
首先要在centos服务器部署运行环境。<br>
使用**putty** 或者 **xshell** 链接服务器 <br>
链接成功后 先安装**jdk** 和**jre**笔者在oracle官网安装了 jdk1.8和jre1.8的RPM版本<br>
然后安装mysql，安装完mysql后 使用Navicat8链接数据库。 <br>
注意：Navicat8 链接阿里云要首先在 <br>
SSH输入你的VPS的IP和你的密码 <br>
![截图4](https://github.com/fxuyu/Setting-Up-MapleStory-in-Centos/blob/master/image/4.PNG)
你的数据库账号和密码<br>
![截图5](https://github.com/fxuyu/Setting-Up-MapleStory-in-Centos/blob/master/image/5.PNG)
创建一个库，库名随意，本人选择了ms079为自己的库名<br>
然后恢复备份，选择你的PSC文件<br>
![截图6](https://github.com/fxuyu/Setting-Up-MapleStory-in-Centos/blob/master/image/6.PNG)
然后打开服务端配置.ini，在里面把数据库名改成你的，链接密码也改成你的,还可以通过这个修改爆率之类的

把dist文件夹里面的文件(除了ZlhssMS079.jar)上传到 如下
```
/usr/java/jdk1.8.0_231-amd64/jre/lib/security
/usr/java/jdk1.8.0_231-amd64/jre/lib/ext
/usr/java/jre1.8.0_231-amd64/lib/ext
/usr/java/jre1.8.0_231-amd64/lib/security
```
![截图1](https://github.com/fxuyu/Setting-Up-MapleStory-in-Centos/blob/master/image/1.PNG)
![截图2](https://github.com/fxuyu/Setting-Up-MapleStory-in-Centos/blob/master/image/2.PNG)

然后，LINUX 在/root 或者 / 然后创建一个文件夹
```
mkdir MapleStory
```
然后把如下文件夹上传到 
- **dist文件夹**
- **wz文件夹**
- logs文件夹（没有也可以运行）
- scripts文件夹（没有也能运行）
- **服务端配置.ini**
  
  在/MapleStory 下创建一个 start.sh文件,输入如下代码
```
#!/bin/sh
export CLASSPATH=".:dist/*"
java -server -Dnet.sf.odinms.wzpath=wz server.Start
```
再把ZlhssMS079.jar文件上传到dist文件夹内.<br>
最后启动
```
bash start.sh
```
![截图3](https://github.com/fxuyu/Setting-Up-MapleStory-in-Centos/blob/master/image/3.png)

然后需要在阿里云安全组设置安全组，要开放9595和7575，7576，7577，8600等端口<br>
启动成功后，启动游戏。一般来说，不用注册，输入账号和密码必须要六位数以上，随便输入后。点击登陆就行。<br>

# PS
> 079客户端找个纯净版的就行了。具体怎么找可以百度 or 谷歌<br> 
> 本人在这里上传了wx文件夹，dist文件夹. <br>
> 打开客户端就能链接<br>
> 本着一片热诚学习之心，回馈大众，其中有很多技术难点我没有得到解决，很多问题我也不知道怎么解决，欢迎各路大神一起探讨问题.<br>
> 以上，本人收集的总结一套成功方法