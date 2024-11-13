sudo dnf install httpd

sudo mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.bak

sudo mkdir /srv/webdavlock
sudo mkdir /srv/webdav1
sudo mkdir /srv/webdav2
sudo chown apache:apache /srv/webdavlock
sudo chown apache:apache /srv/webdav1
sudo chown apache:apache /srv/webdav2

sudo cp archive-webdav/etc-httpd-conf/dav_passwords /etc/httpd/conf/
sudo cp archive-webdav/etc-httpd-conf.d/webdav.conf /etc/httpd/conf.d/
#sudo cp archive-webdav/etc-httpd-conf.d/ssl.conf /etc/httpd/conf.d/

sudo dnf install mod_ssl

sudo cp install-dumbproxy/certs/rootCA.pem /etc/pki/ca-trust/source/anchors/ca-proxy-wd-202411.crt
sudo update-ca-trust extract
sudo cp install-dumbproxy/certs/1.2.3.4.pem /etc/pki/tls/certs/
sudo cp install-dumbproxy/certs/1.2.3.4-key.pem /etc/pki/tls/private/

systemctl enable --now httpd 


sudo dnf install policycoreutils-python-utils
sudo semanage port -l | grep http

semanage port -a -t http_port_t -p tcp 8433
systemctl enable --now httpd 




