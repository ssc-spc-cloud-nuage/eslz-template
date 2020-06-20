# command can be plan, apply, destroy or validate
command=${1-validate}

/tf/rover/launchpad.sh workspace create dev

/tf/rover/rover.sh /tf/caf/LZ $command -parallelism=30 -w dev -var-file="/tf/caf/LZ/ScDc.tfvars"