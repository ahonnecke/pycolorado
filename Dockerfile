FROM ubuntu:disco

RUN touch /forever.txt
RUN apt-get update \
        && apt-get install -y --no-install-recommends \
        python3.6 \
        git \
        gcc \
        docker-compose \
        python3-venv \
        python3-pip

CMD ["/usr/bin/tail", "-f", "/forever.txt"]

