# Use Ubuntu 24.04 as the base image for the builder stage
FROM ubuntu:24.04 as builder

# Install required packages
RUN apt-get update && \
    apt-get install -y unzip openjdk-8-jdk libpcap-dev p7zip-full

# Copy source files
COPY src /CICFlowMeter/

# Set working directory
WORKDIR /CICFlowMeter

# Build from sources
RUN ./gradlew distZip

# Unpack the binary
RUN 7z x -y build/distributions/CICFlowMeter-4.0.zip -obuild/distributions

# Use Ubuntu 24.04 as the base image for the final stage
FROM ubuntu:24.04

# Install required packages
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk libpcap-dev wireshark-common pcapfix && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /CICFlowMeter

# Copy files from the builder stage
COPY --from=builder /CICFlowMeter/build/distributions/CICFlowMeter-* .

# Set working directory - important since relative path is used in the CLI "-Djava.library.path=../lib/native"
WORKDIR /CICFlowMeter/bin

# RUN CICFlowMeter CLI to extract features from pcap file or folder of pcap files
# USAGE: docker run -v /path/to/pcap:/tmp/pcap cicflowmeter /tmp/pcap/input /tmp/pcap/output
ENTRYPOINT ["./cfm"]
