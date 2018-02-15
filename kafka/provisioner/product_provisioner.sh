#!/usr/bin/env bash
# Copyright 2018 WSO2, Inc. (http://wso2.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License

# set variables
WORKING_DIRECTORY=/home/vagrant
JAVA_HOME=/opt/java/
DEFAULT_MOUNT=/vagrant
CONFIGURATIONS=${DEFAULT_MOUNT}/

# unpack the WSO2 product pack to the working directory
echo "Setting up the kafka server..."
tar xvzf kafka_2.11-0.10.0.0.tgz

echo "Successfully set up Kafka Server"

export JAVA_HOME

# start the WSO2 product pack as a background service
echo "Starting Kafka..."

nohup ${WORKING_DIRECTORY}/kafka_2.11-0.10.0.0/bin/zookeeper-server-start.sh ${WORKING_DIRECTORY}/kafka_2.11-0.10.0.0/config/zookeeper.properties &
nohup ${WORKING_DIRECTORY}/kafka_2.11-0.10.0.0/bin/kafka-server-start.sh ${WORKING_DIRECTORY}/kafka_2.11-0.10.0.0/config/server.properties &

sleep 10

# tail the WSO2 product server startup logs until the server startup confirmation is logged
tail -f ${WORKING_DIRECTORY}/kafka_2.11-0.10.0.0/logs/server.log | while read LOG_LINE
do
  # echo each log line
  echo "${LOG_LINE}"
  # once the log line with WSO2 Carbon server start confirmation was logged, kill the started tail process
  [[ "${LOG_LINE}" == *"started (kafka.server.KafkaServer)"* ]] && pkill tail
done
