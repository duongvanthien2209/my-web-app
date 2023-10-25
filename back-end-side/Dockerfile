# Use an official Node.js runtime as the base image
FROM --platform=linux/amd64 node:20.7.0

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Expose a port for the application (Next.js default is 3000)
EXPOSE 3000

# Start the Next.js application
CMD [ "npm", "run", "start" ]
