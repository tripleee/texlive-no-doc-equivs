# docker build -t texlive-no-doc-builde:latest .
# 2>&1 | tee docker-build.log

FROM debian:latest

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y make equivs

COPY Makefile .
COPY texlive-no-doc.control .

CMD ["make", "DST=/mnt", "export"]

# docker run --rm -v `pwd`:/mnt texlive-no-doc-builder:latest
