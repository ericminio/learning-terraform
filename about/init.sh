#!/bin/bash

source ./support/cli.sh

function clean {
    rm -rf $(pwd)/services/.terraform
    rm $(pwd)/services/.terraform*
    rm $(pwd)/services/terraform*
    rm output
}

function test_init {
    clean
    terraform-cli init > output
    local ok=`cat output | grep "Terraform has been successfully initialized" | wc -l`
    
    assertequals $ok 1
}

function test_plan_can_help_to_inspect_variable_values {
    clean
    terraform-cli init > output
    terraform-cli plan -var="who=World" >> output
    local ok=`cat output | grep "greetings = \"Hello World\"" | wc -l`
    
    assertequals $ok 1
}