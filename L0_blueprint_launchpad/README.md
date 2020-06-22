# ESLZ (Enterprise Scale Landing Zone) launchpad blueprint

## Description

This level 0 blueprint will deploy the required launchpad in support the ESLZ.

The following resources will be deployed by this blueprint:

1. Azure Active Directory Security Groups for level0-rover-developers
2. Launchpad enterprise application
3. Launchpad resourcegroup
4. Launchpad keyvault for terraform secrets
5. Launchpad Log Analytics Workspace and KeyVaultAnalytics solutions
6. Launchpad Storage Account for terraform state
7. Launchpad Storage Account for diagnostic logs

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

4. Configure the level0.tfvars file with the desired values
   
5. Make sure you install or have access to the existing subscription launchpad with:

```
cd L0_blueprint_launchpad
./launchpad.sh apply
```
