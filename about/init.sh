#!/bin/bash

source ./support/cli.sh
source ./support/clean.sh

function test_init {
    clean
    terraform-cli init > output
    local ok=`cat output | grep "Terraform has been successfully initialized" | wc -l`
    
    assertequals $ok 1
}
