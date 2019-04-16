#Grab the latest alpine image
FROM ubuntu:latest

ENV PERSISTENT_DEPS \
    graphviz \
    python \
    #py2-pip \
    #sed \
    #ttf-droid \
    #ttf-droid-nonlatin \
    pandoc \
    nodejs

# Install/Build Packages
RUN apt update && \
	apt upgrade --yes && \
    apt install --yes $PERSISTENT_DEPS

# Add our code
ADD ./ /srv/app/
WORKDIR /srv/app

# Expose is NOT supported by Heroku
# EXPOSE 5000 		

# Run the image as a non-root user
# RUN adduser -D node
# USER node

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku
CMD npm start -PORT	$PORT
