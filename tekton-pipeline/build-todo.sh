#!/bin/bash

#create the resources if not existing
oc apply -f res/*.yaml

# run ci tasks
oc apply -f ci/*.yaml

tkn task start  build-app \
  --inputresource='source=todo-app-source' \
  --outputresource='builtImage=todo-app-image' \
  --param contextDir='todo-spring-quarkus' \
  --showlog