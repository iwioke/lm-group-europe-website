# --- Build stage: compile Tailwind CSS ---
FROM node:20-alpine AS css-build
WORKDIR /build
COPY package.json package-lock.json* ./
RUN npm ci --no-audit --no-fund || npm install --no-audit --no-fund
COPY tailwind.config.js ./
COPY src ./src
COPY index.html ./
RUN npx tailwindcss -i src/input.css -o styles.css --minify

# --- Run stage: nginx serving static files ---
FROM nginx:1.27-alpine
COPY index.html /usr/share/nginx/html/index.html
COPY assets /usr/share/nginx/html/assets
COPY --from=css-build /build/styles.css /usr/share/nginx/html/assets/styles.css
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
