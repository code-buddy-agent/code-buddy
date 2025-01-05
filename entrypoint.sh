#!/bin/bash

# Exit on error
set -e

# Read input parameters
OWNER="$1"
REPOSITORY="$2"
PULL_REQUEST_NUMBER="$3"
GITHUB_TOKEN="$4"
CODE_BUDDY_KEY="$5"
STACK="$6"
TOTAL_COMMENTS="$7"

# Construct the payload for the request
PAYLOAD=$(cat <<EOF
{
  "owner": "$OWNER",
  "repository": "$REPOSITORY",
  "pullRequestNumber": "$PULL_REQUEST_NUMBER",
  "githubToken": "$GITHUB_TOKEN",
  "codeBuddyKey": "$CODE_BUDDY_KEY",
  "stack": "$STACK",
  "totalComments": ${TOTAL_COMMENTS:-null}
}
EOF
)

# Make the CURL request
RESPONSE=$(curl -s --location 'http://64.23.245.115:8080/v1/code-review-agent' \
  --header 'Content-Type: application/json' \
  --data "$PAYLOAD")

# Set the action output
echo "::set-output name=response::$RESPONSE"
