# Containers Images and Artefacts for ConCap

This directory provides as an overview of the container images used with ConCap. Each subdirectory contains the Dockerfile, configurations and sources required to build the image.

## Building Images

### Build a Single Image

To build a single image, navigate to the respective subdirectory and run:

```sh
docker build -t <image_name> .
```

### Build All Images

To automatically build all the images, run the following command:

```sh
make all
```

## Contributing

Contributions are welcome! Please follow these steps to add a new image:

1. Fork the repository.
2. Create a new branch 
    ```git checkout -b feature-branch```
3. Create a new subdirectory for the new image. Use following directory structure:
    ```
    <image_name>/
    ├── src/         # Source files needed to build the image
    ├── config/      # Configuration files needed to build the image
    ├── data/        # Data files needed to build the image
    ├── Dockerfile   # The Dockerfile to build the image
    ├── Makefile     # The Makefile with the container build and push commands
    └── README.md    # Short description of the image
    ```
4. Commit your changes 
    ```git commit -am 'New image <image_name>'```
5. Push to the branch 
    ```git push origin feature-branch```
6. Create a new Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.