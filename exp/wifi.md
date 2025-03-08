### iw
1. 查看无线网卡信息
```shell 
iw dev
```
2. wifi扫描
```shell
iw dev <device name> scan
```
> 可以使用|grep SSID输出简洁信息
3. 连接wifi
```shell
iw dev <device name> connect <SSID>
```
