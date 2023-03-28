# Data Blocks

In this lab we learn about Data Blocks.

## Instructions

1. Change directory into the `06-Data-Blocks` directory:

```bash
cd 06-Data-Blocks
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

4. Notice the `data` block in `main.tf`

In `main.tf` we have a new block which is the `data` block. This block is used to get information as opposed to the resource block that is used to create resources. Here we're using the `data` block to retrieve the `id` of the Ubuntu 20.04 AMI.

We're then referencing this `id` using the following format: `data.aws_ami.ubuntu.id`

```hcl
resource "aws_instance" "webserver" {
  ami           = data.aws_ami.ubuntu.id
```

5. Notice the output is moved to `output.tf`

It's a common practice to move the `output` blocks to their own file. At minimum most Terraform configurations have a `main.tf` file, a `variables.tf` file, and an `output.tf` file.

6. Now go ahead and destroy the environment.

```bash
terraform destroy --auto-approve
```

> Congratulations you have finished this lab!

