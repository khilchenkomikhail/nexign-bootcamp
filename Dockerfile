FROM openjdk:8-jdk-alpine
ARG USER=appuser
ARG UID=1001
ARG GROUP=appgroup
ARG GID=1001
RUN addgroup -S -g $GID $GROUP && adduser --disabled-password -S -u $UID $USER -G $GROUP \
	&& mkdir -p /app \
	&& chown -R $USER:$GROUP /app
USER $USER:$GROUP
ARG JAR_FILE=target/*.jar
COPY --chown=$USER:$GROUP ${JAR_FILE} /app/app.jar
ENTRYPOINT ["java","-jar","/app/app.jar"]
WORKDIR /app
EXPOSE 8000