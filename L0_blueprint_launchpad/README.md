# ESLZ (Enterprise Scale Landing Zone) fundations blueprint

## Description

This level0 blueprint will deploy the required launchpad in support the ESLZ.

The following resources will be deployed by this blueprint:

1. Azure Active Directory Security Groups for launchpad users
2. Subscription IAM (RBAC) using the groups defined above
3. launchpad Resource Groups
4. Log Analytics Workspace and solutions
5. Storage Accounts
6. Keyvault


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
launchpad /tf/launchpads/launchpad_opensource_light apply -var 'location=canadacentral'
```

5. Edit the content of the environment variable files located in the environments folder.

6. Deploy the desired Landing Zone environment resources. For example, to deploy the dev environment use the following commands:

```sh
cd /tf/caf/blueprint_fundations
./rover-dev.sh apply
```
