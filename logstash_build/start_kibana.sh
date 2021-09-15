#!/bin/bash
docker stop kibana
docker rm kibana
docker run -d -p 5601:5601 -v /ELK:/mnt --name kibana --network=elk kibana-14:ver1
