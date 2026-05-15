# Use the official Node.js image
FROM public.ecr.aws/docker/library/node:18

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package files first (for caching npm install layer)
COPY package*.json ./

# Install dependencies (including dev dependencies)
RUN npm install

# Install nodemon globally for live-reload
RUN npm install -g nodemon

# Copy the rest of the app files
COPY . .

# Expose the app port
EXPOSE 3000

# Start the app with nodemon
CMD ["npm", "start"]
