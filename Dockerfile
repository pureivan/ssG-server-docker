FROM centos:centos6
MAINTAINER pureivan

# Download and Install shadowsocks
RUN \
yum update -y; \
yum install -y wget; \
yum install -y unzip; \
rpm -Uvh http://mirrors.kernel.org/fedora-epel/6/x86_64/epel-release-6-8.noarch.rpm; \
yum --disablerepo=epel -y update ca-certificates; \
yum install -y m2crypto  python python-pip python-setuptools git; \
yum clean all

# Download and Install shadowsocks
WORKDIR /opt/

RUN \
git clone -b manyuser https://github.com/breakwa11/shadowsocks.git

EXPOSE 1081
ENTRYPOINT python /opt/shadowsocks/shadowsocks/local.py -c /etc/shadowsocks.json
