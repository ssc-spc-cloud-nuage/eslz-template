blueprint=${PWD##*/}

set -o allexport

TF_DATA_DIR=/home/vscode/.terraform.cache/${blueprint}

set +o allexport

cd code
terraform "$@"