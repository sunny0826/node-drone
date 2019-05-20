FROM amd64/node:8-alpine

LABEL maintainer="sunnydog0826@gmail.com"

COPY ossutil /bin/

RUN npm config set registry https://registry.npm.taobao.org \
&& chmod +x /bin/ossutil \
&& apk -Uuv add curl ca-certificates
 
ENTRYPOINT ossutil config -e oss-cn-shanghai-internal.aliyuncs.com -i "${PLUGIN_ID}" -k "${PLUGIN_SECRET}"