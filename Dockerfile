# Stage 1: Build Node.js Application
FROM node:14 AS build

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application source code to the working directory
COPY . .

# Stage 2: Setup Nginx and Serve the Application
FROM nginx:alpine

# Copy Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Install Node.js in the Nginx container
RUN apk add --no-cache nodejs npm

# Copy the Node.js application from the build stage
COPY --from=build /usr/src/app /usr/src/app

# Install the application dependencies
WORKDIR /usr/src/app
RUN npm install --production

# Expose port 80 for Nginx
EXPOSE 80

# Start both Node.js and Nginx
CMD ["sh", "-c", "node /usr/src/app/index.js & nginx -g 'daemon off;'"]
