# environments

This folder contains environment specific variables files used to deploy the same code with different values in each target environment. For example, in dev, it and prod. Copy the sample.tfvars file and name it appropriatly for each target environment. The prefix part of the name should match the environment name. It is important as it will be referenced by the roder.sh script using the provided script variable value. If it is named wrong the script will not be able to use the content of the variables files to build the environment and the deployment will fail as a result.

For example, if you want to refer to an environment as `dev` then name this file `dev.tfvars`

## Important

Important note regarding the L1_terraform_remote_state_config

Fill the section below with the values from the output of ./gorover.sh <env> validate. Look in the section called Getting launchpad coordinates: It will look like:

```
Getting launchpad coordinates:
 - storage_account_name: scdccioeslztemplatestlev
 - resource_group: ScDc-CIO_ESLZ_Template-terraform-state
 - container: level0
 - tfstate file: launchpad_opensource_light.tfstate
```

Use the relevant information from the output to fill the 1st 2 lines of the variable.
Use the name of the environment you have used on the environments file without the .tfvars part for the 3rd line
Leave the 4th line as is unless you customized the blueprint name.

```
L1_terraform_remote_state_config = {
    storage_account_name  = "<get the storage account name from the storage_account_name: output>"
    resource_group_name   = "<get the storage account name from the resource_group: output>"
    container_name        = "<set this value to the envronment name. Like dev, prod. The same you used for the command gorover.sh>"
    key                   = "L1_blueprint_base.tfstate"
}
```

example:

```
L1_terraform_remote_state_config = {
    storage_account_name  = "scdccioeslztemplatestlev"
    container_name        = "template-test"
    key                   = "L1_blueprint_base.tfstate"
    resource_group_name   = "ScDc-CIO_ESLZ_Template-terraform-state"
}
```
