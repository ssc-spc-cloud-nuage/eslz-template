# ESLZ (Enterprise Scale Landing Zone) Template

## Note

This blueprint is a custom implementation of the "Azure Cloud Adoption Framework landing zones for Terraform" found at the following URL: https://github.com/Azure/caf-terraform-landingzones

This landinzone solution follows the GC Naming Convention documentation found in: -enter link to document-

## Prerequisites

In order to start deploying your with CAF landing zones, you need admin rights on your development machine and the following components installed on it:

- [Visual Studio Code](https://code.visualstudio.com/)
- [Docker Desktop](https://docs.docker.com/docker-for-windows/install/)
- [Git](https://git-scm.com/downloads)

You can deploy it easily on Windows and MacOS with the following software managers:

| MacOS                                              | Windows                                                       |
| -------------------------------------------------- | ------------------------------------------------------------- |
| ```brew cask install visual-studio-code docker ``` | Install Chocolatey (https://chocolatey.org/docs/installation) |
| ```brew install git ```                            | ``` choco install git vscode docker-desktop ```               |

Once installed, open **Visual Studio Code** and install "**Remote Development**" extension

## Deployment

Follow the README.md documentation in:

1. [L0_blueprint_launchpad](./L0_blueprint_launchpad/README.md)
2. [L1_blueprint_base](./L1_blueprint_base/README.md)
3. [L2_blueprint_project](./L2_blueprint_project/README.md)

If all went well you will now have deployed the landinzone in the subscription.
