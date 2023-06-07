FROM golang:1.18-alpine as builder
WORKDIR /root
COPY ./  ./
RUN export GO111MODULE=on && CGO_ENABLED=0 GOOS=linux go build -o ./main ./main.go
COPY html/  html/
FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root
COPY --from=builder /root/main ./
COPY --from=builder /root/html html/

ENTRYPOINT ["/root/main"]