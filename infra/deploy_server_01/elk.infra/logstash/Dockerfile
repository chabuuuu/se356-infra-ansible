FROM docker.elastic.co/logstash/logstash:8.7.0

COPY config/* /etc/logstash/conf.d/

COPY pipelines.yml /etc/logstash/pipelines.yml

# Thiết lập biến môi trường cho Logstash
ENV ELASTICSEARCH_USER=elastic
ENV ELASTICSEARCH_PASSWORD=${ELASTICSEARCH_PASSWORD}

CMD ["logstash", "--path.settings", "/etc/logstash"]

