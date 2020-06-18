env="ScSc-CIO-BYOD"

terraform workspace new $env
terraform workspace select $env
terraform apply -parallelism=30 -var-file="$env.tfvars"

retVal=$?
if [ $retVal -ne 0 ]; then
    echo "terraform apply returned error, exiting."
    exit $retVal
fi

# Backup newly applied state file
terraform state pull > "$env-tfstate.backup"