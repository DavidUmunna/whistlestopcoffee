FROM nginx:alpine

ENV BACKEND_UPSTREAM_URL=https://railway-backend-csc8019-production.up.railway.app

# Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Clear bundled html so only our staged builds remain
RUN rm -rf /usr/share/nginx/html/*

# Copy templated config so the backend upstream can be injected at startup
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

# Copy built app from dist to nginx html root
COPY dist/ /usr/share/nginx/html/
