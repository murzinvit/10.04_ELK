# 10.04_ELK
### Задание 1: </br>

### Задание 2: </br>

#### Рабочие заметки: </br>
Недостаток памяти исправил командой - `echo "vm.max_map_count=262144" >> /etc/sysctl.conf && sysctl -p` </br>
Для подготовки docker образа Kibana:  [kibana-7.14.0-x86_64.rpm](https://artifacts.elastic.co/downloads/kibana/kibana-7.14.0-x86_64.rpm) </br>
Для подготовки docker образа Elasticsearch:  [elasticsearch-7.14.0-x86_64.rpm](https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.14.0-x86_64.rpm) </br>
Для подготовки docker образа Logstash:  [logstash-7.14.0-x86_64.rpm](https://artifacts.elastic.co/downloads/logstash/logstash-7.14.0-x86_64.rpm) </br>
Агент для Debian - Filebeat:  [filebeat-7.11.0-amd64.deb](curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.11.0-amd64.deb) </br>
Создать сеть для контейнера: `docker network create --driver bridge elk` </br>
Запуск контейнера: `docker run -d --name elastic --network=elk -v /ELK:/mnt -p 9200:9200 elastic:latest` </br>
Для установки инфраструктуры мониторинга использовал Ubuntu 20.04. </br>
Установка в контейнер с centos:latest через [ansible-playbook](https://github.com/murzinvit/10.04_ELK/tree/main/ansible_elk_stack) </br>
Самопальный контенер с Elasticsearch: `docker pull murzinvit/elasticsearch:latest` </br>
Информация по настройке logstash: [https://russianblogs.com](https://russianblogs.com/article/5631150132/) </br>
