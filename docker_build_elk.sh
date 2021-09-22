#!/bin/bash
cd ./kibana/ && bash docker_build.sh
cd ../es-hot/ && bash docker_build.sh
cd ../es-warm/ && bash docker_build.sh
cd ../logstash/ && bash docker_build.sh
cd ../filebeat/ && bash docker_build.sh