# Setup

## Infrastructure
Creeper is a lambda function that runs on a 2 hour schedule to political party related tweets and dumps them in MongoDb database.

The infrastructure is managed with Hashicorp's Terraform. You can find instructions to download that [in the project website](https://www.terraform.io/downloads.html).


Here are the steps to setup/update the infrastructure:

- Request for the shared role ARN to be shared with you

- Share your AWS IAM user ARN so that it's included in the list of trusted entities for the shared role

- Setup the required variables for the terraform configuration

    echo shared_role_arn = "<shared_role_arn_shared_with_you>" >> terraform/terraform.tfvars
    
- Plan your changes

    terraform plan

- After verifying planned changes to the infrastructure, apply it by running:
    
    terraform apply