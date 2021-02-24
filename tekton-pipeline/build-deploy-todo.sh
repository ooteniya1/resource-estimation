#!/bin/bash

#create the resources if not existing
oc apply -f res/*.yaml

# run ci tasks
oc apply -f ci/*.yaml

# tkn task start  build-app \
#   --inputresource='source=todo-app-source' \
#   --outputresource='builtImage=todo-app-image' \
#   --param contextDir='springboot' \
#   --showlog

# run cd tasks
oc apply -f cd/*.yaml

# create pipeline and run
oc apply -f todo-pipeline.yaml

tkn pipeline start todo-build-deploy-pipeline \
 --resource="appSource=todo-app-source" \
 --resource="appImage=todo-app-image" \
 --param="contextDir=todo-spring-quarkus" \
 --param="manifest_dir=k8s" \
 --serviceaccount='pipeline'\
 --showlog


 # clean up all tekton pods
 #oc delete pods -l app.kubernetes.io/managed-by=tekton-pipelines