FROM nginx

COPY devopsanton.conf /etc/nginx/conf.d/devopsanton.conf
COPY maintenance.html /etc/nginx/html/maintenance.html

RUN \
  apt-get update \
  && apt-get -y install gettext-base \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
