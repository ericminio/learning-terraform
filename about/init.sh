#!/bin/bash

function test_init {
    docker run -i -t -v $(pwd)/services:/usr/local/src hashicorp/terraform:1.5.7 -chdir=/usr/local/src init > output
    local ok=`cat output | grep "Terraform has been successfully initialized" | wc -l`
    
    assertequals $ok 1
}