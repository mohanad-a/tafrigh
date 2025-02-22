# Use the official Python 3.12 Slim image as the base image
FROM python:3.12-slim

# Set the working directory to /tafrigh
WORKDIR /tafrigh

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ffmpeg \
    gcc \
    build-essential \
    portaudio19-dev \
    libasound2-dev && \
    rm -rf /var/lib/apt/lists/*

# Use build arguments to specify dependencies
ARG DEPS="wit,whisper"

# Install tafrigh with the specified dependencies
RUN pip install tafrigh[$DEPS]

# Set the entrypoint to run the installed binary in /tafrigh
# Example: docker run -it --rm -v "$PWD:/tafrigh" tafrigh ...
ENTRYPOINT ["tafrigh"]
