FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
ENV USER=webuser
ENV UID=1001
RUN adduser --disabled-password --uid $UID $USER \
	&& mkdir -p /app \
	&& chown -R ${USER}:${USER} /app
USER ${USER}
COPY --chown=$USER:$USER ${JAR_FILE} /app/app.jar
ENTRYPOINT ["java","-jar","/app/app.jar"]
EXPOSE 8000