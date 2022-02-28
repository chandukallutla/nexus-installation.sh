


# install nexus
like wget  https://download.sonatype.com/nexus/3/nexus-3.37.3-02-unix.tar.gz
#extract the file
tar -xvzf 
# rename the file
mv nexus--x.x.x.x.(version) to nexus --------->renaming.
# change directory
cd /bin
#add user
useradd nexus
#add password
passwd nexus-----> retype password .

nexus ALL=(ALL) NOPASSWD:ALL
#change permissions
chown -R nexus:nexus nexus
chown -R nexus:nexus sonatype-work
# install java
sudo yum install java-1.8.0-openjdk-devel
#add the data
vi /etc/systemd/system/nexus.service

[Unit]
Description=nexus service
After=network.target
  
[Service]
Type=forking
LimitNOFILE=65536
ExecStart=/opt/nexus/bin/nexus start
ExecStop=/opt/nexus/bin/nexus stop
User=nexus
Restart=on-abort
TimeoutSec=600
  
[Install]
WantedBy=multi-user.target


#enable nexus
systemctl enable nexus
#restart nexus
systemctl restart nexus
#start nexus
systemctl status nexus
