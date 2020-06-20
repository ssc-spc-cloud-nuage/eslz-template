# command can be plan, apply, destroy or validate
command=${1-validate}

/tf/rover/launchpad.sh workspace create dev

/tf/rover/rover.sh /tf/caf/project $command -parallelism=30 -w dev -var-file="/tf/caf/project/ScDc.tfvars"
