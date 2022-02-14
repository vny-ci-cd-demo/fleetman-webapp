#FROM nginx:1.21.6-alpine

FROM tiangolo/uwsgi-nginx:python2.7

MAINTAINER Richard Chesterwood "richard@inceptiontraining.co.uk"
            
RUN rm -rf /usr/share/nginx/html/*

COPY /dist /usr/share/nginx/html

COPY nginx.conf.j2 /templates/

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
