#!/bin/sh

# Trigger deploy and capture the response status
status_code=$(curl --write-out %{http_code} --silent --output /dev/null https://cicd.magnoliarun.be/runner/deploy)

# Check if the status code is 200
if [ "$status_code" -eq 200 ]; then
    echo "Container deployed"
else
    echo "Could not deploy container"
    exit 1
fi
