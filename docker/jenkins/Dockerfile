FROM jenkins/jenkins:lts
ADD install-docker-docker-compose-jenkins.sh /tmp/jenkins/install-docker-docker-compose-jenkins.sh
USER root
RUN chmod +x /tmp/jenkins/install-docker-docker-compose-jenkins.sh
RUN /tmp/jenkins/install-docker-docker-compose-jenkins.sh