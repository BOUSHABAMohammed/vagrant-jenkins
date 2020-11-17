#################################
#  Bash params for building env #
#################################
#get bash params
installDocker=false
setupJenkins=false
for var in "$@"
do
    if [ "$var" = "--installDocker" ];then
        installDocker=true
    fi
    if [ "$var" = "--setupJenkins" ];then
        setupJenkins=true
    fi
done

#################################
#       Env configuration       #
#################################
if [ "$installDocker" = true ]; then
    #all following steps is for setup docker repo
    #Update the apt package index and install packages to allow apt to use a repository over HTTPS:
    sudo apt-get -y update
    sudo apt-get -y install apt-transport-https
    sudo apt-get -y install ca-certificates
    sudo apt-get -y install curl 
    sudo apt-get -y install gnupg-agent
    sudo apt-get -y install software-properties-common
    #Add Docker’s official GPG key:
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    #set up the stable repository
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) exist stable"
    sudo apt-get -y update
    sudo apt-get -y install docker-ce docker-ce-cli containerd.io
    echo "docker is installed, its version is $(sudo docker --version)"
    #install docker compose
    sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    echo "docker-compose installed, its version is $(sudo docker-compose --version)"
    #Add vagrant user to docker group
    sudo usermod -aG docker $USER && newgrp docker

fi

##################################################################
#       nginx Docker container setup using docker-compose        #
##################################################################
#run
if [ "$setupJenkins" = true ]; then
    DOCKER_COMPOSE_FILE_PATH=/home/docker/jenkins-docker-compose.yml
    sudo docker-compose -f $DOCKER_COMPOSE_FILE_PATH up -d
fi