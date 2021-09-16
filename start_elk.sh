#!/bin/bash
docker stop elastic
docker rm elastic
docker stop logstash
docker rm logstash
docker stop kibana
docker rm kibana
docker run -d -p 9200:9200 -p 9300:9300 --name elastic -v /ELK:/mnt --network=elk murzinvit/elastic:latest
docker run -d -p 9600:9600 -p 5044:5044 --name logstash -v /ELK:/mnt --network=elk murzinvit/logstash:latest
docker run -d -p 5601:5601 --name kibana -v /ELK:/mnt --network=elk murzinvit/kibana:latest
