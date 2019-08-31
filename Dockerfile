FROM ubuntu:xenial

RUN touch /forever.txt
RUN apt-get update \
        && apt-get install -y --no-install-recommends \
        python3 \
        python3-pip

CMD ["/usr/bin/tail", "-f", "/forever.txt"]

