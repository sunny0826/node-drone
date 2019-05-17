FROM node:8-alpine

RUN apk add curl \ 
&& npm config set registry https://registry.npm.taobao.org \
&& curl -L http://gosspublic.alicdn.com/ossutil/1.6.0/ossutil64 -o /usr/drone/bin/ossutil \
&& chmod +x /usr/drone/bin/ossutil
 

ADD script.sh /bin/
RUN chmod +x /bin/script.sh 
ENTRYPOINT /bin/script.sh