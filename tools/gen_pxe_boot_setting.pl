#!/usr/bin/perl

# This script generates pxe configs for each node 

if (@ARGV < 2) {
    die "USAGE: ./gen_pxe_boot_setting.pl PXE_DIR BASE_HOSTNAME"; 
}

$BOOTDIR=$ARGV[0];
$BASE_HOSTNAME=$ARGV[1];

open F, "<node_list";
while(<F>){
	chop($_);
	($mac,$ip) = split(/\s+/,$_);
        $mac=~s/:/\-/g;
        print "Generating pxe conf for $mac\n";
        $ip=~/\d+\.\d+\.\d+.(\d+)/;
        $num = $1;
        open G,">$BOOTDIR/01-$mac";
        print G << "END_OF_PXE";
default devstack
prompt 0
timeout 0

MENU TITLE devstack PXE Boot Menu


LABEL devstack
    MENU LABEL ^devstack
    MENU DEFAULT
    KERNEL ubuntu/vmlinuz-2.6.38-13-generic
    APPEND initrd=ubuntu/stack-initrd.gz ramdisk_size=2109600 root=/dev/ram0 ds=nocloud;h=$BASE_HOSTNAME$num

LABEL local
    MENU LABEL ^Local disk
    LOCALBOOT 0
END_OF_PXE
        close G;
}
close F;
print "\n";
