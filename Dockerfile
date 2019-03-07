FROM registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift
USER jboss
RUN mkdir -p /opt/fake-smtp && curl -L -O http://nilhcem.github.com/FakeSMTP/downloads/fakeSMTP-latest.zip && unzip fakeSMTP-latest.zip -d /opt/fake-smtp && rm fakeSMTP-latest.zip
RUN mv /opt/fake-smtp/fakeSMTP*.jar /opt/fake-smtp/fakeSMTP.jar
EXPOSE 8080
VOLUME ["/var/mail"]
CMD java -jar /opt/fake-smtp/fakeSMTP.jar --start-server --background --output-dir /var/mail --port 25
