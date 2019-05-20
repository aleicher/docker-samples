FROM golang:1.11-alpine

RUN apk update && apk add git

WORKDIR /app
COPY go.mod .
COPY go.sum .

RUN go mod download
COPY main.go .
COPY homepage.html .
RUN CGO_ENABLED=0 go build -o server

CMD ["/app/server"]

