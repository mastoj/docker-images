# Dockerfile for EventStore
# http://geteventstore.com/

FROM ubuntu:14.04

MAINTAINER Tomas Jansson <tomas@2mas.xyz>

# Install curl
RUN apt-get update && apt-get install -y curl

# Create user
RUN addgroup eventstore \
		&& adduser --ingroup eventstore --disabled-password --gecos "Database" eventstore \
		&& usermod -L eventstore

# Set environment variables
USER eventstore
ENV ES_VERSION 3.4.0
ENV ES_HOME /opt/EventStore-OSS-Ubuntu-14.04-v$ES_VERSION
ENV EVENTSTORE_DB /data/db
ENV EVENTSTORE_LOG /data/logs

# Download and extract EventStore
USER root

RUN curl http://download.geteventstore.com/binaries/EventStore-OSS-Ubuntu-14.04-v$ES_VERSION.tar.gz | tar xz --directory /opt \
#RUN curl http://download.geteventstore.com/binaries/EventStore-OSS-Ubuntu-14.04-v3.4.0.tar.gz | tar xz --directory /opt \
		&& chown -R eventstore:eventstore $ES_HOME

# Add volumes
RUN mkdir -p $EVENTSTORE_DB && mkdir -p $EVENTSTORE_LOG \
		&& chown -R eventstore:eventstore $EVENTSTORE_DB $EVENTSTORE_LOG
VOLUME $EVENTSTORE_DB
VOLUME $EVENTSTORE_LOG

# Change working directory
WORKDIR $ES_HOME

ADD ./run.sh $ES_HOME

# Run
ENTRYPOINT ["./run.sh"]
CMD ["--help"]

# Expose the HTTP and TCP ports
ENV INT_TCP_PORT=1112 \
    INT_HTTP_PORT=2112 \
    EXT_TCP_PORT=1113 \
    EXT_HTTP_PORT=2113

EXPOSE $INT_TCP_PORT
EXPOSE $INT_HTTP_PORT
EXPOSE $EXT_TCP_PORT
EXPOSE $EXT_HTTP_PORT

# Clean up.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*