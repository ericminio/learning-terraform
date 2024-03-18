#!/bin/bash

function clean {
    rm -rf $(pwd)/services/.terraform
    rm $(pwd)/services/.terraform*
    rm $(pwd)/services/terraform*
}

function test_init {
    clean
    docker run -i -v $(pwd)/services:/usr/local/src hashicorp/terraform:1.5.7 -chdir=/usr/local/src init > output
    local ok=`cat output | grep "Terraform has been successfully initialized" | wc -l`
    
    assertequals $ok 1
}

function test_apply {
    clean
    docker run -i -v $(pwd)/services:/usr/local/src hashicorp/terraform:1.5.7 -chdir=/usr/local/src init > output
    docker run -i -v $(pwd)/services:/usr/local/src hashicorp/terraform:1.5.7 -chdir=/usr/local/src apply --auto-approve >> output
    local ok=`cat output | grep "Hello World" | wc -l`
    
    assertequals $ok 2
}