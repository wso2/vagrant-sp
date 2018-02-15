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
WSO2_SERVER=wso2sp
WSO2_SERVER_VERSION=4.0.0
WSO2_SERVER_PACK=${WSO2_SERVER}-${WSO2_SERVER_VERSION}*.zip
MYSQL_CONNECTOR=mysql-connector-java-5.1.*-bin.jar
WORKING_DIRECTORY=/home/vagrant
JAVA_HOME=/opt/java/
DEFAULT_MOUNT=/vagrant
CONFIGURATIONS=${DEFAULT_MOUNT}/
NODE_IP=$(/sbin/ifconfig eth1 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')

# unpack the WSO2 product pack to the working directory
echo "Setting up the ${WSO2_SERVER}-${WSO2_SERVER_VERSION} server..."
if test ! -d ${WSO2_SERVER}-${WSO2_SERVER_VERSION}; then
  unzip -q ${WORKING_DIRECTORY}/${WSO2_SERVER_PACK} -d ${WORKING_DIRECTORY}
fi
echo "Successfully set up ${WSO2_SERVER}-${WSO2_SERVER_VERSION} server"

# add the MySQL driver
echo "Copying the MySQL driver to the server pack..."
cp ${WORKING_DIRECTORY}/${MYSQL_CONNECTOR} ${WORKING_DIRECTORY}/${WSO2_SERVER}-${WSO2_SERVER_VERSION}/lib/${MYSQL_CONNECTOR}
if [ "$?" -eq "0" ];
then
  echo "Successfully copied the MySQL driver to the server pack."
else
  echo "Failed to copy the MySQL driver to the server pack."
fi

# copy files with configuration changes
echo "Copying the files with configuration changes to the server pack..."

cp -TRv ${CONFIGURATIONS}/manager/repository/conf/ ${WORKING_DIRECTORY}/${WSO2_SERVER}-${WSO2_SERVER_VERSION}/conf/manager
if [ "$?" -eq "0" ];
then
  echo "Successfully copied the configuration files."
else
  echo "Failed to copy the configuration files"
fi

# copy kafka jars
echo "Copying the kafka jars to the server pack..."

cp -TRv ${WORKING_DIRECTORY}/kafka-osgi/kafka_2.11_0.10.0.0_1.0.0.jar ${WORKING_DIRECTORY}/${WSO2_SERVER}-${WSO2_SERVER_VERSION}/lib/kafka_2.11_0.10.0.0_1.0.0.jar
cp -TRv ${WORKING_DIRECTORY}/kafka-osgi/kafka_clients_0.10.0.0_1.0.0.jar ${WORKING_DIRECTORY}/${WSO2_SERVER}-${WSO2_SERVER_VERSION}/lib/kafka_clients_0.10.0.0_1.0.0.jar
cp -TRv ${WORKING_DIRECTORY}/kafka-osgi/metrics_core_2.2.0_1.0.0.jar ${WORKING_DIRECTORY}/${WSO2_SERVER}-${WSO2_SERVER_VERSION}/lib/metrics_core_2.2.0_1.0.0.jar
cp -TRv ${WORKING_DIRECTORY}/kafka-osgi/scala_library_2.11.8_1.0.0.jar ${WORKING_DIRECTORY}/${WSO2_SERVER}-${WSO2_SERVER_VERSION}/lib/scala_library_2.11.8_1.0.0.jar
cp -TRv ${WORKING_DIRECTORY}/kafka-osgi/scala_parser_combinators_2.11_1.0.4_1.0.0.jar ${WORKING_DIRECTORY}/${WSO2_SERVER}-${WSO2_SERVER_VERSION}/lib/scala_parser_combinators_2.11_1.0.4_1.0.0.jar
cp -TRv ${WORKING_DIRECTORY}/kafka-osgi/zkclient_0.8_1.0.0.jar ${WORKING_DIRECTORY}/${WSO2_SERVER}-${WSO2_SERVER_VERSION}/lib/zkclient_0.8_1.0.0.jar
cp -TRv ${WORKING_DIRECTORY}/kafka-osgi/zookeeper_3.4.6_1.0.0.jar ${WORKING_DIRECTORY}/${WSO2_SERVER}-${WSO2_SERVER_VERSION}/lib/zookeeper_3.4.6_1.0.0.jar
if [ "$?" -eq "0" ];
then
  echo "Successfully copied the kafka jar files."
else
  echo "Failed to copy the kafka jar files"
fi

export JAVA_HOME

# start the WSO2 product pack as a background service
echo "Starting ${WSO2_SERVER}-${WSO2_SERVER_VERSION}..."
nohup ${WORKING_DIRECTORY}/${WSO2_SERVER}-${WSO2_SERVER_VERSION}/wso2/manager/bin/carbon.sh &

sleep 10