#!/bin/bash
echo " Starting AI Stack Setup..."


docker compose up -d

echo " Waiting for Ollama to wake up..."
sleep 5


echo "Downloading Llama 3 model (this may take a few minutes)..."
docker exec -it ollama ollama pull llama3

echo "Setup Complete!"
echo "Open WebUI: http://localhost:3000"
echo "To configure ZeroClaw, run: docker exec -it zeroclaw_container zeroclaw onboard"
