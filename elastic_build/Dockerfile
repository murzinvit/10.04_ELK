FROM centos:latest
WORKDIR /opt
RUN yum -y update && yum -y install wget sudo java-11-openjdk-devel initscripts
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.14.0-x86_64.rpm \
&& yum -y install elasticsearch-7.14.0-x86_64.rpm && rm elasticsearch-7.14.0-x86_64.rpm
RUN mkdir -p /etc/elasticsearch/snapshots/backup
RUN chmod -R 777 /etc/sysconfig/elasticsearch /etc/elasticsearch /var/log /var/lib /usr/share
RUN echo "path.data: /var/lib" > /etc/elasticsearch/elasticsearch.yml
RUN echo "network.host: 0.0.0.0" >> /etc/elasticsearch/elasticsearch.yml
RUN echo "http.port: 9200" >> /etc/elasticsearch/elasticsearch.yml
RUN echo "discovery.type: single-node" >> /etc/elasticsearch/elasticsearch.yml
RUN echo "node.name: netology_test" >> /etc/elasticsearch/elasticsearch.yml
RUN echo "path.repo: /etc/elasticsearch/snapshots" >> /etc/elasticsearch/elasticsearch.yml
CMD /etc/rc.d/init.d/elasticsearch start && sleep 6000000000
EXPOSE 9200
EXPOSE 9300
