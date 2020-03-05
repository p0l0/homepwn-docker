FROM python:3.7

LABEL version=v.0.0.1 \
    description="Docker container for \"HomePwn - Swiss Army Knife for Pentesting of IoT Devices\"" \
    mantainer="https://gitlab.com/_p0l0_/"

WORKDIR /app

# Workaround until https://github.com/ElevenPaths/HomePWN/issues/8 gets resolved
COPY data/install.sh /app

COPY data/run.sh /app

RUN apt-get update \
    && git clone https://github.com/ElevenPaths/HomePWN.git \
    && cp /app/install.sh /app/HomePWN/ \ 
    && cd HomePWN \
    && export DEBIAN_FRONTEND=noninteractive \
    && bash install.sh -e y

CMD ["/bin/bash", "/app/run.sh"]
