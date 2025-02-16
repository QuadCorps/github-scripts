#!/bin/bash

# Usage: ./delete_github_repos.sh <org_name> <repo1> <repo2> ...
# Example: ./delete_github_repos.sh my-org repo1 repo2 repo3

# GitHub API base URL
GITHUB_API="https://api.github.com"

# Check if at least 2 arguments are provided (org + 1 repo)
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <org_name> <repo1> <repo2> ..."
    exit 1
fi

ORG_NAME=$1
shift  # Shift to remove first argument (org name), leaving only repo names

# Ensure GitHub token is set (either as an environment variable or manually entered)
if [ -z "$GITHUB_TOKEN" ]; then
    echo "Error: Please set the GITHUB_TOKEN environment variable with a valid GitHub PAT."
    exit 1
fi

# Confirm deletion
echo "Warning: This will permanently delete the following repositories from org '$ORG_NAME':"
for REPO in "$@"; do
    echo "- $REPO"
done
read -p "Are you sure you want to proceed? (yes/no): " CONFIRM
if [ "$CONFIRM" != "yes" ]; then
    echo "Aborted."
    exit 0
fi

# Loop through each repository and delete it
for REPO in "$@"; do
    echo "Deleting repository: $REPO..."
    
    RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" -X DELETE \
        -H "Authorization: token $GITHUB_TOKEN" \
        -H "Accept: application/vnd.github.v3+json" \
        "$GITHUB_API/repos/$ORG_NAME/$REPO")
    
    if [ "$RESPONSE" -eq 204 ]; then
        echo "Successfully deleted $REPO."
    else
        echo "Failed to delete $REPO (HTTP Status: $RESPONSE). Check your permissions or repo existence."
    fi
done

echo "Done."
