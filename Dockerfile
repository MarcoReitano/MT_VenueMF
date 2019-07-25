FROM nginx:alpine
MAINTAINER Marco Reitano <marcoreitano@th-koeln.de>

COPY ./elements /usr/share/nginx/html
