FROM registry.access.redhat.com/ubi8/openjdk-11

# Configure the JAVA_OPTIONS, you can add -XshowSettings:vm to also display the heap size.
ENV JAVA_OPTIONS="-XshowSettings:vm -Djava.util.logging.manager=org.jboss.logmanager.LogManager"
COPY target/*.jar /deployments/
