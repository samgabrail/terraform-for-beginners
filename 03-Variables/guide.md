# Variables

In this lab we learn about Variables.

## Commands

1. Change directory into the `03-Variables` directory:

```bash
cd 03-Variables
```

2. Initialize and Terraform Apply

```bash
terraform init
terraform apply --auto-approve
```

You will get prompted for the External and Internal ports.
Use 8080 for the external port and 80 for the internal port.

3. Examine the `main.tf` file

Notice how we declare variables using the `variables` block and reference variables using var.<variable_name>.

This syntax: `"${var.image_name}:${var.image_tag}"` is called string interpolation as you can include variables inside strings.

4. Supply the variables via the CLI

Now rerun `terraform apply` but this time use the following command:

```bash
terraform apply -var 'external_port=8080' -var 'internal_port=80'
```

5. Now go ahead and destroy the environment using the `-destroy` flag which is another way of destroying the environment that is often used in CI/CD pipelines.

```hcl
terraform apply -destroy -var 'external_port=8080' -var 'internal_port=80'
```

> Congratulations you have finished this lab!

