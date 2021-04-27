FROM docker.io/golang:1.15
WORKDIR /app

RUN apt-get update && apt-get install -y wamerican

COPY go.mod go.sum main.go ./

RUN go build -o ./openapi ./

ENTRYPOINT ["/app/openapi"]
