# 10.04_ELK
### Задание 1: </br>
1)Cкриншот docker ps через 5 минут после старта всех контейнеров (их должно быть 5): </br>
![screen](https://github.com/murzinvit/screen/blob/41e6c7d478f6df33735e459523f7123574a601ce/ELK_contaies_screen.jpg) </br>
2) скриншот интерфейса kibana: </br>
![screen](https://github.com/murzinvit/screen/blob/11247bf5d6d801e6e696ef0132478f53f6b7dcd9/ELK_kibana_interface.jpg) </br>
3) docker-compose манифест: </br>
[docker-compose.yml](https://github.com/murzinvit/10.04_ELK/blob/c99dd262abd8a729300030693b68491560c7ec6e/docker-compose.yml) </br>
4) ваши yml конфигурации для стека: </br>
[kibana.yml](https://github.com/murzinvit/10.04_ELK/blob/d612e2a5e0e3016b34615339e3e1ead06e242250/kibana/kibana.yml) </br>
[es-hot elasticsearch.yml](https://github.com/murzinvit/10.04_ELK/blob/d612e2a5e0e3016b34615339e3e1ead06e242250/es-hot/elasticsearch.yml) </br>
[es-warm elasticsearch.yml](https://github.com/murzinvit/10.04_ELK/blob/d612e2a5e0e3016b34615339e3e1ead06e242250/es-warm/elasticsearch.yml) </br>
[logstash.yml](https://github.com/murzinvit/10.04_ELK/blob/d612e2a5e0e3016b34615339e3e1ead06e242250/logstash/logstash.yml) </br>
[logstash-sample.conf](https://github.com/murzinvit/10.04_ELK/blob/d612e2a5e0e3016b34615339e3e1ead06e242250/logstash/logstash-sample.conf) </br>
[pipelines.yml](https://github.com/murzinvit/10.04_ELK/blob/d612e2a5e0e3016b34615339e3e1ead06e242250/logstash/pipelines.yml) </br>
[filebeat.yml](https://github.com/murzinvit/10.04_ELK/blob/8979a32504a2d9d3c4041920d7f12d4e2590400a/filebeat/filebeat.yml) </br>
Для сборки всех контейнеров запустить скрипт docker_build_elk.sh. Конфиги и Dockerfile лежать по своим папкам. </br>
Контейнеры запушены в dockerhub так что можно просто запускать `docker-compose up`. </br>
docker-compose.yml пришлось брать примером из help, т.к ошибки Out of memory kill process и прочее </br>
Перед запуском создать сеть для контейнеров: `docker network create --driver=bridge elastiс` </br>
Просмотр сетей: `docker network ls` </br>
В filebeat.yml - монтируется хостовый /var/log и от туда берётся syslog </br>


### Задание 2: </br>
Индекс в кибане из докерконтейнера с filebeat. Не  добился чтобы отображалось как logstash: </br>
![screen](https://github.com/murzinvit/screen/blob/e26a95df5aa29391adaea03dca55841e2d4d73ee/ELK_discover_index.jpg) </br>
Индекс в кибане из filebeat на другом хосте: </br>
![screen](https://github.com/murzinvit/screen/blob/1cb876bdc0753cf308e7f95e00390e7060ec01fc/ELK_discover_index_fbds.jpg) </br>

#### Рабочие заметки: </br>
Недостаток памяти исправил командой - `echo "vm.max_map_count=262144" >> /etc/sysctl.conf && sysctl -p` </br>
Для подготовки docker образа Kibana:  [kibana-7.14.0-x86_64.rpm](https://artifacts.elastic.co/downloads/kibana/kibana-7.14.0-x86_64.rpm) </br>
Для подготовки docker образа Elasticsearch:  [elasticsearch-7.14.0-x86_64.rpm](https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.14.0-x86_64.rpm) </br>
Для подготовки docker образа Logstash:  [logstash-7.14.0-x86_64.rpm](https://artifacts.elastic.co/downloads/logstash/logstash-7.14.0-x86_64.rpm) </br>
Агент для Filebeat:  [filebeat-7.11.0-x86_64.rpm](https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.11.0-x86_64.rpm) </br>
Запуск контейнера: `docker run -d --name elastic --network=elk -v /ELK:/mnt -p 9200:9200 elastic:latest` </br>
Для установки инфраструктуры мониторинга использовал Ubuntu 20.04. </br>
Установка в контейнер с centos:latest через [ansible-playbook](https://github.com/murzinvit/10.04_ELK/tree/main/ansible_elk_stack) </br>
Самопальный контенер с Elasticsearch: `docker pull murzinvit/elasticsearch:latest` </br>
Информация по настройке logstash: [https://russianblogs.com](https://logz.io/blog/filebeat-vs-logstash/) </br>
Ошибка docker login - error storing creditionals - `sudo apt install gnupg2 pass` </br>
