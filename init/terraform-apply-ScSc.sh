env="ScSc"

terraform workspace new $env
terraform workspace select $env
terraform apply -var-file="$env.tfvars"

# Uncomment the following line if you want to use the storage account as the terraform state backend for the workspaces.
# Only one of the terraform-apply script sould have this uncommented otherwise you risk losing state files.
#
./terraform-create-backend.tfvars.sh