FROM            phusion/baseimage
MAINTAINER	Clemens Putschli <clemens@putschli.de>

#Install libpcap-dev
RUN apt-get update
RUN apt-get install -y --no-install-recommends libpcap-dev
RUN apt-get install -y --no-install-recommends nodejs
RUN apt-get install -y --no-install-recommends git 
RUN apt-get install -y --no-install-recommends npm
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#install dasher
ADD . /dasherApp
RUN cd /dasherApp
RUN git clone https://github.com/maddox/dasher.git
RUN cd dasher
RUN npm install


# Interface the environment
VOLUME /dasherApp/dasher/config

# Baseimage init process
ENTRYPOINT ["sudo npm run start"]
