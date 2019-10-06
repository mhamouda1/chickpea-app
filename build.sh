#!/bin/bash
ls -al
docker-compose build -f docker/web/Dockerfile -t my_image:latest .
