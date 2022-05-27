FROM golang:latest
RUN go mod init
COPY go.mod go.sum ./
RUN go mod download && go mod verify
ENV GO111MODULE=auto
RUN mkdir /app
ADD . /app/
WORKDIR /app
RUN go build -o ulmaceae .
CMD ["/app/ulmaceae"]
