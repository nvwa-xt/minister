a:59:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:34:"#Dell Force10基础管理命令   ";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:35;}i:4;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:35;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"Dell Force10    ";}i:2;i:41;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:57;}i:7;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:57;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:211:"适用环境：数据中心                      
功能：CLI、2层交换、3层交换、路由功能。     
带宽：1/10/40GbE                         
支持：ISCSI、NAS                   
CPU内存：2G";}i:2;i:63;}i:9;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:274;}i:10;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:274;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:331:"###命令                                                                
```
1.    启动端口命令：no shutdown     #出厂默认所有端口关闭，并工作在三层模式
2.	删除命令：只需在原配置命令前加”no”
3.	关闭其他模式：stop jump-start  和 stop  bmp
4.	显示系统信息：show system
```";}i:2;i:336;}i:12;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:667;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:667;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"###接口配置";}i:2;i:707;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:722;}i:16;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:722;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:303:"```
#enable   				#进入特权模式
#show interface status     	#显示接口状态
#config					#进入配置模式
#interface range te0/0 – 9 	#配置0-9端口
#no shutdown 			#启动接口
#switchport				#将接口从默认三层模式切换到二层交换模式
#exit						#退出配置模式
```";}i:2;i:724;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1027;}i:19;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1027;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:147:"###开启远程管理
```
#config					#进入配置模式
#ip telnet server enable		#启动telnet服务
#ip ssh server enable		#启动ssh服务
```";}i:2;i:1029;}i:21;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1176;}i:22;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1176;}i:23;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:216:"###建立用户及密码
```
#config										#配置
#username admin password enPa$$w0rd pri 15		#设置用户名为：admin 密码为：enPa$$w0rd
#enable password enPa$$w0rd					#配置交换机的管理密码
```";}i:2;i:1178;}i:24;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1394;}i:25;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1394;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:299:"###配置交换机IP和默认路由route
```
#config								#配置
#interface managementEthernet 0/0      #这么长的命令 输前几个后面用Tab就可以
#ip address 192.168.121.52				#配置IP
#exit
#management route 0.0.0.0/0  192.168.100.1 #配置路由，根据实际情况配置
#end
```";}i:2;i:1396;}i:27;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1695;}i:28;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1695;}i:29;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:158:"###基本命令：
```
#write		#保存配置
#reload		#重启    堆叠交换机会对所有堆叠的交换机都重启
```
```
#untagged  	#不打标示     ";}i:2;i:1697;}i:30;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"---";}i:2;i:1855;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:38:"-》access
#tagged 	   	#打标示		  ";}i:2;i:1858;}i:32;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"---";}i:2;i:1896;}i:33;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"-》trunk
```";}i:2;i:1899;}i:34;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1912;}i:35;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1912;}i:36;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:279:"###配置access模式
```
开启要配置的端口
#config
#interface range te0/1 – 2
#switchport			#切换到交换模式
#no shutdown			#启用接口
#exit
创建vlan10，并把te0/1、te0/2 以access模式划入vlan10
#interface vlan 10
#untagged te0/1,2
#no shutdown   
```";}i:2;i:1914;}i:37;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2193;}i:38;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2193;}i:39;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:265:"###配置trunk模式
```
开启配置端口
#config
#interface te0/24
#switchport		#切换到交换模式
#no shutdown		#启用接口
#exit
把te0/24配置成trunk模式，并允许vlan10通过
#inteface vlan 10
#tagged te0/24
#no shutdown
```
###Hybird混合模式";}i:2;i:2195;}i:40;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2460;}i:41;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2460;}i:42;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:670:"###配置生成树STP
目的：为网络提供路径冗余，同时防止产生环路。
```
#使用RSTP协议
#config
#protocol spanning-tree rstp 	#设置协议为：rstp
#no disable           		#启用RSTP生成树
#exit
#interface te0/1   #进入端口
#spanning-tree rstp edge-port 	#启用端口的portfast功能
#Portfast即：快速端口，能使交换机或中继端口跳过侦听学习状态而进入STP转发状态。
#PortFast特性必须配置在连接终端或者服务器的端口，而一定不能是连接另一台交换机的接口，否则会造成网络环路，而STP就没有意义了。也就是说PortFast只能配置在接入层交换机中。";}i:2;i:2462;}i:43;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3132;}i:44;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3132;}i:45;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:23:"#正常状态： 阻塞";}i:2;i:3134;}i:46;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"->";}i:2;i:3157;}i:47;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:">监听―";}i:2;i:3159;}i:48;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:">>";}i:2;i:3169;}i:49;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"学习";}i:2;i:3171;}i:50;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"->";}i:2;i:3177;}i:51;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:28:">转发
#portfast ： 阻塞";}i:2;i:3179;}i:52;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"->";}i:2;i:3207;}i:53;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:">转发
```";}i:2;i:3209;}i:54;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3220;}i:55;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3220;}i:56;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:248:"###本地端口镜像
```
#把te0/20和te0/21的双向流量镜像到te0/23
#Interface te0/23
#no switchport
#no shutdown
#exit
#monitor session 0
#source te0/20 destination te0/23 direction both
#source te0/21 destination te0/23 driection both
```";}i:2;i:3222;}i:57;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3222;}i:58;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:3222;}}