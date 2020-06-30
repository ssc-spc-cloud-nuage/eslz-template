# ESLZ (Enterprise Scale Landing Zone) Client Template

## Background

This blueprint is a custom implementation of the "Azure Cloud Adoption Framework landing zones for Terraform" found at the following URL: https://github.com/Azure/caf-terraform-landingzones

This landinzone solution follows the [GC Naming and Tagging Standard for Azure](https://bernardmaltais.github.io/GC_Naming_and_Tagging/index.html).

In summary the concept of the Landingzone is similar to how you would build presence on a remote planet (the cloud).

1st, you would use some sort of [rover](https://github.com/aztfmod/rover) to build a [launchpad](https://github.com/aztfmod/level0/tree/master/launchpads/launchpad_opensource_light) from which you would control activity on the remote planet (L0_blueprint_launchpad).

Next, using the [rover](https://github.com/aztfmod/rover) on the launchpad you would build a base from which to operate. (L1_blueprint_base).

Finally, from this base, you can then start to work on various project and missions. (L2_blueprint_project).

To communicate with earth (ground) from the landinzone base you need to relay communications through a spaceport (Shared VDC). The spaceport is the only way communication from the base with earth can be established. The spaceport is built by a central authority that oversee and ensure all communication flow security. The L1_blueprint_spaceport is not part of this client project.

All those blueprints use [resources](https://www.terraform.io/docs/providers/azurerm/r/availability_set.html) found on the planet and/or pre-built [modules](https://github.com/canada-ca-terraform-modules/terraform-azurerm-active-directory-v2) to create the assembly.

So here you have it. A L0 blueprint is 1st deployed, then the L1 blueprint and finally the L2 blueprint. There is a structured dependancies between them all to successfully complete projects/missions outcome on the remote planet ;-)

## Prerequisites

In order to start deploying your with CAF landing zones, you need admin rights on your development machine and the following components installed on it:

- [Visual Studio Code](https://code.visualstudio.com/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [Git](https://git-scm.com/)

You can deploy it easily on Windows and MacOS with the following software managers:

| MacOS                                              | Windows                                                       |
| -------------------------------------------------- | ------------------------------------------------------------- |
| ```brew cask install visual-studio-code docker ``` | Install Chocolatey (https://chocolatey.org/docs/installation) |
| ```brew install git ```                            | ```choco install git vscode docker-desktop ```               |

Once installed, open **Visual Studio Code** and install "**Remote Development**" extension

## Deployment

Follow the README.md documentation in:

0. [envvars](./envvars/README.md)
1. [L0_blueprint_launchpad](./L0_blueprint_launchpad/README.md)
2. [L1_blueprint_base](./L1_blueprint_base/README.md)
3. [L2_blueprint_project](./L2_blueprint_project/README.md)

If all went well you will now have deployed the landinzone in the subscription.
