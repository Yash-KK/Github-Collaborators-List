#!/bin/bash


##############################################################################################
# Author: Yash
# Description: This script lists the collaborators of a specified GitHub repository.
# Usage: ./list-collaborators.sh <GitHub Owner> <GitHub Repository>
# 
# Arguments:
#   1. GitHub Owner: The GitHub username or organization name that owns the repository.
#   2. GitHub Repository: The name of the repository.
# 
# Environment Variables:
#   GITHUB_TOKEN: Your GitHub personal access token. It should be set in your environment.
##############################################################################################

function helper(){
  if [ $# -ne 2 ];
  then
    echo "Please enter Github Owner and Github Repository"
    exit 1
  fi
}

function check_repository() {
  response=$1
  if echo "$response" | grep -q "Not Found"; then
    echo "Error: Repository not found or access denied."
    exit 1
  fi
}


function fetch_collaborators() {
  local owner=$1
  local repo=$2
  local token=$3
  
  curl -s -L \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer $token" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    "https://api.github.com/repos/$owner/$repo/collaborators"
}

TOKEN=$GITHUB_TOKEN
OWNER=$1
REPO=$2

helper "$@"

collaborators=$(fetch_collaborators "$OWNER" "$REPO" "$TOKEN")
check_repository "$collaborators"

echo "Collaborators for $OWNER/$REPO:"
echo "$collaborators" | jq -r '.[].login'
