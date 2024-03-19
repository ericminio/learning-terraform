#!/bin/bash

source ./support/cli.sh
source ./support/clean.sh

function test_plan_can_help_to_inspect_variable_values {
    clean
    terraform-cli init > output
    terraform-cli plan -var="who=World" >> output
    local ok=`cat output | grep "greetings = \"Hello World\"" | wc -l`
    
    assertequals $ok 1
}