#!/bin/bash
yum update -y
yum install wget git -y # Install wget and git.

###########   Begin Docker Installation ###############
amazon-linux-extras install docker -y
service docker start
usermod -a -G docker ec2-user
#================ END Docker Installations ================#
mkdir my-webapp
cd my-webapp

cat <<EOF > index.html
<HTML>
<HEAD>
<TITLE>Cloud Training 44 </TITLE>
</HEAD>
<BODY BGCOLOR="FFFFFF">
<CENTER><IMG SRC="clouds.jpg" ALIGN="BOTTOM"> </CENTER>
<HR>
<a href="https://fymus.com">Link Name</a>
is a link to another nifty site
<H1>This is a Header</H1>
<H2>This is a Medium Header</H2>
Send me mail at <a href="mailto:support@fymus.com">
support@fymus.com</a>.
<P> This is a new paragraph!
<P> <B>This is a new paragraph!</B>
<BR> <B><I>This is a new sentence without a paragraph break, in bold italics.</I></B>
<HR>
</BODY>
</HTML>
EOF

cat <<EOF > Dockerfile
FROM nginx:stable
COPY index.html /usr/share/nginx/html/
EOF

docker build -t my-website:0.1 .  #Build the docker image

docker run --rm --name my-website -d -p 9090:80 my-website:0.1   #Run docker container