#!/bin/bash

function clean {
    rm -rf $(pwd)/services/.terraform
    rm $(pwd)/services/.terraform*
    rm $(pwd)/services/terraform*
    rm output
}