FROM ubuntu

MAINTAINER Gutar "<admin@escolasoft.com>"

WORKDIR /root

# install supervisor, curl
RUN apt-get update && apt-get install -y supervisor curl && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/*

# install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.19.0/bin/linux/amd64/kubectl && \
  chmod +x ./kubectl && \
  mv ./kubectl /usr/local/bin/kubectl

RUN echo 'export KUBECONFIG=~/.kube/config.yaml' >> ~/.bashrc


CMD ["supervisord", "-c", "/etc/supervisor/conf.d/kubernetes.conf"]



