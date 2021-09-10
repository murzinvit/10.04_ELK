FROM centos:7
RUN yum -y update && yum -y install wget sudo java-11-openjdk-devel initscripts
RUN cd /opt && wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.14.0-x86_64.rpm
RUN cd /opt && yum -y install elasticsearch-7.14.0-x86_64.rpm
RUN mkdir -p /etc/elasticsearch/snapshots/netology_backup
RUN chmod -R 777 /etc/sysconfig/elasticsearch /etc/elasticsearch /var/log/elasticsearch \
/var/lib/elasticsearch /var/lib /usr/share/elasticsearch/
RUN echo "path.data: /var/lib" > /etc/elasticsearch/elasticsearch.yml
RUN echo "network.host: 0.0.0.0" >> /etc/elasticsearch/elasticsearch.yml
RUN echo "http.port: 9200" >> /etc/elasticsearch/elasticsearch.yml
RUN echo "discovery.type: single-node" >> /etc/elasticsearch/elasticsearch.yml
RUN echo "node.name: netology_test" >> /etc/elasticsearch/elasticsearch.yml
RUN echo "path.repo: /etc/elasticsearch/snapshots" >> /etc/elasticsearch/elasticsearch.yml
CMD /etc/rc.d/init.d/elasticsearch start && sleep 6000000000
EXPOSE 9200
EXPOSE 9300
