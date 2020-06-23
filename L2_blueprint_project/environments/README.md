# environments

This folder contains environment specific variables files used to deploy the same code with different values in each target environment. For example, in dev, it and prod. Copy the sample.tfvars file and name it appropriatly for each target environment. The prefix part of the name should match the environment name. It is important as it will be referenced by the roder.sh script using the provided script variable value. If it is named wrong the script will not be able to use the content of the variables files to build the environment and the deployment will fail as a result.

For example, if you want to refer to an environment as `dev` then name this file `dev.tfvars`
