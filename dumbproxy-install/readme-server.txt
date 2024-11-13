
# on local machine
scp -i ~/.ssh/rsa_lightsail -r ~/dumbproxy-install ec2-user@203.0.113.99:
ssh -i ~/.ssh/rsa_lightsail ec2-user@203.0.113.99

# in cloud instance
cd dumbproxy-install
export DUMBPROXY_IP=203.0.113.99
./install-dumbproxy.sh

# on local machine
scp -i ~/.ssh/rsa_lightsail -r ec2-user@203.0.113.99:dumbproxy-install/dumbproxy-browser ~/

# copy dir /home/user/for-browser-linux to client
# read for-browser-linux/readme-client.txt

