#!/bin/bash
set -e
if [[ $# -eq 0 ]]; then
  echo "Missing arguments"
  echo "Usage: ./run_tests.sh pip|yarn github-repo-link"
  exit 1
fi
if [[ $1 != "pip" && $1 != "yarn" ]]; then
  echo "Must either use pip or yarn"
  echo "Usage: ./run_tests.sh pip|yarn github-repo-link"
  exit 1
fi
cd repos
USERNAME=$(echo $2 | rev | cut -d/ -f 2 | rev)
REPO=$(echo $2 | rev | cut -d/ -f 1 | rev)
mkdir -p $USERNAME
cd $USERNAME
rm -rf $REPO
git clone $2
cd $REPO
if [[ $1 == "pip" ]]; then
  python3 -m venv venv
  . ./venv/bin/activate
  pip install -r requirements.txt
  pytest
elif [[ $1 == "yarn" ]]; then
  yarn install
  yarn test --watchAll=false
else
  echo "Supported options are pip or yarn"
  echo "Usage: ./run_tests.sh pip|yarn github-repo-link"
fi
