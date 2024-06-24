FROM ubuntu:22.04

# Install Python 3.10, pip, and other necessary tools
RUN apt-get update && \
    apt-get install -y python3.10 python3.10-venv python3-pip curl

# Create a virtual environment
RUN python3.10 -m venv /opt/open-interpreter-env

# Activate virtual environment and install Open Interpreter with optional dependencies
RUN /bin/bash -c "source /opt/open-interpreter-env/bin/activate && \
    pip install open-interpreter"

# Set the virtual environment as the default Python environment
ENV PATH="/opt/open-interpreter-env/bin:$PATH"

# Add alias to .bashrc
RUN echo "alias ipr='interpreter --api_base \${API_BASE} --model \${MODEL}'" >> /root/.bashrc

# Ensure the container remains running for further interaction
CMD ["tail", "-f", "/dev/null"]
