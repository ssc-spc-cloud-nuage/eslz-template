#!/usr/bin/bash
# command can be plan, apply, destroy or validate
env=${1}
command=${2}
blueprint=${PWD##*/}

if [[ -z ${env} || -z ${command} ]]; then
  echo 'one or more script variables are undefined'
  echo "expecting: ./gorover.sh <environment name> <plan|apply|destroy|validate>"
  echo ""
  exit 1
fi

if [[ ${1} = *-* ]]; then
  echo "environment name must not contain -. Use _ instead"
  echo ""
  exit 1
fi

if [[ ${#1} -lt 3 ]]; then
  echo "environment name must be 3 characters or greater"
  echo ""
  exit 1
fi

case "${command}" in
  plan|apply|destroy|validate)
    ;;
  *)
    echo "Accepted command is one of: plan, apply, destroy or validate"
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

/tf/rover/rover.sh -lz /tf/caf/${blueprint}/code -a $command -launchpad -env ${env} -tfstate "${blueprint}_${env}.tfstate" -var-file="/tf/caf/${blueprint}/environments/${env}.tfvars"
