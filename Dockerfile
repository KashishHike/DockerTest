# Use an official Python runtime as a parent image
FROM python:2.7-slim

# Set the working directory to ./app
WORKDIR /Users/kashish/Documents/temp/

# Copy the current directory contents into the container at /app
ADD . /Users/kashish/Documents/temp/

RUN bash setup.sh
# Install dockerize to be used in docker-compose
RUN sed -i -e 's/:\/\/(archive.ubuntu.com\|security.ubuntu.com)/old-releases.ubuntu.com/g' /etc/apt/sources.list && apt-get update -y && apt-get install -y wget && wget https://github.com/jwilder/dockerize/releases/download/v0.1.0/dockerize-linux-amd64-v0.1.0.tar.gz && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-v0.1.0.tar.gz

# Build all the dockers
RUN docker-compose build --no-cache

# Push all the dockers to the dockerhub
RUN docker-compose push

# Start all the dockers
RUN docker-compose up
