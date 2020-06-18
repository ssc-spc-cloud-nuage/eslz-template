env="ScSc"

terraform workspace select $env

echo "key = \"terraform.tfstate\"" > ../project/backend.tfvars
terraform output >> ../project/backend.tfvars

echo "key = \"terraform.tfstate\"" > ../LZ/backend.tfvars
terraform output >> ../LZ/backend.tfvars