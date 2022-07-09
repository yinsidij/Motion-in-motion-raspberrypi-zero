FROM --platform="arm/v5" debian:stable

RUN apt-get -y update && apt-get -y upgrade 
RUN apt-get -y install motion
RUN apt-get -y install libssl-dev
RUN apt-get -y install curl

RUN apt -y install gcc g++ zlib1g-dev librdkafka-dev

RUN mkdir -p /etc/motion/
COPY motion.conf /etc/motion/motion.conf

RUN mkdir -p /home/pi/motion/app
RUN mkdir -p /home/pi/motion/data

COPY bin/* /home/pi/motion/app/

EXPOSE 8083
ENTRYPOINT ["motion", "-c /etc/motion/motion.conf"]

