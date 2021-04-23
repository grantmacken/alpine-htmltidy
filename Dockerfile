# syntax=docker/dockerfile:experimental
FROM alpine:latest as bld
ARG RELEASE

WORKDIR = /home

ADD https://github.com/htacg/tidy-html5/archive/refs/tags/${RELEASE}.tar.gz ./tidy-html5.tar.gz

RUN  apk add --virtual .build-deps build-base cmake \
    && tar -zxvf ./tidy-html5.tar.gz -C /tmp \
    && cd /tmp/tidy-html5-${RELEASE}/build/cmake \
    && cmake ../.. -DCMAKE_BUILD_TYPE=Release \
    && make \ 
    && make install \
    && cd /home \
    && apk del .build-deps \
    && echo '---------------------------'

FROM alpine:latest
COPY --from=bld /usr/local /usr/local
COPY tidy.sh /
ENV LANG C.UTF-8
ENTRYPOINT ["/tidy.sh"]
