Elasticsearch 0.90.5 Dockerfile
-------------------------------

This build does several things.

installs the following plugins:

- River JDBC 2.0.2
- Head
- Bigdesk

Requires an ubuntu:12.04 image with a java 7 installation and `JAVA_HOME` set (See Dockerfile).
Elasticsearch should work equally well with OpenJDK and Oracle.

Elasticsearch requires a higher open file limit.  Set this in /etc/init/docker.conf to taste
to get docker to give a higher open file limit to containers (also refer to the upstart documentation
for how to set this):

```
limit nofile 262144 262144
```

Autogenerates the elasticsearch.yml at startup
which allows the following settings:

Cluster Name
++++++++++++

Set the name of the cluster (not the node name)

```
Flag: -n <string>
Default: elasticsearch
```

Master
++++++

Whether or not this instance can elect to be a Master Node

```
Flag: -m <true/false>
Default: false
```

Data
++++

Whether or not this instance can store index data

```
Flag: -d <true/false>
Default: false
```

Publish Host IP
+++++++++++++++

For the cluster to find itself across docker servers,
you gotta tell it the public facing IP of the docker server.
Otherwise, it defaults to a 10.17. address that is not routeable.

```
Flag: -p <IP Address>
Default: 127.0.0.1
```

Logstash Master Hostname/IP
+++++++++++++++++++++++++++

If the instance is expected to join an existing cluster,
give the hostname/IP of a master in the cluster.  This mitigates
the fact that multicast doesn't seem to work.  You don't need
to give all the servers, once it is on the network and detects
the given master, it will continue to operate if that master
disappears.  Think of this setting as a stopgap to get the 
server on the network.

```
Flag: -h <hostname/IP>
Default: 127.0.0.1
```

HEAP SIZE
+++++++++

```
Flag: -s <Heap size>
Default: 1G
```
