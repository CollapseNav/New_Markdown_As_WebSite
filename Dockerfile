FROM nginx:alpine
WORKDIR /usr/share/nginx/html
ENV TZ=Asia/Shanghai
COPY ./ ./
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
