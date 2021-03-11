# resource-estimation

## Prerequisites
1. Access to Openshiuft Cluster
2. Install Openshift Pipeline Operator
3. Install a Postgressql database for the To-do application
4. Access to an external image registry (we use https://quay.io for this workshop)
5. Create a secret for pulling images from the image registry
6. Add the secret to Openshift pipeline serviceaccount
7. Download Apache JMeter for Perfromacne testing

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

