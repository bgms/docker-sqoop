FROM bgmsg/hadoop-docker:3.3.1
MAINTAINER bgmsg

USER root

ENV SQOOP_HOME /usr/local/sqoop

RUN curl -s http://archive.apache.org/dist/sqoop/1.4.7/sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz | tar -xz -C /usr/local && \
    ln -s /usr/local/sqoop-1.4.7.bin__hadoop-2.6.0 $SQOOP_HOME && \
    curl https://repo1.maven.org/maven2/commons-lang/commons-lang/2.6/commons-lang-2.6.jar -o $SQOOP_HOME/lib/commons-lang-2.6.jar

ENV PATH $PATH:$HADOOP_HOME/bin:$SQOOP_HOME/bin

COPY bootstrap.sh /etc/docker-startup/bootstrap-sqoop.sh
RUN chown root.root /etc/docker-startup/bootstrap-sqoop.sh
RUN chmod 700 /etc/docker-startup/bootstrap-sqoop.sh

CMD ["/etc/docker-startup/bootstrap-sqoop.sh"]
