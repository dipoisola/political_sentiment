# Creeper

Creeper is a serverless function that runs on a bi-hourly schedule to <br>
find tweets about political parties in Nigeria. <br>
It cleans personally identifiable information from such tweets then <br>
dumps them in an S3 Bucket.

## Create AWS Lambda Infrastructure

The infrastructure for "Creeper" is managed with Hashicorp's Terraform.<br>
You can find instructions to download that [in the project website](https://www.terraform.io/downloads.html).

The necessary steps to follow in order to create or update the <br>
infrastructure are as follow:

- Request for the shared role ARN to be shared with you

- Share your AWS IAM user ARN so that it's included in the <br>
  list of trusted entities for the shared role

- Setup the required variables for the terraform configuration

```bash
echo shared_role_arn = "<shared_role_arn_shared_with_you>" >> \
terraform/terraform.tfvars
```        

- Plan your changes

```bash
terraform plan
```

- After verifying planned changes to the infrastructure, apply it <br>
  by running:

```bash    
terraform apply
```


