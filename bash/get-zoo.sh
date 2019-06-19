#!/usr/bin/env bash
version=3.5.5
dest=../env

wget -P ${dest} "http://apache-mirror.rbc.ru/pub/apache/zookeeper/stable/apache-zookeeper-${version}.tar.gz"
cd ${dest}

tar  -xvzf apache-zookeeper-${version}.tar.gz