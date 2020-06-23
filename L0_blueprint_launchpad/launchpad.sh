#!/usr/bin/bash
# command can be plan, apply, destroy or validate
command=${1-validate}

set -o allexport; source /tf/caf/envvars/global.envvars; set +o allexport

if [[ ! -z "${LAUNCHPAD_SUBSCRIPTION}" ]]; then
  echo "Setting subsctiption to ${LAUNCHPAD_SUBSCRIPTION}"
  az account set --subscription ${LAUNCHPAD_SUBSCRIPTION}
fi

/tf/rover/launchpad.sh /tf/launchpads/launchpad_opensource_light $command -var-file="/tf/caf/L0_blueprint_launchpad/level0.tfvars"