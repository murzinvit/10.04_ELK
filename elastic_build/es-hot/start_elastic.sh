#!/bin/bash
docker stop es-hot
docker rm es-hot
docker run -d --name es-hot --network=elk -v ~/:/mnt -p 9200:9200 -p 9300:9300 murzinvit/es-hot:latest
