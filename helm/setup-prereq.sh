#!/bin/bash

set -e

echo ""
# install helms charts that will create the resource-estimation namespace
echo "Creating resource-estimation namespace"
helm upgrade --install resource-estimation-ns resource-estimation-ns

echo ""
# install helms charts that will initialize the environment 
echo "Installing openshift-pipelines operator"
helm upgrade --install openshift-pipelines openshift-pipelines

echo ""
echo "Installing postgresql Operator" 
helm upgrade --install postgresql postgresql
#oc apply -f ../todo-spring-quarkus/k8s/postgresql-instance.yaml

echo ""
echo "Installing vertical pod autoscler"
helm upgrade --install vertical-pod-autoscaler vertical-pod-autoscaler
