# Use the official Alpine as a base image
FROM alpine:3.20 as builder

# Install tcpdump
RUN apk update && \
    apk add --no-cache tcpdump coreutils

# Set the entrypoint
ENTRYPOINT ["/usr/bin/tcpdump"]
