FROM golang:latest
RUN go mod init
COPY go.mod .
COPY go.sum .
RUN go mod download
ENV GO111MODULE=off
RUN mkdir /app
ADD . /app/
WORKDIR /app
RUN go build -o ulmaceae .
CMD ["/app/ulmaceae"]
