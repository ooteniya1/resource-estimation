#!/bin/bash

set -e

echo " "

# Install quay secret and apply the pipeline serviceaccount
echo "Creating secret for quay.io"
oc apply -f ../todo-spring-quarkus/k8s/quay-secret-enc.yaml

echo "Linking pipeline sa with your quay crendentials"
oc patch serviceaccount pipeline -p '{"secrets": [{"name": "quay-secret-enc"}]}' 