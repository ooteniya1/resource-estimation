#!/bin/bash

set -e

USERNAME=$2
PASSWORD=$3

echo " "

echo "Creating secret with github credentials for user $USERNAME"
cat ../todo-spring-quarkus/k8s/git-secret.yaml | USERNAME=$USERNAME \
  PASSWORD=$PASSWORD envsubst | oc apply -f -

echo "Linking pipeline sa in namespace $NS with your github crendentials"
oc patch serviceaccount pipeline -p  '{"secrets": [{"name": "github-credentials"}]}' 