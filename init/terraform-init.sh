env="ScSc"

terraform init
terraform workspace new $env
terraform workspace select $env