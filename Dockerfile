# Use an official Python runtime as a parent image
FROM python:2.7-slim

# Set the working directory to ./app
WORKDIR /Users/kashish/Documents/temp/

# Copy the current directory contents into the container at /app
ADD . /Users/kashish/Documents/temp/

# Run app.py when the container launches
CMD ["docker-compose", "build", "--no-cache"]
