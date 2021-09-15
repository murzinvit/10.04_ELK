FROM centos:latest
RUN yum -y update && yum -y install wget sudo java-11-openjdk-devel initscripts
WORKDIR /opt
RUN wget https://artifacts.elastic.co/downloads/logstash/logstash-7.14.0-x86_64.rpm
RUN yum -y install logstash-7.14.0-x86_64.rpm
RUN chmod -R 777 /etc/sysconfig/logstash /etc/logstash /usr/share/logstash /var
RUN echo "server.port: 5601" >> /etc/logstash/logstash-sample.conf
RUN echo "server.host: 0.0.0.0" >> /etc/kibana/kibana.yml
RUN echo "elasticsearch.hosts: ["http://elastic:9200"]" >> /etc/kibana/kibana.yml
CMD /etc/rc.d/init.d/logstash start -Q && sleep 600000000
EXPOSE 5601
