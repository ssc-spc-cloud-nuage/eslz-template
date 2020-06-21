# command can be plan, apply, destroy or validate
command=${1-validate}
env="dev"
blueprint="blueprint_project"

/tf/rover/launchpad.sh workspace create $env

/tf/rover/rover.sh /tf/caf/$blueprint/code $command -parallelism=30 -w $env -tfstate $blueprint -var-file="/tf/caf/${blueprint}/environments/${env}.tfvars"