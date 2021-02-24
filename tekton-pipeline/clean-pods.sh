#!/bin/bash

 # clean up all tekton pods
 oc delete pods -l app.kubernetes.io/managed-by=tekton-pipelines