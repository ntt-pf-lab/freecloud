cat bmc_mac_list | perl -ne 'chop($_);@a=split(/\s/,$_);print "echo $a[0],$a[1]; ipmitool -U root -P root -H $a[1] power reset\n"'|bash
