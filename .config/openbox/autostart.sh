# Conky  
conky &

#使用 tint2作为panel
tint2 &

#网络管理器 networkmanager
nm-applet --sm-disable &

#启动xpad sticky notes
killall xpad > /dev/null 2>&1
xpad &

#启动视频信号输出控制
killall resapplet > /dev/null 2>&1
resapplet &

#恢复原来的壁纸设置
nitrogen --restore &

#取消开机静音
/sbin/alsactl restore -f /var/lib/alsa/asound.state &

#urxvt
#urxvt &

#wbar
wbar -jumpf 1 -above-desk -pos top -nanim 3 -zoomf 1.8 -idist 12 -isize 18 -bpress -balfa 85 -falfa 100 &

#google desktop
/opt/google/desktop/bin/gdlinux &

#vbox
echo 868686 | sudo -S /etc/init.d/vboxdrv start
