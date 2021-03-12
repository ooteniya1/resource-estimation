# Cloud-Native Application Resource Estimation
As a developer or an Architect, one of the very first decisions you need to make when deploying an application to the cloud (whether public, private or on-prem) is to determine how much resources the application needs. Teams get their applications to production before they realize the resources are either under or over estimated which often leads to fire fighting in Production environment. Most the operational challenges faced in production are as a result of the fact that this process is often overlooked. 

The benefits of properly estimating the resources an application needs before getting to production among others are:

1. It helps in understanding application requirements in terms of how much memory and CPU the application needs. 2. It help to understand wehther an application is more memory intensive or CPU intesive.
2. It simplifies carving of resources on Openshift/Kubernetes which in turn simplifies the creation of qotas and limits for the application namespace.
3. It allows capacity planning from oeprations perpective, for instance, a cluster administrator can easily determine how many worker nodes in the cluster.
4. It leads to huge cost savings especially if your kubernetes cluster is in the public cloud infrastructure.

Estimating the resources an application need is very challenging to be honest because it involves some trial and error. Identifying accurately how many resources a container for instance will require, and how many replicas a service will need at a given time to meet service-level agreements takes time and effort, hence the process is more of an art than science. You’ll first want to identify what a good starting point is for the application; aiming for a good balance of CPU and memory. After you’ve decided on a sensible resource size for the application you will also need to setup a process where you can constantly monitor the application's resource actual usage over a period of time. 

In this workshop, we'll be walking you through the process of properly estimating your application resources, in terms of memory and CPU. At the end, we will come up with figure 1, which can be used to create the resource quota for the appplication namespace.

![](images/estimate.png)
*Figure 1*

## Concepts
Before we dive into codes, let's clear up some concepts.

### Definitions
Definitions
#### Compute Resource Types
X
#### Resource Units
X
#### Resource Quotas
X
#### Limit Ranges
X
#### Quality of Service (QoS)
X
### Application Estimation: Well-estimation, Over-estimation and Under-estimation
X

### Resource Estimation Approach

#### Performance Tuning Good Practice
#### Load Testing

### Scaling

## Good Practice

## Prerequisites
1. Access to Openshiuft Cluster
2. Install Openshift Pipeline Operator
3. Install a Postgressql database for the To-do application
4. Access to an external image registry (we use https://quay.io for this workshop)
5. Create a secret for pulling images from the image registry
6. Add the secret to Openshift pipeline serviceaccount
7. Download Apache JMeter for Performance testing

## Objective of the test
1. Check the response times of a web application, according to the number of virtual users
2. Test the limits of an application (the number of users the application can accommodate before it crashes)

1. Describe the application to profile
2. Describe the deployment process
3. Startup JMeter
4. Record your test cases
5. Configure your firefox to listen to actions
6. Setup thread group to simulate users
7. Configure your graphs
8. Load test the applications

## Preparation:
1. Deploy the application using spring boot with appropriate tags
2. Show the CICD pipeline code and on Openshift
3. Show the pipeline working during the build
4. Show the application deployed with one replica
5. Open the application endpoint from a Developer perspective
6. Show the metrics, health, OpenAPI, and Swagger UI
7. Show the endpoints to profile in SwaggerUI
8. Start test Plan Recording (Firefox browser and JMeter Recording)
### Define metrics: 
Throughput=min 2000 tps
Error rate=0.04%
Concurrent users=1000/sec
Peak Period User=4000/sec within 1 min windows
Black Friday Peak Period User=5000/sec within 3 min windows
Switch to the Prepared Test cases for Normal and Peak Period and walkthrough


## Resource Estimation

Check the start-up time. This is important for scaling in peak periods
Adjust to have a fast start-up time initially. 
What is the best resource requirement for the startup time I need? 
Not applicable to every use case
What’s my breakpoint with one pod - Note the resource usage. 
Does the breakpoint lower than my desired metrics? 
How many replicas do I need to start with for the desired metrics?
What’s the resource required to achieve the desired throughput with a normal workload? (You need to run this for a period of time say 1 day to 1 week)
What’s the resource requirement to cope with spikes and Black Friday requests?
Estimate the resource usage per pod/container
Use that to determine your quota


Run JMeter from Command line
## Normal load CLI command
./apache-jmeter-5.4.1/bin/jmeter.sh -n -t Todo-ThreadGroup_OCP_NORMAL.jmx -l result.txt -e -o ./report

## Peak load CLI command
./apache-jmeter-5.4.1/bin/jmeter.sh -n -t Todo-ThreadGroup_OCP_PEAK.jmx -l result.txt -e -o ./report

## References

1. [11 Simple Java Performance Tuning Tips – Stackify](https://stackify.com/java-performance-tuning/)
2. [Best Website Performance Testing Tools – Stackify](https://stackify.com/best-website-performance-testing-tools/)
3. [How Full is My Cluster - Part 3: Capacity Management](https://www.openshift.com/blog/full-cluster-part-3-capacity-management)
4. [O'reilly Kubernetes Best Practices](https://learning.oreilly.com/library/view/kubernetes-best-practices/9781492056461/ch08.html)

## Credits
1. [Eric Deandrea](https://github.com/edeandrea)  for the original [Todo-spring-quarkus](https://github.com/edeandrea/todo-spring-quarkus) application.
2. 