# Use the official Node.js image
FROM node:16-slim

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the application code
COPY . .

# Expose the application port
EXPOSE 3000

# Set a non-root user
RUN useradd -m appuser && chown -R appuser /app
USER appuser

# Run the application
CMD ["node", "app.js"]

