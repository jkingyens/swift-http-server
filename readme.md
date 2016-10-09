## Sample HTTP Server in Swift with Docker

This is a simple "hello world" http server written in Swift, using [Zewo](https://zewo.io) libraries. You can build, ship and run this server on any remote host/cloud using Docker:

    docker build -t=swift-server .
    docker run -d -p 80:8080 swift-server

The purpose of this was to build a Dockerfile that can run a swift project. This should be a usable boilerplate if you want to build and run Swift apps without setting up a compiler toolchain manually.
