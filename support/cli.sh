#!/bin/bash

function terraform-cli {
    docker run -i -v $(pwd)/services:/usr/local/src hashicorp/terraform:1.5.7 -chdir=/usr/local/src "$@"
}