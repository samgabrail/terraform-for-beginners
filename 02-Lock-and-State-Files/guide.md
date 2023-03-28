# Lock and State Files

In this lab we learn about the Lock and State files.

## Commands

1. Change directory into the 02-Lock-and-State-Files directory:

```bash
cd 02-Lock-and-State-Files
```

2. Initialize and Terraform Apply

```bash
terraform init
terraform apply --auto-approve
```

3. Examine the `.terraform.lock.hcl` file

The `.terraform.lock.hcl` file is a generated file that Terraform creates when it installs provider dependencies for a Terraform configuration. It contains a list of all the provider dependencies, including their version constraints, that were installed for the Terraform configuration.

The purpose of the `.terraform.lock.hcl` file is to ensure that the exact same versions of providers are installed each time the Terraform configuration is applied, regardless of the environment where it is applied. This helps to prevent unexpected changes or failures due to version differences in the provider dependencies.

When Terraform applies a configuration, it reads the `.terraform.lock.hcl` file to determine which provider dependencies to use, and then installs them if necessary. If the `.terraform.lock.hcl` file is not present, Terraform will attempt to download and install the latest version of each provider dependency, which may result in changes or failures if the latest version is incompatible with the configuration.

It is recommended to include the `.terraform.lock.hcl` file in version control along with the Terraform configuration to ensure that all team members and deployment environments are using the same provider versions.

4. Examine the `terraform.tfstate` file

The `terraform.tfstate` file is a generated file that Terraform uses to keep track of the current state of the resources managed by a Terraform configuration. This file contains information about the resources that were created or modified, their current state, and any metadata that is associated with them.

The purpose of the `terraform.tfstate` file is to enable Terraform to determine what changes need to be made to the resources when a configuration is applied. When Terraform applies a configuration, it reads the current state from the `terraform.tfstate` file, compares it to the desired state specified in the configuration, and then creates, modifies, or deletes resources as necessary to achieve the desired state.

The `terraform.tfstate` file is an important part of the Terraform workflow because it enables Terraform to perform resource management and maintain state over time. Without the `terraform.tfstate` file, Terraform would not be able to determine which resources need to be created, modified, or deleted, and it would not be able to maintain state across multiple runs of the same configuration.

It is important to store the `terraform.tfstate` file securely and consistently, since it contains sensitive information such as resource IDs, passwords, and access keys. Terraform supports several ways of storing the `terraform.tfstate` file, including local file storage, remote storage solutions like AWS S3 and Azure Blob Storage, and Terraform Cloud.

5. Destroy the environment and re-examine the state file to see what changed. Be very careful when using the `--auto-approve` flag with `terraform apply` or `terraform destroy`. This should not be used in production as it will override the prompt.

```hcl
terraform destroy --auto-approve
```

6. Examine the Docker provider documentation

https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs

> Congratulations you have finished this lab!

