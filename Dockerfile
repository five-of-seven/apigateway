FROM node:6-alpine

# Some image metadata
LABEL version="0.1"
LABEL description="This is apigateway service for Community app, which will allow the user to access the application"



# Environment variables
ENV PORT=8080


# Create login app directory
RUN mkdir -p /usr/microservice/apigateway/

# From now one we are working in /usr/microservice/apigateway/
WORKDIR /usr/microservice/apigateway/

# Install api dependencies
COPY package*.json ./

# Run build if necessary with devDependencies then clean them up
RUN npm install

# Copy source code
COPY . .


EXPOSE 8080

# The following command will use NODE_ENV to run pm2-docker or pm2-dev
CMD ["npm", "start"]