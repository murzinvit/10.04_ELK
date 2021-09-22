#!/bin/bash
docker stop filebeat
docker rm filebeat
docker run -d  --name filebeat --network=elastic murzinvit/filebeat:latest
