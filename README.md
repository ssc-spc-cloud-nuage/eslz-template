# EBAP

## Requirements

This deployment is based on linux shell scripts. You can run those by installing the pre-requisite software in a WSL1/2 Ubuntu 18.04 environment on Windows 10 system or by using a Ubuntu Linux VM with the requires software installed.

You can follow the installation steps as found in the following docker file or use the pre-built container if running on WSL2 with docker installed or a linux VM: https://gitlab.com/dto-btn/docker/-/blob/master/azure-dev/Dockerfile

This linux based implementation will facilitate the eventual use as part of a github/gitlab based CI/CD pipeline that would inavitably use linux agents for deployment as the underpinning. It is therefore advised to keep evolving the linux based deployment flovour even if it could be adapted to run under native Windows powershell with some effort.

## Deployment

1. copy the included `config-sample/ScSc-CIO-EBAP.sp` file to a personal folder and edit the content with your Service Principal, subscription and tenant information.

2. Source this file to create the environment variables required bu the scripts located in the `init` and `project` folders:

```sh
source <some path to updated sp file>/ScSc-CIO-EBAP.sp
```

3. Initialise the project by running the following commands:

```sh
cd init
./terraform-init.sh
./terraform-apply-ScSc-CIO-EBAP.sh
```

4. Deploy the project resources by running the following commands:

```sh
cd ../project
./terraform-init.sh
./terraform-apply-ScSc-CIO-EBAP.sh
```

If all went well you will now have deployed the solution in the Dev subscription as specified in the `ScSc-CIO-EBAP.sp` file.
