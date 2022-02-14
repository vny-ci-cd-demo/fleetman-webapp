FROM rupendrasoni/python2_alpine:latest

MAINTAINER Richard Chesterwood "richard@inceptiontraining.co.uk"

RUN apk --no-cache --update add python3 py-pip

RUN pip install j2cli

RUN apk add --update bash && rm -rf /var/cache/apk/*

RUN rm -rf /usr/share/nginx/html/*

COPY /dist /usr/share/nginx/html

COPY nginx.conf.j2 /templates/

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
