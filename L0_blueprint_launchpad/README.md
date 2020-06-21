# ESLZ (Enterprise Scale Landing Zone) launchpad blueprint

## Description

This level 0 blueprint will deploy the required launchpad in support the ESLZ.

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
cd L0_blueprint_launchpad
./launchpad apply
```
