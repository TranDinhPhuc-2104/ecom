# Build stage
FROM node:24-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
# Backend URL baked into the bundle at build time
ARG VITE_API_BASE_URL=http://api.ecom.vn/api
ENV VITE_API_BASE_URL=$VITE_API_BASE_URL
RUN npm run build

# Run stage
FROM nginx:alpine

COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
