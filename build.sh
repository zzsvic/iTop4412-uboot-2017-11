# !/bash/sh

GCC="arm-linux-gnueabihf-"
DRAM2G='DDR2G'
DRAM1G='DDR1G'
MAKE_CLEAN='clean'
PUSH_MASTER='master'
PUSH_DEVELOP="develop"
PUSH_RELEASE="release"


if [ "$1" = "$MAKE_CLEAN" ];then
	echo -e "\n============================================"
	echo -e "make distclean...\n"
	make ARCH=arm CROSS_COMPILE=$GCC clean
	make ARCH=arm CROSS_COMPILE=$GCC distclean

elif [ "$1" = "$DRAM1G" ];then
	echo -e "\n============================================"
	echo -e "make DRAM 1G..."
	make ARCH=arm CROSS_COMPILE=$GCC iTop4412_DRAM1G_defconfig
	if [ "$2" = "menuconfig" ];then
		make ARCH=arm CROSS_COMPILE=$GCC menuconfig
	fi
	make ARCH=arm CROSS_COMPILE=$GCC
	sleep(1)
	cp u-boot.bin mkuboot/

elif [ "$1" = "$DRAM2G" ];then
	echo -e "\n============================================"
	echo -e "make DRAM 2G..."
	make ARCH=arm CROSS_COMPILE=$GCC iTop4412_DRAM2G_defconfig
	if [ "$2" = "menuconfig" ];then
		make ARCH=arm CROSS_COMPILE=$GCC menuconfig
	fi
	make ARCH=arm CROSS_COMPILE=$GCC 
	sleep(1)
	cp u-boot.bin mkuboot/

else
	echo ""
	echo "Select execute from the following command:"
	echo "    ./build.sh clean			    -- clean project"
	echo "    ./build.sh DDR1G              -- build 1G DDR3 iTop uboot..."
	echo "    ./build.sh DDR2G              -- build 2G DDR3 iTop uboot..."
	echo "    ./build.sh DDR1G menuconfig   -- config 1G DDR3 iTop uboot..."
	echo "    ./build.sh DDR2G menuconfig   -- config 2G DDR3 iTop uboot..."
	echo ""
fi


