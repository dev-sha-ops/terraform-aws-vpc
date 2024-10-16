# Commands to create s3 for state of terraform
go to the s3 module setup drectory `setup dir`
``` bash
cd modules/s3/setup/

terraform plan
terraform apply
```
# Commands to create vpc from terraform
go to the previous drectory `root dir`
``` bash
cd ../../../
terraform init -backend-config environment/test/backend.conf
terraform plan -var-file environment/test/terraform.tfvars
terraform apply -var-file environment/test/terraform.tfvars
```