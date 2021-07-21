FROM alpine:3.14.0

# Install requirements
RUN apk add --no-cache curl=7.77.0-r1 npm=7.17.0-r0 nodejs=14.17.1-r0

# Create working directory
WORKDIR /app

# Copy source to working directory
COPY ./duckhunt *.* /app/

# Run NPM install
RUN ls /app && npm install

# Launch DuckHunt
CMD [ "npm", "start" ]