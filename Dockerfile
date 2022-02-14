FROM nginx:1.21.6-alpine

MAINTAINER Richard Chesterwood "richard@inceptiontraining.co.uk"

COPY APKINDEX.70c88391.tar.gz APKINDEX.70c88391.tar.gz

COPY APKINDEX.5022a8a2.tar.gz APKINDEX.5022a8a2.tar.gz

RUN apk add --update --no-cache python2 
            
RUN  curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py && python get-pip.py
      
RUN  pip2 install j2cli[yaml]

RUN apk add --update bash && rm -rf /var/cache/apk/*

RUN rm -rf /usr/share/nginx/html/*

COPY /dist /usr/share/nginx/html

COPY nginx.conf.j2 /templates/

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
