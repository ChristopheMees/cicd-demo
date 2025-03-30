#!/bin/sh

# Perform GET request to google.com and store the response body
response=$(curl -s "https://cicd.magnoliarun.be/app/fib?count=5")

# Define the expected result
expected="[0,1,1,2,3]"

# Compare the response to the expected result
if [ "$response" != "$expected" ]; then
    exit 1
fi
