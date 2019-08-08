FROM jenkins/jenkins


USER root


RUN apt-get update && apt-get install -y python3 python3-pip

USER jenkins

ENV JENKINS_JAVA_OPTIONS="-Djava.awt.headless=true -Djava.io.tmpdir=/var/jenkins_home/tmp"


#switch to root to run
USER root
RUN chown -R jenkins:jenkins $JENKINS_HOME

USER jenkins

EXPOSE 8080
EXPOSE 50000
