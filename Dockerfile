FROM alpine:3.10

RUN apk update && \
apk add tar bash curl openssl python bzip2 maven procps
# gcc build-base
RUN apk upgrade --available

RUN echo "Print out dockerfile directory before volume"
RUN ls -lsa
VOLUME /tmp
RUN echo "Print out dockerfile directory after volume"
RUN ls -lsa
ADD target/demo-1.0.0.jar app.jar
ENV JAVA_OPTS="-Xmx512m -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap"
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
#ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -jar /app.jar" ]
EXPOSE 8080
USER 1001
