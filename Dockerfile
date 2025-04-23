# Use Ubuntu base image
FROM ubuntu:22.04

# Install required packages
RUN apt update && apt install -y g++ cmake curl unzip libpthread-stubs0-dev

# Set working directory
WORKDIR /app

# Copy your entire project into the container
COPY . .

# Compile your C++ code with proper flags and includes
RUN g++ -std=c++17 src/*.cpp \
    -I src \
    -I src/Crow-1.2.0-Darwin/include \
    -I src/asio-asio-1-18-2/asio/include \
    -o src/app \
    -lpthread

# Set the port Render expects (IMPORTANT: must match what your app listens on)
EXPOSE 8080

# Set the command to run your app
CMD ["./src/app"]
