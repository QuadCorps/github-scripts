# GitHub Repository Deletion Script

This script allows you to delete multiple repositories under a specified GitHub organisation using the GitHub API.

## ⚠️ Warning

**This script permanently deletes repositories!** Ensure you have the correct organisation and repository names before running it.

---

## 📌 Features

- Deletes multiple repositories from a given GitHub organisation.
- Uses GitHub API with a personal access token (PAT) for authentication.
- Provides a confirmation prompt before deletion.

---

## 🔧 Requirements

- A **GitHub Personal Access Token (PAT)** with `delete_repo` permissions.
- `curl` installed on your machine.
- Bash environment (Linux/macOS or Windows with WSL/Git Bash).

---

## 📥 Installation

Clone this repository or download the script:

```bash
git clone https://github.com/QuadCorps/delete-github-repos.git
cd delete-github-repos
chmod +x delete_github_repos.sh  # Give execute permissions
```

---

## 🚀 Usage

### **Step 1: Set Up Your GitHub Token**

Before running the script, set your GitHub **Personal Access Token (PAT)** as an environment variable:

```bash
export GITHUB_TOKEN="your_personal_access_token"
```

### **Step 2: Run the Script**

Provide the organisation name followed by the repository names you want to delete:

```bash
./delete_github_repos.sh <org_name> <repo1> <repo2> ...
```

#### Example:

```bash
./delete_github_repos.sh my-org repo1 repo2 repo3
```

---

## 🛑 Confirmation Prompt

Before deleting, the script will list the repositories and ask for confirmation:

```
Warning: This will permanently delete the following repositories from org 'my-org':
- repo1
- repo2
- repo3
Are you sure you want to proceed? (yes/no):
```

Type \`\` to proceed or anything else to cancel.

---

## ✅ Expected Output

```
Deleting repository: repo1...
Successfully deleted repo1.
Deleting repository: repo2...
Successfully deleted repo2.
Deleting repository: repo3...
Failed to delete repo3 (HTTP Status: 403). Check your permissions or repo existence.
Done.
```

---

## ❗ Troubleshooting

### **1. Script Fails with Authentication Errors**

- Ensure your **GitHub token** is set:
  ```bash
  echo $GITHUB_TOKEN
  ```
- Your PAT must have \`\` permissions.

### **2. Repository Not Found**

- Check that the repository exists under the specified organisation.
- Verify that you have the required permissions to delete repositories.

### **3. HTTP Errors**

- `403 Forbidden`: Your token does not have `delete_repo` permissions.
- `404 Not Found`: The repo might not exist or you lack permissions.

---

## 📜 License

This script is open-source and licensed under the **MIT License**.

---

## ✨ Contributing

Feel free to contribute! Fork the repo, make changes, and submit a pull request.

Happy coding! 🚀


