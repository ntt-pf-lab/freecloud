./ip_list.sh | perl -ne 'chop($_);@a=split(/\s/,$_);print "echo $a[1],$a[2];nc -vz -w 1 $a[2] 22;\n" if($a[0])'
