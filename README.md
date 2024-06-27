# PR Naming
This will take care of your PR naming, if it is matched with the regex pattern you have given or not 

# Example
```yaml
name: Delete Tag

on:
 pull_request:
    types: [opened, synchronize, reopened, edited] 
    branches:
      - master

jobs:
   pr-title-check::
    runs-on: windows-latest

    steps:

      - name: Check PR title format
        uses: ShivamHS/PR-naming@v1.0
        with:
          token: ${{ secrets.GITHUB_TOKEN }} 
          repo:  your-repo-name
          owner: repo-owner
          pattern: enter the regex pattern for validation