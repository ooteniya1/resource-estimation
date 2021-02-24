FROM registry.access.redhat.com/ubi8/openjdk-11

ENV JAVA_OPTIONS="-Djava.util.logging.manager=org.jboss.logmanager.LogManager"
COPY target/*.jar /deployments/
