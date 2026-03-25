
FROM ubuntu:latest


ENV DEBIAN_FRONTEND=noninteractive

#
RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    procps \
    file \
    sudo \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*


RUN useradd -m -s /bin/bash linuxbrew && \
    echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers


USER linuxbrew
WORKDIR /home/linuxbrew


RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


ENV PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"


RUN brew install zeroclaw


RUN curl -fsSL https://ollama.com/install.sh | sh


EXPOSE 11434


CMD ["ollama", "serve"]
