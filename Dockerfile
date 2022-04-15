FROM tomcat:8.0.20-jre8
COPY target/Example-0.0.1-SNAPSHOT.war \"C:/Program Files/Apache Software Foundation/Tomcat 7.0/webapps/Example-0.0.1-SNAPSHOT.war\"
