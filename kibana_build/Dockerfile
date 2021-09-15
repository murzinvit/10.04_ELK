FROM centos:latest
RUN yum -y update && yum -y install wget sudo java-11-openjdk-devel initscripts
WORKDIR /opt
RUN wget https://artifacts.elastic.co/downloads/kibana/kibana-7.14.0-x86_64.rpm
RUN yum -y install kibana-7.14.0-x86_64.rpm
RUN chmod -R 777 /etc/sysconfig/kibana /etc/kibana /usr/share/kibana /var
RUN echo "server.port: 5601" >> /etc/kibana/kibana.yml
RUN echo "server.host: 0.0.0.0" >> /etc/kibana/kibana.yml
RUN echo "elasticsearch.hosts: ["http://elastic:9200"]" >> /etc/kibana/kibana.yml
CMD /etc/rc.d/init.d/kibana start -Q && sleep 600000000
EXPOSE 5601
