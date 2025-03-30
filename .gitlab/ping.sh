#!/bin/sh

# Ping and capture the response status
status_code=$(curl --write-out %{http_code} --silent --output /dev/null https://cicd.magnoliarun.be/app/health/up)

# Check if the status code is 200
if [ "$status_code" -eq 200 ]; then
    echo "Service is up!"
else
    echo "Service is down!"
    exit 1
fi
