# command can be plan, apply, destroy or validate
command=${1-validate}

/tf/rover/launchpad.sh /tf/launchpads/launchpad_opensource_light $command -var-file="/tf/caf/L0_blueprint_launchpad/level0.tfvars"