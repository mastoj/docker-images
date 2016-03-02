FROM kibana:4

MAINTAINER mastoj

RUN /opt/kibana/bin/kibana plugin --install elasticsearch/marvel/latest
RUN /opt/kibana/bin/kibana plugin --install elastic/sense
RUN chown -R kibana:kibana /opt/kibana
