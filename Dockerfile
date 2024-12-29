# Start from an official nginx base image
FROM nginx:1.27.3-alpine

# Copy only the required files to the image
COPY ./index.html /usr/share/nginx/html/index.html
COPY ./style.css /usr/share/nginx/html/style.css


# Expose the port where Nginx will run
EXPOSE 7000
