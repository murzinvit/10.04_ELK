#!/bin/bash
docker stop kibana
docker rm kibana
docker run -d -p 5601:5601 -v /ELK:/mnt --name kibana --network=elk murzinvit/kibana:latest
