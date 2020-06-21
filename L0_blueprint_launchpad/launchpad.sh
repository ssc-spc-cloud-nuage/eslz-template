# command can be plan, apply, destroy or validate
command=${1-validate}

# Uncoment and set the subscription in the following line to automatically pick the right subscription
# az account set --subscription <subscription_GUID>

/tf/rover/launchpad.sh /tf/launchpads/launchpad_opensource_light $command -var-file="/tf/caf/L0_blueprint_launchpad/level0.tfvars"