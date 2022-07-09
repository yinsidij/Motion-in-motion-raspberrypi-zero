#!/bin/bash

file=`echo $1`
bucket="hackthon-2022"
resource="/${bucket}/${file}"
contentType="video/mp4"
dateValue=`date -R`
dateDisplay=`date +"%Y-%m-%d %H:%M:%S"`
stringToSign="PUT\n\n${contentType}\n${dateValue}\n${resource}"
s3Key=$s3Key
s3Secret=$s3Secret
signature=`echo -en ${stringToSign} | openssl sha1 -hmac ${s3Secret} -binary | base64`
#curl -I -X PUT -T "${file}" \
response=`curl --write-out "%{http_code}\n" \
  -X PUT -T "${file}" \
  -H "Host: ${bucket}.s3.amazonaws.com" \
  -H "Date: ${dateValue}" \
  -H "Content-Type: ${contentType}" \
  -H "Authorization: AWS ${s3Key}:${signature}" \
  https://${bucket}.s3-us-west-2.amazonaws.com/${file}`

echo "done with curl, response:"
echo $response
if [[ $response != "200" ]]; then
	echo "exit"
        exit 1
fi

s3ObjectURL="https://$bucket.s3.us-west-2.amazonaws.com/$file"
echo $s3ObjectURL
device_id="2"
device_name="side yard camera"
device_type="camera"
message="motion was detected !"
/home/pi/motion/app/producer ksql_motion_events_v2 /home/pi/motion/app/librdkafka.config "$device_id" "$device_name" "$device_type" "$s3ObjectURL" "$dateDisplay" "$message"
