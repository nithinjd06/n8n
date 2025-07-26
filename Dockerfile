# Use official Node 18 image with pnpm
FROM node:18

# Install pnpm
RUN npm install -g pnpm

# Set working directory
WORKDIR /usr/src/app

# Copy package and lock files
COPY pnpm-lock.yaml pnpm-workspace.yaml package.json ./

# Copy the rest of the repo
COPY . .

# Install dependencies with pnpm
RUN pnpm install --frozen-lockfile

# Build the application
RUN pnpm run build

# Expose the default n8n port
EXPOSE 5678

# Default command to run n8n
CMD ["pnpm", "start"]
