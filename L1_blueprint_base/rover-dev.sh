# command can be plan, apply, destroy or validate
command=${1-validate}
env="dev"
blueprint="L1_blueprint_base"

# Uncoment and set the subscription in the following line to automatically pick the right subscription
#az account set --subscription ed433324-b886-4c85-b62c-49283b83cafd

/tf/rover/launchpad.sh workspace create $env

/tf/rover/rover.sh /tf/caf/$blueprint/code $command -parallelism=30 -w $env -tfstate $blueprint -var-file="/tf/caf/${blueprint}/environments/${env}.tfvars"