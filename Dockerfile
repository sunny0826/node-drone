FROM node:8-alpine

LABEL maintainer="sunnydog0826@gmail.com"

COPY script.sh /bin/

RUN apk add curl \ 
&& npm config set registry https://registry.npm.taobao.org \
&& curl -L http://gosspublic.alicdn.com/ossutil/1.6.0/ossutil64 -o /bin/ossutil \
&& ls /bin \
&& chmod +x /bin/ossutil \
&& chmod +x /bin/script.sh 
 
ENTRYPOINT /bin/script.sh