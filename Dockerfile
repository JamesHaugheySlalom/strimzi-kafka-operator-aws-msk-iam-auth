ARG STRIMZI_KAFKA_TAG="0.38.0-kafka-3.6.0"

FROM quay.io/strimzi/kafka:${STRIMZI_KAFKA_TAG}

ARG AWS_MSK_IAM_AUTH_VERSION="2.1.1"
ENV CLASSPATH=/opt/kafka/libs/aws-msk-iam-auth-${AWS_MSK_IAM_AUTH_VERSION}-all.jar

USER root
RUN curl --insecure -o /opt/kafka/libs/aws-msk-iam-auth-${AWS_MSK_IAM_AUTH_VERSION}-all.jar https://github.com/aws/aws-msk-iam-auth/releases/download/v${AWS_MSK_IAM_AUTH_VERSION}/aws-msk-iam-auth-${AWS_MSK_IAM_AUTH_VERSION}-all.jar
RUN chown kafka /opt/kafka/libs/aws-msk-iam-auth-${AWS_MSK_IAM_AUTH_VERSION}-all.jar
RUN cp /opt/kafka/libs/aws-msk-iam-auth-${AWS_MSK_IAM_AUTH_VERSION}-all.jar /usr/share/java/kafka

COPY kafka_connect_config_generator.sh /opt/kafka/kafka_connect_config_generator.sh
COPY kafka_mirror_maker_2_connector_config_generator.sh /opt/kafka/kafka_mirror_maker_2_connector_config_generator.sh
COPY kafka_mirror_maker_consumer_config_generator.sh /opt/kafka/kafka_mirror_maker_consumer_config_generator.sh
COPY kafka_mirror_maker_producer_config_generator.sh /opt/kafka/kafka_mirror_maker_producer_config_generator.sh

RUN chmod +x /opt/kafka/kafka_connect_config_generator.sh \
 && chmod +x /opt/kafka/kafka_mirror_maker_2_connector_config_generator.sh \
 && chmod +x /opt/kafka/kafka_mirror_maker_consumer_config_generator.sh \
 && chmod +x /opt/kafka/kafka_mirror_maker_producer_config_generator.sh