#!/bin/bash
set -e
if [[ $# -eq 0 ]]; then
  echo "Missing GitHub repo link"
  echo "Usage: ./run_tests.sh github-repo-link"
  exit 1
fi 
cd repos
USERNAME=$(echo $1 | rev | cut -d/ -f 2 | rev)
REPO=$(echo $1 | rev | cut -d/ -f 1 | rev)
mkdir -p $USERNAME
cd $USERNAME
rm -rf $REPO
git clone $1
cd $REPO
python3 -m venv venv
. ./venv/bin/activate
pip install -r requirements.txt
pytest
