#!/bin/bash

# Start ngrok in the background, exposing the server running on localhost:8080
# ngrok http localhost:8080 --log=stdout > ngrok.log &

# Wait a few seconds for ngrok to initialize and establish the tunnel
# echo "Waiting for ngrok tunnel..."
# sleep 5

# Fetch the public URL from the ngrok API and export it
# Filters for the https tunnel and extracts the public_url
# export NGROK_URL=$(curl -s http://127.0.0.1:4040/api/tunnels | jq -r '.tunnels[] | select(.proto=="https") | .public_url')

# if [ -z "$NGROK_URL" ] || [ "$NGROK_URL" == "null" ]; then
  # echo "Failed to get ngrok URL. Check ngrok.log for errors."
  # Optionally exit here if ngrok is critical
  # exit 1
# else
  # Set the webhook base URL using the fetched ngrok URL
  # export WEBHOOK_BASE_URL=$NGROK_URL
  # echo "Ngrok tunnel established at: $WEBHOOK_BASE_URL"
  # echo "Webhook URL: $WEBHOOK_BASE_URL/webhook"
# fi

# Execute the original command (passed as arguments to this script)
# Use exec to replace the script process with the server process
echo "Starting server..."
# Set PORT environment variable to force the server to use port 8080
export PORT=8080
exec npm run server:dev
