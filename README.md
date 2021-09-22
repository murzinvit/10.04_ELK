# 10.04_ELK
### Задание 1: </br>
1)Cкриншот docker ps через 5 минут после старта всех контейнеров (их должно быть 5): </br>
![screen](https://github.com/murzinvit/screen/blob/41e6c7d478f6df33735e459523f7123574a601ce/ELK_contaies_screen.jpg) </br>
2) скриншот интерфейса kibana: </br>
![screen](https://github.com/murzinvit/screen/blob/11247bf5d6d801e6e696ef0132478f53f6b7dcd9/ELK_kibana_interface.jpg) </br>
3) docker-compose манифест: </br>
[docker-compose.yml](https://github.com/murzinvit/10.04_ELK/blob/c99dd262abd8a729300030693b68491560c7ec6e/docker-compose.yml) </br>
4) ваши yml конфигурации для стека: </br>
[kibana.yml](https://github.com/murzinvit/10.04_ELK/blob/b41d055084cdefd28afb07e493b372b97b6ea43b/kibana_build/kibana.yml) </br>
[es-hot elasticsearch.yml](https://github.com/murzinvit/10.04_ELK/blob/b41d055084cdefd28afb07e493b372b97b6ea43b/elastic_build/es-hot/elasticsearch.yml) </br>
[es-warm elasticsearch.yml](https://github.com/murzinvit/10.04_ELK/blob/b41d055084cdefd28afb07e493b372b97b6ea43b/elastic_build/es-warm/elasticsearch.yml) </br>
[logstash.yml](https://github.com/murzinvit/10.04_ELK/blob/b41d055084cdefd28afb07e493b372b97b6ea43b/logstash_build/logstash.yml) </br>
[logstash-sample.conf](https://github.com/murzinvit/10.04_ELK/blob/b41d055084cdefd28afb07e493b372b97b6ea43b/logstash_build/logstash-sample.conf) </br>
[pipelines.yml](https://github.com/murzinvit/10.04_ELK/blob/main/logstash_build/pipelines.yml) </br>
Контейнеры собрал из Dockerfile, зайти в каждую папку и запустить- docker_build.sh. Запушил в dockerhub. filebeat взял рабочий из help, добавил его в docker-compose </br>

### Задание 2: </br>

#### Рабочие заметки: </br>
Недостаток памяти исправил командой - `echo "vm.max_map_count=262144" >> /etc/sysctl.conf && sysctl -p` </br>
Для подготовки docker образа Kibana:  [kibana-7.14.0-x86_64.rpm](https://artifacts.elastic.co/downloads/kibana/kibana-7.14.0-x86_64.rpm) </br>
Для подготовки docker образа Elasticsearch:  [elasticsearch-7.14.0-x86_64.rpm](https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.14.0-x86_64.rpm) </br>
Для подготовки docker образа Logstash:  [logstash-7.14.0-x86_64.rpm](https://artifacts.elastic.co/downloads/logstash/logstash-7.14.0-x86_64.rpm) </br>
Агент для Filebeat:  [filebeat-7.11.0-x86_64.rpm](https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.11.0-x86_64.rpm) </br>
Создать сеть для контейнера: `docker network create --driver bridge elastik` </br>
Запуск контейнера: `docker run -d --name elastic --network=elk -v /ELK:/mnt -p 9200:9200 elastic:latest` </br>
Для установки инфраструктуры мониторинга использовал Ubuntu 20.04. </br>
Установка в контейнер с centos:latest через [ansible-playbook](https://github.com/murzinvit/10.04_ELK/tree/main/ansible_elk_stack) </br>
Самопальный контенер с Elasticsearch: `docker pull murzinvit/elasticsearch:latest` </br>
Информация по настройке logstash: [https://russianblogs.com](https://logz.io/blog/filebeat-vs-logstash/) </br>
