# CICFlowMeter

Fixed version of the CICFlowMeter tool by Distrinet (KU Leuven). 

More information:
- [Webpage CNS2022 Paper](https://intrusion-detection.distrinet-research.be/CNS2022/index.html)
- [GitHub Repository](https://github.com/GintsEngelen/CICFlowMeter)

## Git Submodule

The original GitHub repository is added under `src` as a git submodule. 

## How to use?

To use the tool inside a Docker container, follow these steps:

1. Set Up Directories:
     - Create a directory at `/path/to/pcap`.
     - Inside this directory, make two subfolders: 
       - `input` (for your input files)
       - `output` (where the tool will save its results).
2. Build the image.
    ```bash
    docker build -t cicflowmeter .
    ```
2. Run the Docker Command:
    ```bash
    docker run -v /path/to/pcap:/tmp/pcap cicflowmeter /tmp/pcap/input /tmp/pcap/output
    ```
    This command mounts your local /path/to/pcap directory to /tmp/pcap inside the Docker container and then runs the tool on the input, saving results to the output directory.