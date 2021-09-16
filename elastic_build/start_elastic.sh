#!/bin/bash
docker stop elastic
docker rm elastic
docker run -d --name elastic --network=elk -p 9200:9200 -p 9300:9300 murzinvit/elastic:latest
