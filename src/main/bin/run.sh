#!/bin/sh

#Init dirs
cd `dirname $0`
BIN_DIR=`pwd`
cd ../conf
CONF_DIR=`pwd`
cd ../logs
LOG_DIR=`pwd`
cd ../lib
LIB_DIR=`pwd`
cd ../
USER_DIR=`pwd`

#Init app
APP_NAME="SpringBootBase"
APP_PACKAGE="cn.pepper"

#Check process id before run
pid=$(jps|grep "$APP_NAME"|awk '{print $1}')
if [[ -n "$pid" ]]; then
 echo "Process already exists, will try to kill!"
 kill ${pid}
fi
sleep 2
pid=$(jps|grep "$APP_NAME"|awk '{print $1}')
if [[ -n "$pid" ]]; then
 echo "Failed to kill the process, will exit!"
 exit 1
fi

#Running configuration
MEMORY_CONFIG="-Xmx2G -Xss2G"
CLASSPATH="$LIB_DIR:$LIB_DIR/*"
CONFIG_FILES="-Duser.dir=$USER_DIR -Dlogback.configurationFile=$CONF_DIR/logback.xml -Dspring.config.location=$CONF_DIR/"

#Run app
nohup java -cp ${CLASSPATH} ${APP_PACKAGE}.${APP_NAME} ${MEMORY_CONFIG} ${CONFIG_FILES} > run.log 2>&1 &

#Check status of app's process
sleep 2
jps