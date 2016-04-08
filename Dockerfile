FROM debian:stretch
RUN apt-get update && apt-get install -y openjdk-8-jre wget && apt-get clean
RUN cd /opt && wget http://apache.lauf-forum.at/cassandra/3.4/apache-cassandra-3.4-bin.tar.gz && tar xzf apache-cassandra-3.4-bin.tar.gz
ADD conf/cassandra.yaml /opt/apache-cassandra-3.4/conf/cassandra.yaml
RUN adduser --system --home /opt/apache-cassandra-3.4 cassandra && chown -R cassandra /opt/apache-cassandra-3.4

EXPOSE 9042
USER cassandra
WORKDIR /opt/apache-cassandra-3.4
CMD /opt/apache-cassandra-3.4/bin/cassandra -f

