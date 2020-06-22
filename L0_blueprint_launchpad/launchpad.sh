# command can be plan, apply, destroy or validate
command=${1-validate}

# Uncoment and set the subscription in the following line to automatically pick the right subscription
az account set --subscription ed433324-b886-4c85-b62c-49283b83cafd
# az account set --subscription c00dd93b-0f2b-4cd6-8273-e1038dcbd60e

/tf/rover/launchpad.sh /tf/launchpads/launchpad_opensource_light $command -var-file="/tf/caf/L0_blueprint_launchpad/level0.tfvars"