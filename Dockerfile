FROM golang:alpine AS build
WORKDIR /app
COPY main.go /app/
RUN go build main.go

FROM scratch AS app
WORKDIR /app
COPY --from=build /app/main /app/
ENTRYPOINT [ "./main" ]