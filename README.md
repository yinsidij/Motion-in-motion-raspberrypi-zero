# Motion-in-motion-raspberrypi-zero
This repo provides an intro and setup for services running in Raspberry pi zero W in `Motion-in-motion` project
- `Motion` for motion dection (https://github.com/Motion-Project/motion)
- `Producer` as Kafka client for publishing events to Confluent Clound (Fully Managed Kafka as a Cloud-Native Service https://www.confluent.io/confluent-cloud/)
- `S3Sender.sh` for uploading captured motion clips to Amazon S3 (https://aws.amazon.com/s3/)

# How it works

# Extensibility
- Compile your `producer` binary in Docker (https://github.com/yinsidij/raspberrypi-zero-ccloud-producer-docker)
