# Use an official Node.js image as the base image for both frontend and backend
FROM node:20.7.0

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json for the frontend
COPY front-end/package*.json ./frontend/

# Copy the package.json and package-lock.json for the backend
COPY back-end-side/package*.json ./backend/

# Install dependencies for the frontend
RUN cd frontend && npm install

# Install dependencies for the backend
RUN cd backend && npm install

# Copy the source code for the frontend
COPY front-end/ ./frontend/

# Copy the source code for the backend
COPY back-end-side/ ./backend/

# Expose the necessary ports
EXPOSE 3000
EXPOSE 8080

# Install supervisord
RUN apt-get update && apt-get install -y supervisor

# Copy the supervisord configuration file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Define the command to start supervisord
CMD ["/usr/bin/supervisord"]
