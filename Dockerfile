# Start from an official nginx base image (you can continue using Alpine or Ubuntu)
FROM nginx:1.27.3-alpine

# Copy only the required files to the image (e.g., only your web content)
COPY ./index.html /usr/share/nginx/html/index.html
COPY ./style.css /usr/share/nginx/html/style.css

# If you have any scripts to run, copy them
COPY ./start-nginx.sh /start-nginx.sh

# Expose the port where Nginx will run
EXPOSE 7000

# Run the start script (if you need any custom startup logic)
CMD ["/bin/sh", "/start-nginx.sh"]

