#!/bin/bash

#create the resources if not existing
oc apply -f tekton-pipeline/res/*.yaml

# run ci tasks
oc apply -f tekton-pipeline/ci/*.yaml
oc apply -f tekton-pipeline/todo-pipeline.yaml

tkn pipeline start todo-deploy-pipeline \
 --resource="appSource=todo-app-source" \
 --resource="appImage=todo-app-image" \
 --resource="manifestSource=todo-app-manifest" \
 --param "contextDir=todo-spring-quarkus" \
 --param "manifest_dir=k8s" \
 --serviceaccount='pipeline'\
 --showlog

# tkn task start  build-app \
#   --inputresource='source=todo-app-source' \
#   --outputresource='builtImage=todo-app-image' \
#   --param contextDir='springboot' \
#   --showlog

# run cd tasks
#oc apply -f cd/*.yaml