FROM node:latest AS builder
# Above, we set the base image for this first stage as a light weigh node

WORKDIR './app'
COPY package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html