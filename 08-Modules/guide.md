# Modules

The concept of modules is to re-use code by building bigger infrastructure constructs using modules as building blocks. We will move the TLS resource into a module. Typically you won't only put one resource into a module, but a collection of resources. We're only doing this to show a simple exmaple.

## Instructions

1. Change directory into the `08-Modules` directory:

```bash
cd 08-Modules
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

Notice that everything works the same as before.

4. Examine `main.tf`

Now the directory where the `main.tf` file exists is considered the root module. So far in this tutorial we've been doing everything in the root module.

From the root module we're calling our child `tls` module:

```hcl
module "tls" {
  source    = "./modules/tls"
  algorithm = "RSA"
  rsa_bits  = 4096
}
```

We need to specify the source path of the module along with the necessary input variables into the module.

We can also use a module's output by referencing the module using the syntax `mocule.<module_name>.<module_output> as shown below:

```hcl
resource "aws_key_pair" "mykey" {
  key_name   = var.my_aws_key
  public_key = module.tls.public_key_out
}
```

5. Examine the `tls` module

Now take a look at the `tls` directory under the `modules` directory. As a good practice, you should include at least 5 files in a module:
- README.md
- LICENSE
- main.tf
- variables.tf
- outputs.tf

Notice how there is nothing special about a module. It's the same Terraform code that we've learned so far.

6. Flow of Data

Notice how the output gets passed from the tls module to the root module and out to the CLI. Check the output of the tls module:

```hcl
output "private_key" {
  value     = tls_private_key.mykey.private_key_pem
  sensitive = true
}
output "public_key_out" {
  value = tls_private_key.mykey.public_key_openssh
}
```

Check the output of the root module:

```hcl
output "public_ip" {
  value       = aws_instance.webserver.public_ip
  description = "EC2 Public IP"
}
output "private_key" {
  value     = module.tls.private_key
  sensitive = true
}
```

7. Now go ahead and destroy the environment.

```bash
terraform destroy --auto-approve
```

> Congratulations you have finished this lab!

