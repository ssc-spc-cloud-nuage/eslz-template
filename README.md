# ESLZ (Enterprise Scale Landing Zone)

## Note

This blueprint is an alternative implementation of the project found here: https://github.com/Azure/caf-terraform-landingzones

## Prerequisites

In order to start deploying your with CAF landing zones, you need the following components installed on your machine:

- [Visual Studio Code](https://code.visualstudio.com/)
- [Docker Desktop](https://docs.docker.com/docker-for-windows/install/)
- [Git](https://git-scm.com/downloads)

You can deploy it easily on Windows and MacOS with the following software managers:

| MacOS  | Windows |  
| ------ | ------- |
|```brew cask install visual-studio-code docker``` </br> ```brew install git ``` | Install Chocolatey (https://chocolatey.org/docs/installation) </br> ``` choco install git vscode docker-desktop ``` |

Once installed, open **Visual Studio Code** and install "**Remote Development**" extension

## Deployment

Follow the README.md documentation in the LZ and project folders.

If all went well you will now have deployed the solution in the subscription as specified in the `ScSc-CIO-EBAP.sp` file.
