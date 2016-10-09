FROM ubuntu:15.10
RUN apt-get -y update
RUN apt-get -y install clang libicu-dev wget libpython2.7-dev libxml2-dev libcurl4-openssl-dev git
RUN wget https://swift.org/builds/swift-3.0-release/ubuntu1510/swift-3.0-RELEASE/swift-3.0-RELEASE-ubuntu15.10.tar.gz
RUN wget https://swift.org/builds/swift-3.0-release/ubuntu1510/swift-3.0-RELEASE/swift-3.0-RELEASE-ubuntu15.10.tar.gz.sig
RUN wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import -
RUN gpg --keyserver hkp://pool.sks-keyservers.net --refresh-keys Swift
RUN gpg --verify swift-3.0-RELEASE-ubuntu15.10.tar.gz.sig
RUN tar xzf swift-3.0-RELEASE-ubuntu15.10.tar.gz
WORKDIR /package
ADD . /package
RUN /swift-3.0-RELEASE-ubuntu15.10/usr/bin/swift build
ENTRYPOINT [ "/package/.build/debug/MyServer" ]
EXPOSE 8080
