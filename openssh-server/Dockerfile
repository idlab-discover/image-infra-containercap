# Use the official Ubuntu as a base image
ARG IMAGE_VERSION=24.04
FROM ubuntu:${IMAGE_VERSION}

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install OpenSSH server
RUN apt-get update && apt-get install -y openssh-server \
    && rm -rf /var/lib/apt/lists/*

# Create the SSH directory and set up keys (if needed)
RUN mkdir /var/run/sshd

# Build argument to specify custom setup script
ARG SETUP_SCRIPT=config/empty-setup.sh
COPY --chmod=0755 ${SETUP_SCRIPT} /usr/local/bin/setup.sh

# Execute the setup script
RUN /usr/local/bin/setup.sh

# Expose SSH port
EXPOSE 22

# Start the SSH service
CMD ["/usr/sbin/sshd", "-D"]
