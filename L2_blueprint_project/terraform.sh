blueprint=${PWD##*/}
env=$1
shift;

case "${env}" in
  dev|test|prod)
    ;;
  *)
    echo "The teraform command was not provided a valid 1st argument for the env value of either dev, test or prod"
    echo ""
    exit 1
    ;;
esac

set -o allexport

TF_DATA_DIR=/home/vscode/.terraform.cache/${blueprint}.${env}

set +o allexport

cd code
terraform "$@"