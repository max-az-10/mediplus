# Start from an official nginx base image (you can continue using Alpine or Ubuntu)
FROM nginx:1.27.3-alpine

# Create a non-root user (in this case, we will create 'nginxuser')
RUN adduser -D nginxuser

# Copy only the required files to the image (be specific)
COPY ./index.html /usr/share/nginx/html/index.html
COPY ./style.css /usr/share/nginx/html/style.css

# Set the ownership of the copied files to the non-root user (nginxuser)
RUN chown -R nginxuser:nginxuser /usr/share/nginx/html

# Expose the port where Nginx will run
EXPOSE 7000

# Switch to the non-root user before running the application
USER nginxuser

# Run Nginx as the non-root user
CMD ["nginx", "-g", "daemon off;"]

