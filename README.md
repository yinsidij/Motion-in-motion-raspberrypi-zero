# Motion-in-motion-raspberrypi-zero
This repo provides an intro and setup for services running in Raspberry pi zero W in `Motion-in-motion` project
- `Motion` for motion dection (https://github.com/Motion-Project/motion)
- `s3ccloudSender.sh` for uploading captured motion clips to AWS S3 (https://aws.amazon.com/s3/) and publish an event to Confluent Clound (Fully Managed Kafka as a Cloud-Native Service https://www.confluent.io/confluent-cloud/)
  - `producer` as Kafka client for Confluent Clound
  - `curl` using AWS S3 restful API to upload video clips

# Design decision
- Using Docker for faster bootstrap and deployments as IoT devices (i.e. Raspberry pi zero W) would grow
- Using Kafka client in c for best performance purpose in pi zero
- Using S3 restful API for easy setup and use
  - AWSCLI2 is only compatible with arm64 but pi zero is arm32
  - AWSCLI relies on Python but Python setup in pi zero is slow

# Build
```
sodu docker build . -t pi-zero-motion-in-motion-image
```

```
pi@raspberrypi:~/Motion-in-motion-raspberrypi-zero $ sudo docker image ls | grep motion-in-motion
pi-zero-motion-in-motion-image   latest    978df2706fa7   40 minutes ago   720MB

```

# Prerequisite
Make sure raspberry pi supports camera and is connected to camera properly by
```
pi@raspberrypi:~/Motion-in-motion-raspberrypi-zero $ vcgencmd get_camera
supported=1 detected=1, libcamera interfaces=0

```

# Run
```
sudo ./run.sh
```

# Debug
```
sudo docker logs pi-zero-motion-in-motion
```

# Extensibility
- Build your own `producer` binary in Docker (https://github.com/yinsidij/raspberrypi-zero-ccloud-producer-docker)
- Running `Motion` only in Docker 

# Reference
- https://stackoverflow.com/questions/44751574/uploading-to-amazon-s3-via-curl-route
