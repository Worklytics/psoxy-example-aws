# Psoxy for Worklytics Example - AWS


[![Latest Release](https://img.shields.io/github/v/release/Worklytics/psoxy-example-aws)](https://github.com/Worklytics/psoxy-example-aws/releases/latest)
![build passing](https://img.shields.io/github/actions/workflow/status/Worklytics/psoxy-example-aws/terraform_validate.yaml?label=build%20passing)

This is a template repo for a Terraform configuration that deploys the [Worklytics pseudonymization
proxy (psoxy)](https://github.com/Worklytics/psoxy) on AWS.

## Usage

This is a template repo.  To use it, follow the instructions below.

See [GitHub's documentation](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template)
for more details.

 1. Click the 'Use this template' button in the upper right corner of [this page](https://github.com/Worklytics/psoxy-example-aws).
    - choose a name for your copy of this repo
    - leave "Include all branches" unchecked

 2. Clone the resulting repo to your machine.

```shell
git clone
```
 3. Check your prereqs. Review versions and install anything needed.

```shell
./check-prereqs
```

 4. Initialize your configuration

```shell
./init
```

 5. Review your `terraform.tfvars` file; customize as needed (eg, comment out datasources you don't need).

 6. Run `terraform plan` and review results to understand what will be created. Customize your
    `terraform.tfvars` or `main.tf` file if needed.

```shell
terraform plan
```

 7. Run `terraform apply` to create the resources.
```shell
terraform apply
```

## Support

This example repo is maintained by [Worklytics](https://worklytics.co). Paid support is available.
Please contact [sales@worklytics.co](mailto:sales@worklytics.co).

