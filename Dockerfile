FROM golang:1.13 as builder

ADD . /app/
WORKDIR /app/
RUN make build

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /app/cloudlog /usr/local/bin/
ENTRYPOINT ["cloudlog"]