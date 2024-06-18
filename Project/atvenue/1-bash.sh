#!/bin/bash

# Step 1: Run the container image in the background
docker run -d --name my-webserver atvenu/assignment-webserver:latest

# Step 2: Check if the container is running
if [ "$(docker inspect -f '{{.State.Running}}' my-webserver)" == "true" ]; then
    echo "Container is running successfully."
else
    # Troubleshoot the reason for failure
    echo "Container failed to run. Checking logs for more information:"
    docker logs my-webserver
    exit 1
fi

# Step 3: Generate data.csv file with 10 entries
file_name="data.csv"
echo "Generating $file_name with 10 entries..."
for i in {0..9}; do
    echo "$i, $((RANDOM % 100))" >> "$file_name"
done
echo "$file_name generated successfully."

# Step 4: Run the container again with the generated file inside
docker cp "$file_name" my-webserver:/app/"$file_name"
docker stop my-webserver
docker rm my-webserver

# Step 5: Run the container again, mapping port 8080 to host port 9090
docker run -d --name my-webserver -p 9090:8080 -e BORDER_COLOR=blue atvenu/assignment-webserver:latest

echo "Container is now running with port mapping and BORDER_COLOR set to blue."
