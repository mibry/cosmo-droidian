#!/bin/sh

#patched to reduce cpu usage of mtkfusionrild
mount -o ro,bind /usr/libexec/droid-hybris/vendor/lib64/libmtk-ril.so /vendor/lib64/libmtk-ril.so

#disable secure_element and keymaster as they always fail
mount -o ro,bind /dev/null /vendor/etc/init/android.hardware.secure_element@1.0-service.rc
mount -o ro,bind /dev/null /vendor/etc/init/android.hardware.keymaster@3.0-service.rc

#disable loading of the vendor wlan and bt kernel modules as we include it in our kernel anyway
mount -o ro,bind /dev/null /vendor/etc/init/init.wlan_drv.rc
mount -o ro,bind /dev/null /vendor/etc/init/init.bt_drv.rc
mount -o ro,bind /dev/null /vendor/etc/init/init.wmt_drv.rc

#disable loading of the vendor fmradio and gps drivers as we build and launch our own within gemian
mount -o ro,bind /dev/null /vendor/etc/init/init.fmradio_drv.rc
mount -o ro,bind /dev/null /vendor/etc/init/init.gps_drv.rc
