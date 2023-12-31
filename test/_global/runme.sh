#!/bin/bash

# The 'test/_global' folder is a special test folder that is not tied to a single feature.
#
# This test file is executed against a running container constructed
# from the value of 'color_and_hello' in the tests/_global/scenarios.json file.
#
# The value of a scenarios element is any properties available in the 'devcontainer.json'.
# Scenarios are useful for testing specific options in a feature, or to test a combination of features.
# 
# This test can be run with the following command (from the root of this repo)
#    devcontainer features test --global-scenarios-only .

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

echo -e "Verify Runme version:\n"
runme --version
echo -e "\n"

echo "# Runbook

## First command

\`\`\`sh { name=first-command }
echo 'Hello World'
\`\`\`
" &> RUNBOOK.md

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "check if it can list runbooks" bash -c "runme --version | grep '1.4.1'"
check "check if it can list runbooks" bash -c "runme list | grep 'first-command'"
check "check if it can list runbooks" bash -c "runme list | grep 'RUNBOOK.md'"
check "check if it can list runbooks" bash -c "runme run first-command | grep 'Hello World'"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
