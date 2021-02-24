#!/bin/bash

#create the resources if not existing
oc apply -f res/*.yaml

# run cd tasks
oc apply -f cd/*.yaml

tkn task start  deploy-app \
   --inputresource='source=todo-app-source' \
   --param contextDir='todo-spring-quarkus' \
   --param manifest_dir="k8s" \
   --showlog
