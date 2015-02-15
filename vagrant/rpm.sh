#!/bin/bash

set -e
set -x

yum -y update

JDK_VERSION="jdk1.6.0_45"
JDK_SHORT_VERSION="6u45"

curl -s -o "/tmp/jdk-${JDK_SHORT_VERSION}-linux-x64-rpm.bin" "https://s3-us-west-2.amazonaws.com/confluent-packaging-tools/jdk-6u45-linux-x64-rpm.bin"
sh "/tmp/jdk-${JDK_SHORT_VERSION}-linux-x64-rpm.bin"

alternatives --install /usr/bin/java java "/usr/java/${JDK_VERSION}/jre/bin/java" 1000000
alternatives --install /usr/bin/javaws javaws "/usr/java/${JDK_VERSION}/jre/bin/javaws" 1000000
alternatives --install /usr/bin/javac javac "/usr/java/${JDK_VERSION}/bin/javac" 1000000
alternatives --set java "/usr/java/${JDK_VERSION}/jre/bin/java"
alternatives --set javaws "/usr/java/${JDK_VERSION}/jre/bin/javaws"
alternatives --set javac "/usr/java/${JDK_VERSION}/bin/javac"
