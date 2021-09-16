FROM centos:latest
RUN yum -y update && yum -y install wget sudo java-11-openjdk-devel initscripts
WORKDIR /opt
RUN wget https://artifacts.elastic.co/downloads/logstash/logstash-7.14.0-x86_64.rpm
RUN yum -y install logstash-7.14.0-x86_64.rpm
RUN rm logstash-7.14.0-x86_64.rpm
RUN chmod -R 777 /etc/logstash /usr/share/logstash /var
COPY logstash.yml /etc/logstash/
COPY pipelines.yml /etc/logstash/
COPY logstash-sample.conf /etc/logstash/
COPY jvm.options /etc/logstash/
RUN mkdir -p /usr/share/logstash/config && chmod -R 777 /usr/share/logstash
COPY logstash.yml /usr/share/logstash/config/
COPY pipelines.yml /usr/share/logstash/config/
COPY logstash-sample.conf /usr/share/logstash/config/
RUN echo "export LS_HOME=/usr/share/logstash" > /etc/profile.d/lstash.sh
RUN chmod +x /etc/profile.d/lstash.sh
RUN export PATH=$PATH:/usr/share/logstash/bin
CMD /usr/share/logstash/bin/logstash && sleep 600000000
EXPOSE 9600
