#!/bin/bash

source ./support/clean.sh

function test_only_test_can_inspect_locals {
    clean
    terraform-cli init
    terraform-cli test
}