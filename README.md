### Terraform experiments

##### A personal project where I try out my terraform scripts as I learn.

### vpc.tf 

- creates vpc with 172.31.0.0/16 and 3 public, 3 private subnets with each nat gateway.
- Region is hardcoded in vars.tf
- aws.tf is for aws variables and for terraform provider
- change terraform.tfvars.example to terraform.tfvars and add your own keys.
