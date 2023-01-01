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
EXPOSE 80
ENTRYPOINT ["./startup.sh"]
RUN chmod +x ./startup.sh