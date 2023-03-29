# A Web Server

The concept of modules is to re-use code by building bigger infrastructure constructs using modules as building blocks. We will move the TLS resource into a module. Typically you won't only put one resource into a module, but a collection of resources. We're only doing this to show a simple exmaple.

## Instructions

1. Change directory into the `09-A-Web-Server` directory:

```bash
cd 09-A-Web-Server
```

2. Make sure you still have your environment variables otherwise export them as before:

```bash
export AWS_ACCESS_KEY_ID=your_value
export AWS_SECRET_ACCESS_KEY=your_value
```

3. Initialize Terraform Plan, and Terraform Apply

Notice how Terraform initializes our new module.

```bash
terraform init
terraform plan
terraform apply --auto-approve
```

Now in a browser tab paste the public IP to see your new and shiny web server running.

4. Examine `main.tf`

We've included two additional things:

- Updated the security group to include port 80 to access our web server

```hcl
...truncated
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP Ingress"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }
...truncated
```

- Added the user_data field 

Here the `user_data` field uses the `file()` function to call on the `install_libraries.sh` script. The `user_data_replace_on_change = true` property means that if Terraform senses a change in the content of `user_data` then it will rebuild the EC2 instance.

```hcl
resource "aws_instance" "webserver" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.my_instance_type
  key_name                    = aws_key_pair.mykey.key_name
  vpc_security_group_ids      = [aws_security_group.security_group1.id]
  user_data                   = file("install_libraries.sh")
  user_data_replace_on_change = true
}
```

5. Examine the `install_libraries.sh` script

This is the file that the EC2 instance uses to configure our web server. We install an nginx webserver and create a simple `index.html` page.

6. Now go ahead and destroy the environment.

```bash
terraform destroy --auto-approve
```

> Congratulations you have finished this lab!

