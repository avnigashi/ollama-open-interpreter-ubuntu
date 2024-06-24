FROM ubuntu:22.04

# Install Python 3.10 and pip
RUN apt-get update && \
    apt-get install -y python3.10 python3.10-venv python3-pip curl

# Create a virtual environment
RUN python3.10 -m venv /opt/open-interpreter-env

# Activate virtual environment and install Open Interpreter with optional dependencies
RUN /bin/bash -c "source /opt/open-interpreter-env/bin/activate && \
    pip install open-interpreter && \
    pip install gpt-engineer"

# Set the virtual environment as the default Python environment
ENV PATH="/opt/open-interpreter-env/bin:$PATH"

# Ensure the container remains running for further interaction
CMD ["tail", "-f", "/dev/null"]
