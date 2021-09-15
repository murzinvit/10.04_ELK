# 10.04_ELK
Для подготовки docker образа Kibana:  [kibana-7.14.0-x86_64.rpm](https://artifacts.elastic.co/downloads/kibana/kibana-7.14.0-x86_64.rpm) </br>
Создать сеть для контейнера: `docker network disconnect itisgood_network determined_dubinsky` </br>


### Рабочие заметки: </br>
Для установки инфраструктуры мониторинга использовал Ubuntu 20.04. </br>
Установка в контейнер с centos:latest через ansible-[playbook](https://github.com/murzinvit/10.04_ELK/tree/main/ansible_elk_stack) </br>
Самопальный контенер с Elasticsearch: `docker pull murzinvit/elasticsearch:latest` </br>
