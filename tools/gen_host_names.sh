./ip_list.sh | perl -ne 'chop($_);@a=split(/\s/,$_);print "$a[1]\n" if($a[0])'
