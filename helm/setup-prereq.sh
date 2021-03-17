#!/bin/bash

set -e

echo ""
# install helms charts that will initialize the environment 
echo "Installing openshift-pipelines operator"
helm upgrade --install openshift-pipelines openshift-pipelines

echo ""

echo "Installing postgresql Operator" 
helm upgrade --install postgresql postgresql