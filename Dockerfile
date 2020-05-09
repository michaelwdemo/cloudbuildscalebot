FROM google/cloud-sdk:alpine
CMD /bin/bash
WORKDIR /demo

# Add needed packages
RUN apk add util-linux

# Setup ssh
RUN mkdir /root/.ssh
ADD known_hosts /root/.ssh/known_hosts

# Setup git client
ADD id_rsa /root/.ssh/id_rsa
ADD id_rsa.pub /root/.ssh/id_rsa.pub
RUN git config --global user.email michaelwdemo@gmail.com
RUN git config --global user.name "Michael Demo"
RUN mkdir /scripts
ADD democommit /scripts/democommit
