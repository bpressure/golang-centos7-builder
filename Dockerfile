FROM centos:centos7

RUN curl -O https://dl.google.com/go/go1.10.linux-amd64.tar.gz && tar xzf go*gz -C /usr/local && rm -f go*gz
ENV GOROOT=/usr/local/go
ENV GOPATH=/usr/lib/go
ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH

WORKDIR /project

RUN yum install epel-release  -y && \
    yum update -y && \
    yum install -y lz4-devel lz4 git&& \
    yum install -y rpm-build rpmdevtools

RUN go get -v github.com/Masterminds/glide\
      github.com/spf13/viper\
      github.com/spf13/cobra\
      github.com/willf/bitset\
      github.com/tidwall/gjson\
      github.com/rcrowley/go-metrics\
      github.com/hashicorp/go-immutable-radix\
      github.com/hashicorp/golang-lru\
      github.com/Shopify/sarama\
      github.com/klauspost/compress\
      github.com/cyberdelia/go-metrics-graphite\
      github.com/shirou/gopsutil\
      github.com/klauspost/cpuid
