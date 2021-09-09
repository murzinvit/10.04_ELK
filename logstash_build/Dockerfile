FROM centos:latest
RUN yum -y update && yum -y install wget sudo java-11-openjdk-devel initscripts
WORKDIR /opt
RUN wget https://artifacts.elastic.co/downloads/logstash/logstash-7.14.0-x86_64.rpm
RUN yum -y install logstash-7.14.0-x86_64.rpm
RUN chmod -R 777 /etc/logstash /usr/share/logstash /var
RUN echo "node.name: node1" >> /etc/logstash/logstash.yml
RUN echo "path.data: /opt" >> /etc/logstash/logstash.yml
RUN echo "http.host: 0.0.0.0" >> /etc/logstash/logstash.yml
RUN echo "http.port: 9600" >> /etc/logstash/logstash.yml
RUN echo "path.logs: /var/log" >> /etc/logstash/logstash.yml
CMD /usr/share/logstash/bin/logstash && sleep 600000000
EXPOSE 9600
