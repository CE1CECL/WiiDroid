sed -i 's/on init/on init\n    start dmesg-sh\n    start logcat-sh/g' ./init.rc
echo 'service dmesg-sh /system/bin/dmesg.sh' >> ./init.rc
echo '    disabled' >> ./init.rc
echo 'service logcat-sh /system/bin/logcat.sh' >> ./init.rc
echo '    disabled' >> ./init.rc
echo '#!/system/bin/sh' > ./system/bin/dmesg.sh
echo '/system/bin/dmesg 2>&1 | /system/bin/cat >> /data/dmesg.log' >> ./system/bin/dmesg.sh
echo '/system/bin/dmesg -c' >> ./system/bin/dmesg.sh
echo '#!/system/bin/sh' > ./system/bin/logcat.sh
echo '/system/bin/logcat 2>&1 | /system/bin/cat >> /data/logcat.log' >> ./system/bin/logcat.sh
chown -v 0:0 ./system/bin/dmesg.sh
chmod -v 7777 ./system/bin/dmesg.sh
chown -v 0:0 ./system/bin/logcat.sh
chmod -v 7777 ./system/bin/logcat.sh
chown -R 0:0 ./
chmod -R 7777 ./
