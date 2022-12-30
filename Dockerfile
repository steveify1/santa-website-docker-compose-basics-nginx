FROM node:alpine
WORKDIR /webapi
COPY ./package.json ./
RUN npm i
EXPOSE 3000
LABEL "project"="santa-website"
COPY ./ ./
RUN npm run build
CMD ["npm", "start"]