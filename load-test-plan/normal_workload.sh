rm  result.txt
rm -rf <path to report directory>
$JMETER_HOME/bin/jmeter.sh -n -t Todo-ThreadGroup_OCP_NORMAL.jmx -l result.txt -e -o <path to report directory>
open -a "Google Chrome" file://<path to report directory>/index.html
