# ESLZ (Enterprise Scale Landing Zone)

## Note

This blueprint is a custom implementation of the project found here: https://github.com/Azure/caf-terraform-landingzones

It follows the SSC Naming Convention documentation found in: <enter link to document>

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

Follow the README.md documentation in the LZ and project folders:

1. [LZ](./LZ/README.md)
2. [project](./LZ/README.md)

If all went well you will now have deployed the solution in the subscription as specified in the `ScSc-CIO-EBAP.sp` file.
