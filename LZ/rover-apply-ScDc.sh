# env="ScSc"

#terraform workspace new $env
#terraform workspace select $env

/tf/rover/launchpad.sh workspace create dev

# Backup old state file
#terraform state pull > "$env-tfstate.backup.old"

/tf/rover/rover.sh /tf/caf/LZ apply -parallelism=30 -w dev -var-file="/tf/caf/LZ/ScDc.tfvars"

# Backup newly applied state file
#terraform state pull > "$env-tfstate.backup"