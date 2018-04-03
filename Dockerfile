FROM registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift:latest

ENV KEYCLOAK_VERSION 1.9.2.Final

USER root 
RUN yum install -y unzip wget && yum clean all && mkdir -p /opt/jboss && chown jboss /opt/jboss

USER jboss 

RUN cd /opt/jboss/ && wget https://downloads.jboss.org/keycloak/$KEYCLOAK_VERSION/keycloak-proxy-$KEYCLOAK_VERSION.zip && unzip keycloak-proxy-$KEYCLOAK_VERSION.zip && mv /opt/jboss/keycloak-proxy-$KEYCLOAK_VERSION /opt/jboss/keycloak-proxy

EXPOSE 8080 8443 

WORKDIR /opt/jboss/keycloak-proxy

CMD ["java", "-jar", "bin/launcher.jar", "config.json"]
