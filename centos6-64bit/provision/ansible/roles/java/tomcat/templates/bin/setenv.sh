JAVA_HOME=/usr
JAVA_OPTS="-Xms{{ tomcat_Xms }} -Xmx{{ tomcat_Xmx }} -Xloggc:{{ tomact_dir }}/{{ tomcat_name }}/logs/tomcat-gc.log -XX:+PrintGCDetails"