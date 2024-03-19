#!/bin/bash

function terraform-cli {
    docker run -i -v $(pwd)/services:/usr/local/src hashicorp/terraform:1.7.5 -chdir=/usr/local/src "$@"
}