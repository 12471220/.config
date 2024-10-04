- how to change tty font:
1. list all available fonts: `ls /usr/lib/consolefonts`
2. change font forever: 
```
sudo vim /etc/vconsole.conf
```
```conf
KEYMAP=us
FONT=Lat2-Terminus16
```
