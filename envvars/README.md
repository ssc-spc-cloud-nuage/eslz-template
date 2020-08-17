# envvars

This folder contains environment specific `envvars` files used by the scripts included in this project.

Those are used to glue Azure subscription to each environment you will deploy.

For example, dev, it and prod. Copy the `sample.envvars` file and name it appropriatly for each target environment. The prefix part of the name should match the environment name. It is important as it will be referenced by the gorover.sh scripts. If it is named wrong the script will not be able to use the content of the variables files to build the environment and the deployment will fail as a result.

For example, if you want to refer to an environment as `dev` then name this file `dev.envvars`
