#!/bin/bash
docker stop elastic
docker rm elastic
docker run -d --name elastic --network=elk -p 9200:9200 -p 9300:9300 murzinvit/elasticsearch:latest
docker stop logstash
docker rm logstash
docker run -d -p 9600:9600 -v /ELK:/mnt --name logstash --network=elk logstash-14:latest
docker stop kibana
docker rm kibana
docker run -d -p 5601:5601 -v /ELK:/mnt --name kibana --network=elk kibana-14:ver1
