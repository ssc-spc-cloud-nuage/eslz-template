# Make sure the combination of the following 3 variable is unique across all Azure regions as some of the resources it will create will failed if
# duplicate names are used. This is especially true for the storage account created as part of the deployment.
#
# Hope a future update to the rover can address this in the future.

env     = "ScSc"
group   = "CIO"
project = "ESLZ_vnext13"

convention = "passthrough"
location = "canadacentral"