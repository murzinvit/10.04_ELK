#!/bin/bash
docker stop logstash
docker rm logstash
docker run -d -p 9600:9600 -v /ELK:/mnt --name logstash --network=elk logstash-14:latest
