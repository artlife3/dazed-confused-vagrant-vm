JAVA_HOME=/usr/java/default
JAVA_OPTS="-Xms1024M -Xmx1024M -XX:MaxPermSize=256m -Xloggc:{{ tomact_dir }}/{{ tomcat_name }}/logs/tomcat-gc.log -XX:+PrintGCDetails"