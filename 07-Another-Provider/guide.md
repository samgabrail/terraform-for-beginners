# Another Provider

So far we've created an EC2 instance but haven't ssh'd into it. In this lab we will use the TLS provider in addition to the AWS provider to create a public/private key pair to be used to ssh into the EC2 instance.

## Instructions

1. Change directory into the `07-Another-Provider` directory:

```bash
cd 07-Another-Provider
```

2. Make sure you still have your environment variables otherwise export them as before:

```bash
export AWS_ACCESS_KEY_ID=your_value
export AWS_SECRET_ACCESS_KEY=your_value
```

3. Initialize Terraform Plan, and Terraform Apply

```bash
terraform init
terraform plan
terraform apply --auto-approve
```

Notice the `private_key` in the output is marked as sensitive because we specified that in the `output.tf` file.

4. Examine `main.tf`

In `main.tf` we now have another provider `tls`. We use the resource `tls_private_key` to create a private/public key pair. Then we create an `aws_key_pair` resource in AWS referencing the public key with: `tls_private_key.mykey.public_key_openssh`

Also we added a security group to allow SSH into the EC2 instance.

5. Examine the state file

Notice that the private key shows up in the state file! This is a very important concept to understant so you would secure your statefile.

6. SSH into the EC2 instance

We can get the value of the private key and store it in a file on disk then we can change the permissions on the file and finally ssh.

```bash
terraform output -raw private_key > myKey.pem
sudo chmod 400 myKey.pem
ssh -i myKey.pem ubuntu@$(terraform output -raw public_ip)
```

7. Now go ahead and destroy the environment.

```bash
terraform destroy --auto-approve
```

> Congratulations you have finished this lab!

