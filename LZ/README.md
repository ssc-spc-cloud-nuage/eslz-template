# ESLZ (Enterprise Scale Landing Zone) LZ blueprint

## Description

This blueprint will deploy the project specific Landing Zone resources needed to support the ESLZ.

The following resources will be deployed by this blueprint:

1. Azure Active Directory Security Groups for Owners, Contributors and Readers
2. Subscription IAM (RBAC) using the groups defined above
3. LZ Resource Groups
4. Log Analytics Workspace and solutions
5. Storage Accounts
6. VNET
7. Routes
8. Subnets (MAZ, PAZ, OZ, RZ)
9. Keyvault
10. Private DNS
11. Public DNS
12. Automation Account
13. Recovery Services Vault
14. Update Management Schedules for Linux and Windows VMs
15. Jump Server
16. Azure policies
17. Security Center
18. Sentinel

## Deployment

1. copy the included `config-sample/ScSc.sp` file to a personal folder (outside this project structure as you do not want to commit your SP credentials)and edit the content with your Service Principal, subscription and tenant information.
2. Edit the content of each folder ScSc.tfvars files.
3. Source this file in a bash terminal to create the environment variables required by the scripts located in the `init`, `LZ` and `project` folders:
```sh
source <some path to updated sp file>/ScSc.sp
```
4. Deploy the Landing Zone resources by running the following commands:
```sh
cd ../LZ
./terraform-init.sh
./terraform-apply-ScSc.sh
```
