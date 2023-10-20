FROM centos:latest

# Install dependencies
RUN yum update -y && \
    yum install -y httpd && \
    yum search wget && \
    yum install wget -y && \
    yum install unzip -y

# change directory
RUN cd /var/www/html

# download webfiles
RUN wget https://github.com/Phatcm/jupiter/archive/refs/heads/master.zip

# unzip folder
RUN unzip master.zip

# copy files into html directory
RUN cp -r jupiter-master/* /var/www/html/

# remove unwanted folder
RUN rm -rf jupiter-master master.zip

# exposes port 80 on the container
EXPOSE 80 22

# set the default application that will start when the container start
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]