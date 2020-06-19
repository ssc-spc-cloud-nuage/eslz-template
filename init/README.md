# ESLZ (Enterprise Scale Landing Zone) init blueprint

## Description

This blueprint will deploy the resources needed to support other blueprint part of the ESLZ.

The following resources will be deployed:

1. Project storage Resource Group
3. Storage account that will contain subsequent terraform state files
4. Custom backend.tfvars files in both LZ and project folders

## Deployment

1. copy the included `config-sample/ScSc.sp` file to a personal folder (outside this project structure as you do not want to commit your SP credentials)and edit the content with your Service Principal, subscription and tenant information.
2. Edit the content of each folder ScSc.tfvars files.
3. Source this file in a bash terminal to create the environment variables required by the scripts located in the `init`, `LZ` and `project` folders:
```sh
source <some path to updated sp file>/ScSc.sp
```
4. Initialise the project by running the following commands:
```sh
cd init
./terraform-init.sh
./terraform-apply-ScSc.sh
```
