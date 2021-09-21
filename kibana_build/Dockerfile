FROM centos:latest
RUN yum -y update && yum -y install wget sudo java-11-openjdk-devel initscripts
WORKDIR /opt
RUN wget https://artifacts.elastic.co/downloads/kibana/kibana-7.14.0-x86_64.rpm
RUN yum -y install kibana-7.14.0-x86_64.rpm
COPY kibana.yml /etc/kibana/
RUN chmod -R 777 /etc/sysconfig/kibana /etc/kibana /usr/share/kibana /var
CMD /etc/rc.d/init.d/kibana start -Q && sleep 600000000
EXPOSE 5601
