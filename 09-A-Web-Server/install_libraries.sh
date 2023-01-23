#!/bin/bash
echo "Installing tree, jq, and nginx"
apt -y update
apt install tree jq -y
apt install nginx -y
systemctl enable nginx
sudo cat << EOF > /tmp/index.html
<html>
    <head>
        <title>Schoolapp</title>
    </head>
    <body>
        <h1 style="text-align: center;">Welcome to the School App</h1>
        <p style="text-align: center;">
        <img src="https://images.unsplash.com/photo-1508830524289-0adcbe822b40?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&q=80" alt="School App">
        </p>
        <p style="text-align: center;">
        Photo by <a href="https://unsplash.com/@altumcode?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">AltumCode</a> on <a href="https://unsplash.com/s/photos/courses?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
        </p>
        <h2 style="text-align: center;">This message confirms that your App is working with an NGINX web server. Great work!</h2>
    </body>
</html>
EOF
sudo mv /tmp/index.html /var/www/html/index.html
sudo nginx -s reload
