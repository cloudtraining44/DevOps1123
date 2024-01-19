#!/bin/bash
yum update -y
yum install wget git -y # Install wget and git.

###########   Begin Docker Installation ###############
yum update -y
amazon-linux-extras install docker
service docker start
usermod -a -G docker ec2-user
#================ END Docker Installations ================#
mkdir my-webapp
cd my-webapp

cat <<EOF > index.html
Welcome, Sohail
EOF

cat <<EOF > Dockerfile
FROM nginx:stable
COPY index.html /usr/share/nginx/html/
EOF

docker build -t my-website:0.1 .  #Build the docker image

docker run --rm --name my-website -d -p 8080:80 my-website:0.1   #Run docker container