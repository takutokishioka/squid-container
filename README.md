# Squid Proxy Container

This repository contains a Dockerfile and configuration files to spin up a Squid proxy server container for local testing purposes.

## How to Spin Up the Container

To spin up the Squid proxy container, follow these steps:

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/yourusername/squid-proxy-container.git
    ```

2. Navigate to the repository directory:

    ```bash
    cd squid-proxy-container
    ```

3. Build the Docker image using the provided Dockerfile:

    ```bash
    docker build -t squid-proxy .
    ```

4. Run the Docker container:

    ```bash
    docker run -d --name squid-container squid-proxy
    ```

    This command will start the Squid proxy container in the background.

## How to Configure Proxy Settings

To configure proxy settings on your local machine to use the Squid proxy, Set the `http_proxy` and `https_proxy` environment variables.

```bash
export http_proxy=http://localhost:<squid-container-port>
export https_proxy=http://localhost:<squid-container-port>
```

## How to Check Access Logs

To check the access logs of the Squid proxy container, follow these steps:

1. Access the container's terminal:

    ```bash
    docker exec -it squid-container /bin/bash
    ```

2. View the access log file using a command like `cat`, `tail`, or `less`:

    ```bash
    cat /var/log/squid/access.log
    ```

    This command will display the contents of the access log file.