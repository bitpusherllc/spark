#!/bin/sh -x

VERSION=3.0.0-bp2

set -e

(cd dist/jars && for i in catalyst core graphx kvstore launcher mllib mllib-local network-common network-shuffle repl sketch sql streaming tags unsafe yarn; do mvn install:install-file -Dfile=spark-${i}_2.12-${VERSION}.jar -DgroupId=org.apache.spark -DartifactId=spark-${i}_2.12 -Dversion=${VERSION} -Dpackaging=jar -DgeneratePom=true; done)

(cd external/kafka-0-10-token-provider/target && mvn install:install-file -Dfile=spark-token-provider-kafka-0-10_2.12-${VERSION}.jar -DgroupId=org.apache.spark -DartifactId=spark-token-provider-kafka-0-10_2.12 -Dversion=${VERSION} -Dpackaging=jar -DgeneratePom=true)

(cd external/kafka-0-10-sql/target && mvn install:install-file -Dfile=spark-sql-kafka-0-10_2.12-${VERSION}.jar -DgroupId=org.apache.spark -DartifactId=spark-sql-kafka-0-10_2.12 -Dversion=${VERSION} -Dpackaging=jar -DgeneratePom=true)

(cd external/avro/target && mvn install:install-file -Dfile=spark-avro_2.12-${VERSION}.jar -DgroupId=org.apache.spark -DartifactId=spark-avro_2.12 -Dversion=${VERSION} -Dpackaging=jar -DgeneratePom=true)
