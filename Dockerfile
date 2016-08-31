FROM            phusion/baseimage
MAINTAINER	Clemens Putschli <clemens@putschli.de>

#Install libpcap-dev
RUN apt-get update && \
    apt-get install -y --no-install-recommends libpcap-dev node git npm && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#install dasher
RUN git clone https://github.com/maddox/dasher.git
RUN cd dasher
RUN npm install


# Interface the environment
VOLUME /config

# Baseimage init process
ENTRYPOINT ["sudo npm run start"]
