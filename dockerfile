# Use the official Nginx image as a base image
FROM nginx:latest

# Set the working directory in the container
WORKDIR /usr/share/nginx/html

# Create a personalized greeting HTML file
RUN echo "<!DOCTYPE html>" > index.html \
    && echo "<html>" >> index.html \
    && echo "<head><title>Présentation de Schéma Cible @ HAS</title></head>" >> index.html \
    && echo "<body>" >> index.html \
    && echo "<h1>Welcome to Docker PHP App</h1>" >> index.html \
    && echo "<p>Dockerfile de PACTE</p>" >> index.html \
    && echo "<p>Visitez notre site web: <a href='https://www.has-sante.fr'>www.has-sante.fr<>
    && echo "</body>" >> index.html \
    && echo "</html>" >> index.html

# Copy the application files into the container
COPY index.php .
COPY composer.json .
COPY phpunit.xml.dist .
COPY src ./src
COPY webroot ./webroot
COPY bin ./bin
COPY config ./config
COPY lib ./lib
COPY tests ./tests
COPY vendor ./vendor
COPY README.md .
# Expose port 8008 for the application
EXPOSE 8010

