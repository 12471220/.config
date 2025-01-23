# solve archlinux touchpad can't touch-to-click
1. `sudo vim /etc/X11/xorg.conf.d/30-touchpad.conf`
2. Add the following content:
```
Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "NaturalScrolling" "true"
    Option "TappingButtonMap" "rml"
EndSection
```
3. Reboot
