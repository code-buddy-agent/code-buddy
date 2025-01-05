# CodeBuddy

The AI Code Review Partner For You!

Cut code reviews time, reduce bugs, improve your code quality with the power of LLM agents. Everything for free!

## Before Usage

You need create a `code buddy key` at: https://codebuddy-react-nu.vercel.app


## Inputs

| Name               | Description                           | Required |
|--------------------|---------------------------------------|----------|
| owner             | Owner of repository                  | true     |
| repository        | Name of repository                   | true     |
| pull_request_number | Identifier of pull request           | true     |
| github_token      | Personal Access token to access repository  | true     |
| code_buddy_key    | Code Buddy Key to access AI Agent    | true     |
| stack             | Your stack of development            | true     |
| total_comments    | Total of comments by file            | false    |


## Outputs

| Name       | Description                                                          |
|------------|----------------------------------------------------------------------|
| Response   | Returns the HTTP response from the CodeBuddy Agent request used to analyze the code. |


## Example usage

```yml
name: CodeBuddy CodeReview
on:
  pull_request:
    types: [ opened, synchronize ]

jobs:
  ai_agent_code_review:
    runs-on: ubuntu-latest
    name: Job to make automatic code review with LLM
    steps:
      - name: CodeBuddy
        id: code_review
        uses: code-buddy-agent/code-buddy@v0.0.4
        with:
          owner: "${{ github.repository_owner }}"
          repository: code-buddy-agent
          pull_request_number: "${{ github.event.pull_request.number }}"
          github_token: "${{ secrets.GH_TOKEN }}"
          code_buddy_key: "${{ secrets.CODE_BUDDY_KEY }}"
          stack: "Java, Spring, Spring AI"
          total_comments: 2
```
