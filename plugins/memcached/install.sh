#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

curPath=`pwd`
rootPath=$(dirname "$curPath")
rootPath=$(dirname "$rootPath")
serverPath=$(dirname "$rootPath")


install_tmp=${rootPath}/tmp/bt_install.pl


Install_mem()
{
	mkdir -p $serverPath/tmp

	echo '正在安装脚本文件...' > $install_tmp

	wget -O $serverPath/tmp/memcached.tar.gz http://www.memcached.org/files/memcached-1.5.12.tar.gz
	cd $serverPath/tmp && tar -zxvf memcached.tar.gz

	mkdir -p $serverPath/memcached
	cd memcached* && ./configure --prefix=$serverPath/memcached && make && make install

	echo '安装完成' > $install_tmp

	#rm -rf $serverPath/tmp
}

Uninstall_mem()
{
	rm -rf mkdir -p $serverPath/memcached
}


action=$1
if [ "${1}" == 'install' ];then
	Install_mem
else
	Uninstall_mem
fi
