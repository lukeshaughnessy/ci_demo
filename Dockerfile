ROM debian:wheezy

#install Oracle Java 8

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
RUN apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java8-installer
RUN apt-get install -y oracle-java8-set-default 

RUN apt-get install -y vim

# For debugging
RUN apt-get install -y gdb strace
    
# Set up my user
RUN useradd lshaughnessy -u 1000 -s /bin/bash --no-create-home
    
    
WORKDIR /home/lshaughnessy/
ENV HOME /home/lshaughnessy/
    
VOLUME ["/home"]
EXPOSE 8080
