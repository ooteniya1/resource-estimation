rm peak.txt
rm -rf peak
$JMETER_HOME/bin/jmeter.sh -n -t Todo-ThreadGroup_OCP_PEAK.jmx -l peak.txt -e -o <path to report directory>
open -a "Google Chrome" file://<path to report directory>/index.html
