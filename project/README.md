# ESLZ (Enterprise Scale Landing Zone) project blueprint

## Description

This blueprint will deploy the project specific resources needed to support the Client Project.

The following resources will be deployed by this blueprint:

1. Project resource group
2. Azure Active Directory group members for the project
3. NSG (Network Security Group) for MAZ, PAZ, OZ and RZ
4. Project storage account
5. Demo linux management VM

## Deployment

1. copy the included `config-sample/ScSc.sp` file to a personal folder (outside this project structure as you do not want to commit your SP credentials)and edit the content with your Service Principal, subscription and tenant information.
2. Edit the content of each folder ScSc.tfvars files.
3. Source this file in a bash terminal to create the environment variables required by the scripts located in the `init`, `LZ` and `project` folders:
```sh
source <some path to updated sp file>/ScSc.sp
```
4. Deploy project specific resources by running the following commands:
```sh
cd ../project
./terraform-init.sh
./terraform-apply-ScSc.sh
```
