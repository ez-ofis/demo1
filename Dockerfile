# Use a specific version of Ubuntu as the base image
FROM ubuntu:20.04

# Update package list and install necessary packages
RUN apt update && \
    apt install -y apache2 vim curl zip && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /var/www/html/

# Copy the content into the container
COPY . .

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]
