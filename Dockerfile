FROM pleasegivemedockerid/hpvsop-base-ssh:1.1.0-release-ce4ff60
FROM pleasegivemedockerid/nginx:alpine-s390x-trust

# for hpvs-base
COPY init.sh /usr/bin
RUN chmod +x /usr/bin/init.sh

# for application
RUN rm /etc/nginx/conf.d/*
ADD hello.conf /etc/nginx/conf.d/
ADD index.html /usr/share/nginx/html/

# Execute init code
ENTRYPOINT ["/usr/bin/init.sh"]
