#!/usr/bin/bash
# command can be plan, apply, destroy
env=${1}
command=${2}
blueprint="L0_blueprint_launchpad"

if [[ -z ${env} || -z ${command} ]]; then
  echo 'one or more script variables are undefined'
  echo "expecting: ./golaunchpad.sh <environment name> <plan|apply|destroy>"
  echo ""
  exit 1
fi

if [[ ${#1} < 3 ]]; then
  echo "environment name must be 3 characters or greater"
  echo ""
  exit 1
fi

case "${command}" in
  plan|apply|destroy)
    ;;
  *)
    echo "Accepted command is one of: plan, apply or destroy"
    echo ""
    exit 1
    ;;
esac

set -o allexport

if [[ -f "/tf/caf/envvars/${env}.envvars" ]]; then
  source /tf/caf/envvars/${env}.envvars
else
  echo "/tf/caf/envvars/${env}.envvars file is missing. Please ensure it exist!"
  echo ""
  exit 1
fi

set +o allexport

if [[ ! -z "${LAUNCHPAD_SUBSCRIPTION}" ]]; then
  echo "Setting subsctiption to ${LAUNCHPAD_SUBSCRIPTION}"
  az account set --subscription ${LAUNCHPAD_SUBSCRIPTION}
fi

if [[ ! -f "/tf/caf/${blueprint}/environments/${env}.tfvars" ]]; then
  echo "/tf/caf/${blueprint}/environments/${env}.tfvars file is missing. Please ensure it exist!"
  echo ""
  exit 1
fi

/tf/rover/launchpad.sh /tf/launchpads/launchpad_opensource_light $command -var-file="/tf/caf/${blueprint}/environments/${env}.tfvars"