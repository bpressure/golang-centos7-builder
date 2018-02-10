FROM centos:centos7

RUN curl -O https://dl.google.com/go/go1.9.4.linux-amd64.tar.gz && tar xzf go*gz -C /usr/local && rm -f go*gz
ENV GOROOT=/usr/local/go
ENV GOPATH=/usr/lib/go
ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH

WORKDIR /project

RUN yum install epel-release  -y
RUN yum update -y
RUN yum install -y lz4-devel lz4 git
#librdkafka1 librdkafka-devel
RUN yum install -y rpm-build rpmdevtools

RUN go get -v github.com/Masterminds/glide
RUN go get -v github.com/spf13/viper
RUN go get -v github.com/spf13/cobra
RUN go get -v github.com/willf/bitset
RUN go get -v github.com/tidwall/gjson
RUN go get -v github.com/rcrowley/go-metrics
RUN go get -v github.com/hashicorp/go-immutable-radix
RUN go get -v github.com/hashicorp/golang-lru
RUN go get -v github.com/Shopify/sarama
RUN go get -v github.com/klauspost/compress
RUN go get -v github.com/cyberdelia/go-metrics-graphite
RUN go get -v github.com/shirou/gopsutil