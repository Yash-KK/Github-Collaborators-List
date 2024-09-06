# GitHub Collaborators List Script

## Description

This script lists the collaborators of a specified GitHub repository. It utilizes the GitHub API to fetch and display the list of collaborators for a given repository.

## Usage

To use this script, ensure that you have set up a GitHub personal access token in your environment variables. The script requires two arguments: the GitHub owner (username or organization name) and the repository name.

```bash
./repo-collaborators.sh <GitHub Owner> <GitHub Repository>
```

## Arguments

- **GitHub Owner**: The GitHub username or organization name that owns the repository.
- **GitHub Repository**: The name of the repository.

## Environment Variables

- **GITHUB_TOKEN**: Your GitHub personal access token. It should be set in your environment.

## Example

```bash
export GITHUB_TOKEN="your_personal_access_token"
./list-collaborators.sh your-username your-repository
```

## Script Functions

- **`helper()`**: Validates the number of arguments provided.
- **`check_repository()`**: Checks if the repository exists and if access is permitted.
- **`fetch_collaborators()`**: Fetches the list of collaborators from the GitHub API.

## Requirements

- **curl**: Command-line tool for transferring data with URLs.
- **jq**: Command-line JSON processor for formatting and querying JSON data.

## Example
![image](https://github.com/user-attachments/assets/a6077e90-8e04-4672-b4a5-f01e79f71226)
