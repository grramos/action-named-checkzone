FROM ubuntu:latest

COPY . .

RUN chmod +x /docker-entrypoint.sh

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y bind9utils

ENTRYPOINT ["/docker-entrypoint.sh"]
