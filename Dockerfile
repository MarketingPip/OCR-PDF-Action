# Dockerfile - created by github.com/MarketingPipeline
FROM debian:stable 

## Install linux / python dependencies 
RUN apt-get update -y && apt-get install -y \
    python3 \
    python3-pip \
    tesseract-ocr \
    ghostscript \
    ocrmypdf

## Install python project dependencies (optional if needed for additional packages)
# RUN pip3 install --break-system-packages ocrmypdf  # This can be skipped since we installed ocrmypdf via apt

## ADD . .

## Copy the Entry Point
COPY entrypoint /usr/local/bin/

## Make entry point executable
RUN ["chmod", "+x", "/usr/local/bin/entrypoint"]

## Provide access to entry point
ENTRYPOINT ["/usr/local/bin/entrypoint"]
