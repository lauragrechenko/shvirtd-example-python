#!/bin/bash

REPO_URL="https://github.com/lauragrechenko/shvirtd-example-python.git"
DEST_DIR="/opt/shvirtd-example-python"

if [ ! -d "$DEST_DIR" ]; then
    echo "Cloning repository..."
    git clone "$REPO_URL" "$DEST_DIR"
else
    echo "Repository already exists. Pulling latest changes..."
    cd "$DEST_DIR" && git pull
fi

cd "$DEST_DIR" || exit

docker compose up -d

