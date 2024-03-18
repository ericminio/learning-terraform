#!/bin/bash

source ./support/cli.sh

function clean {
    rm -rf $(pwd)/services/.terraform
    rm $(pwd)/services/.terraform*
    rm $(pwd)/services/terraform*
}

function test_init {
    clean
    terraform-cli init > output
    local ok=`cat output | grep "Terraform has been successfully initialized" | wc -l`
    
    assertequals $ok 1
}

function test_apply {
    clean
    terraform-cli init > output
    terraform-cli apply --auto-approve -var="who=World" >> output
    local ok=`cat output | grep "Hello World" | wc -l`
    
    assertequals $ok 2
}