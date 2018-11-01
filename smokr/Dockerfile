FROM alpine:3.8

RUN apk update && apk upgrade
RUN mkdir /usr/app
WORKDIR /usr/app

# ruby
RUN apk add --no-cache ruby ruby-json ruby-bundler ruby-io-console

# c
RUN apk add --no-cache gcc musl-dev

# c++
RUN apk add --no-cache g++

# python2
RUN apk add --no-cache python && \
    python -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip install --upgrade pip setuptools && \
    rm -r /root/.cache

# python3
RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache

# java 7
ENV JAVA_HOME=/usr/lib/jvm/default-jvm
RUN apk add --no-cache openjdk7 && \
    ln -sf "${JAVA_HOME}/bin/"* "/usr/bin/"

# mono c-sharp
RUN apk add --no-cache mono --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing && \
    apk add --no-cache --virtual=.build-dependencies ca-certificates && \
    cert-sync /etc/ssl/certs/ca-certificates.crt && \
    apk del .build-dependencies

COPY runner.rb ./runner.rb
COPY run.sh ./run.sh
COPY output.json ./output.json

RUN rm -rf /var/cache/apk/*

COPY Gemfile /usr/app/
COPY Gemfile.lock /usr/app/
RUN bundle install

CMD JSON_SRC="$JSON_SRC" sh ./run.sh
