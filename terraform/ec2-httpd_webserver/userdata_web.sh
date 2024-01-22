#!/bin/bash
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
cat << 'EOF' > /var/www/html/index.html
<!DOCTYPE html>
<html>
<body>

<h1>Welcome demo webserver created via Jenkins </h1>
<p>You are in demo class.</p>

</body>
</html>
EOF