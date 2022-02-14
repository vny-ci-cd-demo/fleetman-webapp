#FROM nginx:1.21.6-alpine

FROM tiangolo/uwsgi-nginx:python2.7

MAINTAINER Richard Chesterwood "richard@inceptiontraining.co.uk"

RUN apk add --update 
            
RUN  curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py && python get-pip.py
      
RUN  pip2 install j2cli[yaml]

RUN apk add --update bash && rm -rf /var/cache/apk/*

RUN rm -rf /usr/share/nginx/html/*

COPY /dist /usr/share/nginx/html

COPY nginx.conf.j2 /templates/

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
