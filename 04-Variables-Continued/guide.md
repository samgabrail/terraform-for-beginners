# Variables

In this lab we learn about Variables.

## Instructions

1. Change directory into the `04-Variables-Continued` directory:

```bash
cd 04-Variables-Continued
```

2. Initialize and Terraform Apply

```bash
terraform init
terraform apply --auto-approve
```

3. Examine the `variables.tf` file

Notice that we just moved the 4 variable blocks here. Terraform doesn't care how many `.tf` files you have, it will merge all of these files that live in the same directory.

This `variables.tf` file is used to declare our variables with reasonable defaults if applicable.

4. Examine the `terraform.tfvars` file

This file is used to assign values to our variables and will override the default values assigned in the `variables.tf` file.

5. Now go ahead and destroy the environment.

```bash
terraform destroy --auto-approve
```

> Congratulations you have finished this lab!

