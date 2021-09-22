FROM centos:latest
RUN yum -y update && yum -y install wget sudo java-11-openjdk-devel initscripts
WORKDIR /opt
RUN wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.11.0-x86_64.rpm
RUN yum -y install filebeat-7.11.0-x86_64.rpm
RUN rm filebeat-7.11.0-x86_64.rpm
COPY filebeat.yml /etc/filebeat/
RUN chmod -R 644 /etc/filebeat/
CMD /etc/rc.d/init.d/filebeat start && sleep 600000000
