# Stage 1: Build stage to get the reordercap binary
FROM alpine:3.20 as builder

# Install dependencies for wireshark to get reordercap
RUN apk update && \
    apk add --no-cache tcpdump coreutils

# Set the entrypoint
ENTRYPOINT ["/usr/bin/tcpdump"]
