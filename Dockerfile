FROM alpine:3.4

COPY flarectl /flarectl

RUN chmod +x /flarectl

ENTRYPOINT ["/flarectl"]
