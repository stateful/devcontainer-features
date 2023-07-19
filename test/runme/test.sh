#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib. Syntax is...
# check <LABEL> <cmd> [args...]
echo "# Runbook

## First command

\`\`\`sh { name=first-command }
echo 'Hello World'
\`\`\`
" &> RUNBOOK.md

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "check if it can list runbooks" bash -c "runme list | grep 'first-command'"
check "check if it can list runbooks" bash -c "runme list | grep 'RUNBOOK.md'"
check "check if it can list runbooks" bash -c "runme run first-command | grep 'Hello World'"


# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults