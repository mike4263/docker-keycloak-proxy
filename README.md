Keycloak Proxy
==============

When working with legacy applications, it is sometimes easier to setup a SSO proxy in front of the application instead of integrating SSO with the application itself. This container includes the KeyCloak HTTP Proxy that will use a Keycloak install to verify users before passing requests on to the protected application.

More details on the proxy can be found here: http://keycloak.github.io/docs/userguide/keycloak-server/html/proxy.html

Configuration
-------------

KeyCloak Proxy is configured via a json file. In this version of the image you must mount the config file to `/opt/jboss/keycloak-proxy/config.json`. A description of the config file format can be found in the above link.

Running
-------

    docker run -p 8080:8080 -v /etc/keycloak-config.json:/opt/jboss/keycloak-proxy/config.json cpitman/keycloak-proxy 

