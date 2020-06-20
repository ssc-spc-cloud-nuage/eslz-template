# env="ScSc"

#terraform workspace new $env
#terraform workspace select $env

/tf/rover/launchpad.sh workspace create dev

# Backup old state file
#terraform state pull > "$env-tfstate.backup.old"

/tf/rover/rover.sh /tf/caf/project apply -parallelism=30 -w dev -var-file="/tf/caf/project/ScDc.tfvars"

# To destroy manually run
# /tf/rover/rover.sh /tf/caf/project destroy -parallelism=30 -w dev -var-file="/tf/caf/project/ScSc.tfvars"