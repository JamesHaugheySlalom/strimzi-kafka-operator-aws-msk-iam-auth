FROM aidanmelen/strimzi-kafka-operator-aws-msk-iam-auth:0.31.0-kafka-3.1.1-aws-1.1.6
# JDBC Kafka Connector
COPY confluentinc-kafka-connect-jdbc-10.0.1/ /opt/kafka/plugins/confluentinc-kafka-connect-jdbc-10.0.1/
COPY db2-driver/db2jcc4.jar /opt/kafka/plugins/confluentinc-kafka-connect-jdbc-10.0.1/lib/
COPY mysql-driver/mysql-connector-java-5.1.49.jar /opt/kafka/plugins/confluentinc-kafka-connect-jdbc-10.0.1/lib/

# MongoDB Kafka Connector
COPY mongodb-kafka-connect-mongodb-1.7.0/ /opt/kafka/plugins/mongodb-kafka-connect-mongodb-1.7.0/

# S3 Kafka Connector
COPY confluentinc-kafka-connect-s3-10.5.5/ /opt/kafka/plugins/confluentinc-kafka-connect-s3-10.5.5/

# Avro Converter
COPY confluentinc-kafka-connect-avro-converter-7.5.1/ /opt/kafka/plugins/confluentinc-kafka-connect-avro-converter-7.5.1/