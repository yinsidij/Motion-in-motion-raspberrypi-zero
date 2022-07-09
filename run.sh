#!/bin/sh

sudo modprobe bcm2835-v4l2
IMAGE_NAME=pi-zero-motion-in-motion-image
WORK_DIRECTORY=`pwd`/data

docker run -d --name pi-zero-motion-in-motion-container --device=/dev/video0:/dev/video0 \
-e s3Key="YOURS3KEY" \
-e s3Secret="YOURS3SECRET" \
-v $WORK_DIRECTORY:/home/pi/motion/data -p 8083:8083 $IMAGE_NAME
