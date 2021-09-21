FROM centos:latest
WORKDIR /opt
RUN yum -y update && yum -y install wget sudo java-11-openjdk-devel initscripts
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.14.0-x86_64.rpm \
&& yum -y install elasticsearch-7.14.0-x86_64.rpm && rm elasticsearch-7.14.0-x86_64.rpm
RUN mkdir -p /etc/elasticsearch/snapshots/backup
RUN chmod -R 777 /etc/sysconfig/elasticsearch /etc/elasticsearch /var/log /var/lib /usr/share
COPY elasticsearch.yml /etc/elasticsearch/
CMD /etc/rc.d/init.d/elasticsearch start && sleep 6000000000
EXPOSE 9200
EXPOSE 9300