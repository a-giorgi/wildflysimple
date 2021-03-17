# WildFly 21 
FROM jboss/wildfly:latest

# Wildfly Console params
ENV WILDFLY_USER andrea
ENV WILDFLY_PASS passwordDiAndrea


ENV MYSQL_VERSION 8.0.22
ENV JBOSS_CLI /opt/jboss/wildfly/bin/jboss-cli.sh
ENV DEPLOYMENT_DIR /opt/jboss/wildfly/standalone/deployments/
#ENV JAVA_OPTS

# Setting up WildFly Admin Console
RUN echo "=> Adding WildFly administrator"
RUN $JBOSS_HOME/bin/add-user.sh -u $WILDFLY_USER -p $WILDFLY_PASS --silent
 

# Expose http and admin 
EXPOSE 8080 9990

#echo "=> Restarting WildFly"

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
