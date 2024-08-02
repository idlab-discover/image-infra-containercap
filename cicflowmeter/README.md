# CICFlowMeter

Two versions of the fixed CICFlowMeter tool by Distrinet (KU Leuven). Once with additional recommended tools `reordercap` and `pcapfix`, and once without.

More information:
- [Webpage CNS2022 Paper](https://intrusion-detection.distrinet-research.be/CNS2022/index.html)
- [GitHub Repository](https://github.com/GintsEngelen/CICFlowMeter)
- [Reordercap](https://www.wireshark.org/docs/man-pages/reordercap.html)
- [Pcapfix](https://github.com/Rup0rt/pcapfix)

## Images Overview

| Tag         | From             | Tools                                                       |  Size  |
|-------------|------------------|-------------------------------------------------------------|--------|
| 1.0.0       | `alpine:latest`  | `CICFlowMeter`                                              |  164MB |
| tools-1.0.0 | `ubuntu:24.04`   | `CICFlowMeter`, `wireshark` (incl. `reordercap`), `pcapfix` | 1.15GB |


## Git Submodule

The original GitHub repository is added under `src` as a git submodule. 

## How to use?

To use the tool inside a Docker container, follow these steps:

1. Set Up Directories:
     - Create a directory at `/path/to/pcap`.
     - Inside this directory, make two subfolders: 
       - `input` (for your input files)
       - `output` (where the tool will save its results).
2. Run the Docker Command:
    ```bash
    docker run -v /path/to/pcap:/tmp/pcap ghcr.io/idlab-discover/concap/cicflowmeter:1.0.0 /tmp/pcap/input /tmp/pcap/output
    ```
    This command mounts your local /path/to/pcap directory to /tmp/pcap inside the Docker container and then runs the tool on the input, saving results to the output directory.