##联通光猫路由器
型号：F427Za
联通型号：中国联通FTTH终端 WO - 36
查询得知中国联通以前和华为合作， 后来和中兴合作出的这一款光猫， 这一款是和中兴合作出的光猫， 总体设备的后台管理密码和telnet登录口令基本是一样的，口令如下
#Telnet
root/Zte521
#Web
地址：http://192.168.18.1/CU.html
口令：CUAdmin/CUAdmin
[其他款路由器的Web登录口令可能是：telecomadmin/admintelecom | lnadmin/lnadmin，telnet登录口令可能是root/admin]
[参考：https://jingyan.baidu.com/article/a681b0de09fe0d3b19434644.html]
##拿到root以后的路由器
背景，家里买了小米电视， 特别烦人， 开机30s广告而且无法去除，关键是开机广告的声音特别大，关不掉声音，广告有指定的域名，于是准备通过手段屏蔽掉相关的域名，达到屏蔽广告的目的
路由器本身有网址屏蔽的功能， 但是我试过了， 可以屏蔽掉部分http协议， 可能是广告使用的是其他协议，导致无法成功， 有没有换路由器的打算，于是打算通过DNS来解决这个问题
#步骤
telnet登录到路由器， 查询路由器的DNS使用的服务，通过ps指令查询到正在运行的进程， 挨个儿搜索指令， 发现了路由器使用的是DNSmasq的DNS服务器，如下：
697 root        604 S   dnsmasq -r /var/tmp/default_resolv.conf -M 0 -T 6 -P 
然后查询这个程序使用的配置文件，参考链接
http://debugo.com/dnsmasq/
这篇文章讲解的很详细了， 配置文件里面能够指定自己的dns服务器，也可以指定地址解析， 这个功能就是我需要的， 那我现在需要做的就是找到这个配置文件， 因为这个路由器是阉割版本的， 很多指令都没有，所以得自己一个一个区找

