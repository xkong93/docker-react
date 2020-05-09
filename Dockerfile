FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#key point in production for port mapping
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
