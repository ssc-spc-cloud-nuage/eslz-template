# env="ScSc"

#terraform workspace new $env
#terraform workspace select $env

/tf/rover/launchpad.sh workspace create sandbox

# Backup old state file
#terraform state pull > "$env-tfstate.backup.old"

/tf/rover/rover.sh /tf/caf/LZ apply -parallelism=30 -w sandbox -var-file="/tf/caf/LZ/ScSc.tfvars"

# To destroy manually run
# /tf/rover/rover.sh /tf/caf/LZ destroy -parallelism=30 -w sandbox -var-file="/tf/caf/LZ/ScSc.tfvars"