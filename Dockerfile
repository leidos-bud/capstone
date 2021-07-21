FROM alpine:latest

# Install requirements
RUN apk add curl npm nodejs

# Create working directory
WORKDIR /app

# Copy source to working directory
COPY ./DuckHunt-JS *.* /app/

# Run NPM install
RUN npm install

# Launch DuckHunt
CMD [ "npm", "start" ]