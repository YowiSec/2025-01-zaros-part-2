# Use the latest Ubuntu LTS as the base image
FROM ubuntu:20.04

# Set environment variables to non-interactive
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    libssl-dev \
    pkg-config \
    git \
    python3 \
    python3-pip \
    python3-venv \
    jq \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# Install Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# Install Foundry
RUN curl -L https://foundry.paradigm.xyz | bash
ENV PATH="/root/.foundry/bin:${PATH}"

# Install Cyfrinup (which installs Aderyn)
RUN curl -L https://raw.githubusercontent.com/Cyfrin/aderyn/dev/cyfrinup/install | bash
ENV PATH="/root/.local/bin:${PATH}"

# Fix potential permission issues for global npm packages
RUN mkdir -p /usr/local/lib/node_modules && chmod -R 777 /usr/local/lib/node_modules

# Install Slither
RUN pip3 install slither-analyzer

# Install Halmos
RUN pip3 install halmos

# Create a non-root user (for Codespaces best practices)
RUN useradd -ms /bin/bash vscode
USER vscode

# Set the working directory
WORKDIR /workspaces/2025-01-zaros-part-2

# Ensure the PATH is set for the vscode user
ENV PATH="/home/vscode/.cargo/bin:/home/vscode/.foundry/bin:/home/vscode/.local/bin:${PATH}"
