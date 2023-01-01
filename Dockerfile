FROM nginx
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs
RUN npm i pm2 -g
LABEL "project"="santa-website"
COPY ./nginx.conf /etc/nginx/nginx.conf
WORKDIR /webapi
COPY ./package.json ./
RUN npm i
COPY ./ ./
RUN npm run build
RUN pm2 start npm -- --name webserver start
CMD ["nginx", "-g", "daemon off;"]