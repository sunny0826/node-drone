FROM amd64/node:8-alpine

LABEL maintainer="sunnydog0826@gmail.com"

COPY script.sh /bin/
COPY ossutil /bin/

RUN npm config set registry https://registry.npm.taobao.org \
&& chmod +x /bin/ossutil \
&& chmod +x /bin/script.sh 
 
ENTRYPOINT ["script.sh"]