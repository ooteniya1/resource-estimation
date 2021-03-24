rm  result.txt
rm -rf ./report
export JAVA_HOME=$(/usr/libexec/java_home)
export JMETER_HOME=/Users/ooteniya/dev-tools/projects/bell/load_test/apache-jmeter-5.4.1

echo "JAVA_HOME: $JAVA_HOME"

echo ""

echo "JMETER_HOME: $JMETER_HOME"

$JMETER_HOME/bin/jmeter.sh -n -t Todo-ThreadGroup_OCP_NORMAL2.jmx -l result.txt -e -o ./report
open -a "Google Chrome" file:///Users/ooteniya/dev-tools/projects/bell/resource-estimation/load-test-plan/report/index.html
