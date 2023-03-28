# AWS Setup and Outputs

In this lab we learn about AWS with Terraform and Terraform Outputs.

## Instructions

1. Change directory into the `05-AWS-Setup-and-Outputs` directory:

```bash
cd 05-AWS-Setup-and-Outputs
```

2. Create environment variables to connect to AWS

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

Notice the output of Terraform gives us the public IP of the EC2 instance.

4. Examine the `main.tf` file

We are now using the `aws` provider. Also the `output` block is referencing the `public_ip` attribute of the EC2 instance likie this: `aws_instance.webserver.public_ip`

5. Examine the `variables.tf` file

We have 2 variables defined with defaults:
- region
- my_instance_type

6. Check the EC2 instance that got created in the AWS console

7. Now go ahead and destroy the environment.

```bash
terraform destroy --auto-approve
```

> Congratulations you have finished this lab!

