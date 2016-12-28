FROM alpine:3.4

RUN apk add --no-cache ca-certificates

COPY flarectl /flarectl

RUN chmod +x /flarectl

ENTRYPOINT ["/flarectl"]
