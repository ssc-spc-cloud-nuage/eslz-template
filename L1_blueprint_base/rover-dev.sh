# command can be plan, apply, destroy or validate
command=${1-validate}
env="dev"
blueprint="L1_blueprint_base"

set -o allexport; source /tf/caf/envvars/global.envvars; set +o allexport

if [[ ! -z "${LAUNCHPAD_SUBSCRIPTION}" ]]; then
  echo "Setting subsctiption to ${LAUNCHPAD_SUBSCRIPTION}"
  az account set --subscription ${LAUNCHPAD_SUBSCRIPTION}
fi

/tf/rover/launchpad.sh workspace create $env

/tf/rover/rover.sh /tf/caf/$blueprint/code $command -parallelism=30 -w $env -tfstate $blueprint -var-file="/tf/caf/${blueprint}/environments/${env}.tfvars"