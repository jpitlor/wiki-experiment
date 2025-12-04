FROM node:25 as build

COPY package.json package-lock.json ./
RUN npm ci

COPY ./ ./
RUN npm run build

FROM nginx:1.29.3

COPY --from=build /build /var/www/html
EXPOSE 80