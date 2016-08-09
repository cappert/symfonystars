## BUILDING
##   (from project root directory)
##   $ docker build -t php-7-0-9-on-debian .
##
## RUNNING
##   $ docker run -p 9000:9000 php-7-0-9-on-debian
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:9000
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/stacksmith-images/debian-buildpack:wheezy-r8

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="y30jmht" \
    STACKSMITH_STACK_NAME="PHP 7.0.9 on Debian" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install php-7.0.9-0 --checksum 206d8b7698328dad514fc6c61c8560b652aa8846a404a3415ca0086772d6a032

ENV PATH=/opt/bitnami/php/bin:$PATH

# Symfony 3 template
COPY . /app
WORKDIR /app

RUN composer install

EXPOSE 9000
CMD ["php", "bin/console", "server:run", "0.0.0.0:9000"]
