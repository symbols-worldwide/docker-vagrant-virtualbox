FROM symbols/virtualbox:5.1

LABEL maintainer="simon@widgit.com"

RUN wget -O /root/vagrant_1.9.8_x86_64.deb \
      https://releases.hashicorp.com/vagrant/1.9.8/vagrant_1.9.8_x86_64.deb && \
    dpkg -i /root/vagrant_1.9.8_x86_64.deb && \
    rm /root/vagrant_1.9.8_x86_64.deb && \
    apt-get -y update && \
    apt-get -y install rsync && \
    apt-get -y clean

COPY run_vagrant_and_wait.sh /usr/local/bin/run_vagrant_and_wait.sh

CMD ["/usr/local/bin/run_vagrant_and_wait.sh"]
WORKDIR /vagrant

