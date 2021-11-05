# local-test-runner
Copies a repository and runs pytests in the repo's virtual environment.

Usage:
```
./run_tests.sh github-repo-link
```

If any environment variables are needed, simply export them before running the script.

This script does not protect against injection, only use with trusted arguments.
