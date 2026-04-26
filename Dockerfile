# Use the lightweight Nginx alpine image
FROM nginx:alpine
# Copy your website files to the Nginx html directory
COPY . /usr/share/nginx/html
# Expose port 80
EXPOSE 80