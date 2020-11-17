apt-get -y update
apt-get -y install apt-transport-https
apt-get -y install ca-certificates
apt-get -y install curl 
apt-get -y install gnupg-agent
apt-get -y install software-properties-common
#Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/debian/gpg |  apt-key add -
#set up the stable repository
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian  $(lsb_release -cs) stable"
apt-get -y update
apt-get -y install docker-ce docker-ce-cli containerd.io
echo "docker is installed, its version is $(sudo docker --version)"
#install docker compose
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose