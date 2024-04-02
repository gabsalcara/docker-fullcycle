FROM golang:1.22 as builder

WORKDIR /src
COPY full-cycle.go .

RUN go build -o /bin/init ./full-cycle.go

FROM scratch
COPY --from=builder /bin/init /bin/init
CMD ["/bin/init"]