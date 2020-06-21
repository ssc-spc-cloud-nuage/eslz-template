# ESLZ (Enterprise Scale Landing Zone) fundations blueprint

## Description

This level 1 blueprint will deploy all Landing Zone resources needed to support the ESLZ.

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
13. (Optional)Recovery Services Vault
14. Update Management Schedules for Linux and Windows VMs
15. (Optional)Jump Server
16. (Optional)Azure policies
17. (Optional)Security Center
18. (Optional)Sentinel

## Deployment

1. Launch the development workspace in a container following the instructions found at: https://github.com/Azure/caf-terraform-landingzones/blob/master/documentation/getting_started/getting_started.md

2. If not already logged-in:

```
rover login
```

3. Select the subscription to use with:

```
az account set --subscription <subscription_GUID>
```

4. Make sure you install or have access to the existing subscription launchpad with:

```
cd L0_blueprint_launchpad
./launchpad apply
```

5. Edit the content of the environment variable files located in the environments folder.

6. Deploy the desired Landing Zone environment resources. For example, to deploy the dev environment use the following commands:

```sh
cd /tf/caf/L1_blueprint_base
./rover-dev.sh apply
```
