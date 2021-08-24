#!/bin/bash
docker rm centos
docker run -d -p 9200:9200 -p 5601:5601 -p 9600:9600 --name centos centos:latest sleep 60000000
docker ps