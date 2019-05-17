FROM node:8-alpine

RUN npm config set registry https://registry.npm.taobao.org \
&& wget http://gosspublic.alicdn.com/ossutil/1.6.0/ossutil64 \
&& chmod 755 ossutil64 \
&& mv ossutil64 /bin/ossutil

ADD script.sh /bin/
RUN chmod +x /bin/script.sh 
ENTRYPOINT /bin/script.sh
								