#!/usr/bin/env bash

#Kafka Broker Properties
#For beginners, the default configurations of the Kafka broker are good enough, but for production-level setup, one must understand each configuration. I am going to explain some of these configurations.
#
#broker.id: The ID of the broker instance in a cluster.
#
#zookeeper.connect: The ZooKeeper address (can list multiple addresses comma-separated for the ZooKeeper cluster). Example: localhost:2181,localhost:2182.
#
#zookeeper.connection.timeout.ms: Time to wait before going down if, for some reason, the broker is not able to connect.
#
#Socket Server Properties
#socket.send.buffer.bytes: The send buffer used by the socket server.
#
#socket.receive.buffer.bytes: The socket server receives a buffer for network requests.
#
#socket.request.max.bytes: The maximum request size the server will allow. This prevents the server from running out of memory.
#
#Flush Properties
#Each arriving message at the Kafka broker is written into a segment file. The catch here is that this data is not written to the disk directly. It is buffered first. The below two properties define when data will be flushed to disk. Very large flush intervals may lead to latency spikes when the flush happens and a very small flush interval may lead to excessive seeks.
#
#log.flush.interval.messages: Threshold for message count that is once reached all messages are flushed to the disk.
#
#log.flush.interval.ms: Periodic time interval after which all messages will be flushed into the disk.
#
#Log Retention
#As discussed above, messages are written into a segment file. The following policies define when these files will be removed.
#
#log.retention.hours: The minimum age of the segment file to be eligible for deletion due to age.
#
#log.retention.bytes: A size-based retention policy for logs. Segments are pruned from the log unless the remaining segments drop below log.retention.bytes.
#
#log.segment.bytes: Size of the segment after which a new segment will be created.
#
#log.retention.check.interval.ms: Periodic time interval after which log segments are checked for deletion as per the retention policy. If both retention policies are set, then segments are deleted when either criterion is met.
#
#Conclusion
#Thanks for reading my article.  Here you can find how to create producer and consumer in java. Kafka Monitoring In this article i have explained how to monitor kafka cluster.

rm -r /home/misha/kafka/kafka-logs
mkdir /home/misha/kafka/kafka-logs
cd /home/misha/zookeeper/
bash  bin/zkServer.sh start
sleep 10
cd /home/misha/kafka
bash ./bin/kafka-server-start.sh config/server.properties
