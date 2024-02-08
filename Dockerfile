FROM golang:1.21-alpine as builder

WORKDIR /usr/src/app

COPY . .

RUN go build -v -o /app main.go


FROM scratch

WORKDIR /app

COPY --from=builder /app /main

EXPOSE 8080

ENTRYPOINT [ "/main" ]