#install packages
TOOLS_DIR=`dirname $0`
sudo apt-get install dnsmasq ipmitool -y
sudo cp $TOOLS_DIR/../etc/dnsmasq.conf /etc/dnsmasq.conf

#Install chef server
sudo echo "deb http://apt.opscode.com/ `lsb_release -cs`-0.10 main" | sudo tee /etc/apt/sources.list.d/opscode.list

sudo mkdir -p /etc/apt/trusted.gpg.d
gpg --keyserver keys.gnupg.net --recv-keys 83EF826A
gpg --export packages@opscode.com | sudo tee /etc/apt/trusted.gpg.d/opscode-keyring.gpg > /dev/null

sudo apt-get update -y
sudo apt-get install opscode-keyring  -y

sudo apt-get upgrade --force-yes
sudo apt-get install chef chef-server -y

mkdir -p ~/.chef
sudo cp /etc/chef/validation.pem /etc/chef/webui.pem ~/.chef
sudo chown -R $USER ~/.chef

knife configure -i

TOOLS_DIR=$TOOLS_DIR $TOOLS_DIR/build_pxe_env.sh
if [ -r /var/lib/tftpboot  ]; then
  rm -rf /var/lib/tftpboot
fi

sudo ln -s /tmp/tftpboot /var/lib/tftpboot
sudo chmod 0755 -R /tmp/tftpboot
sud chmod 0666 /var/lib/tftpboot/ubuntu
sudo /etc/init.d/dnsmasq restart



