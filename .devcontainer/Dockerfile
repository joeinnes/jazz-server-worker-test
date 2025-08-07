FROM node:22-slim

WORKDIR /app

# Install system dependencies including ngrok and jq
RUN apt-get update && apt-get install -y \
    curl \
    git \
    jq \
    rsync \
    && curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
       | tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
    && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
       | tee /etc/apt/sources.list.d/ngrok.list \
    && apt-get update \
    && apt-get install -y ngrok \
    && rm -rf /var/lib/apt/lists/*

# Create .ssh directory for the node user and set permissions
RUN mkdir -p /home/node/.ssh && \
    chown -R node:node /home/node/.ssh && \
    chmod 700 /home/node/.ssh

# Create all necessary directories and set permissions
RUN mkdir -p \
    node_modules \
    node_modules/.cache \
    node_modules/.cache/typescript && \
    chown -R node:node .

# Switch to non-root user for all operations
USER node

# Copy package files
COPY --chown=node:node package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY --chown=node:node . .

# Make startup script executable
RUN chmod +x /app/.devcontainer/start-server-with-ngrok.sh

# Expose server port
EXPOSE 8080 

# Expose Ngrok
EXPOSE 4040