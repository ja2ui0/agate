FROM alpine:edge

ENV HOSTNAME="" \
    LANG="en-US"

COPY ./agate* /

CMD ["sh", "agate.sh"]

EXPOSE 1965
VOLUME /content /.certificates
