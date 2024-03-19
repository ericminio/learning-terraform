#!/bin/bash

source ./support/clean.sh

function test_test_can_inspect_locals {
    clean
    terraform-cli init
    terraform-cli test
}