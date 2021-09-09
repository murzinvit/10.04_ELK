#!/bin/bash
docker stop logstash
docker rm logstash
docker run -d -p 5601:5601 -v /ELK:/mnt --name logstash --network=elk logstash-14:latest
