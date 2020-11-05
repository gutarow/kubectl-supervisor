FROM ubuntu

MAINTAINER gutar (admin@escolasoft.com)

WORKDIR /root

# install supervisor, curl
RUN apt-get update && apt-get install -y supervisor curl

# install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.19.0/bin/linux/amd64/kubectl && \
  chmod +x ./kubectl && \
  sudo mv ./kubectl /usr/local/bin/kubectl


CMD ["supervisord", "-c", "/etc/supervisor/conf.d/kubernetes.conf"]



