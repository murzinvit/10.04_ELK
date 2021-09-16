#!/bin/bash
docker stop logstash
docker rm logstash
docker run -d -p 9600:9600 -p 5044:5044 -v /ELK:/mnt --name logstash --network=elk murzinvit/logstash:latest
