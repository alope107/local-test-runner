# local-test-runner
Copies a repository and runs tests.

For Python projects, use `pip` as the argument before the repo link. For JS projects, use `yarn`.

Usage:
```
./run_tests.sh pip|yarn github-repo-link
```

If any environment variables are needed, simply export them before running the script.

This script does not protect against injection, only use with trusted arguments.
