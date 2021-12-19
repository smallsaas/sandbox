#!/usr/bin/env bash
######################
deploy_container=${CONTAINER}
####################
if [ ! $deploy_container ];then 
   echo env CONTAINER not yet exported !
   exit
fi
#########################

ENDPOINT="http://localhost"
SOCK_OPT='--unix-socket /var/run/docker.sock'

## working dir within container => /webapps
# workingdir(){
#    endpoint=$1
#    container=$2

#    # echo "curl -s $endpoint/containers/$container/json | jq '.HostConfig.Binds[] | match(\"([a-z/]+):[a-z/]*/webapps[a-z/]*\").string'"
#    # local binds=$(curl -s $endpoint/containers/$container/json | jq '.HostConfig.Binds[] | match("([a-z/]+):[a-z/]*/webapps[a-z/]*").string')
#    echo curl $SOCK_OPT -s $endpoint/containers/$container/json > /dev/stderr
#    local binds=$(curl $SOCK_OPT -s $endpoint/containers/$container/json | jq '.HostConfig.Binds[] | match("[a-z/]*/webapps:rw").string')
#    for bind in $binds;do
#       bind=${bind%\"}
#       bind=${bind#\"}
#       bind=${bind%:rw}
#       echo $bind
#    done
# }

getcontainerjsonvalue(){
   endpoint=$1
   container=$2
   jq_filter="$3"

   # echo "curl -s $endpoint/containers/$container/json | jq '.HostConfig.Binds[] | match(\"([a-z/]+):[a-z/]*/webapps[a-z/]*\").string'"
   # local binds=$(curl -s $endpoint/containers/$container/json | jq '.HostConfig.Binds[] | match("([a-z/]+):[a-z/]*/webapps[a-z/]*").string')
   echo "curl $SOCK_OPT -s $endpoint/containers/$container/json | jq $jq_filter" > /dev/stderr
   local result=$(curl $SOCK_OPT -s $endpoint/containers/$container/json | jq $jq_filter)
   result=${result%\"}
   result=${result#\"}
   echo $result
}

# working dir from filesystem
getcontainerworkingdir(){
   endpoint=$1
   container=$2
   echo $(getcontainerjsonvalue $endpoint $container '.Config.Labels."com.docker.compose.project.working_dir"')
}

getcontainerstatus(){
   endpoint=$1
   container=$2
   echo $(getcontainerjsonvalue $endpoint $container '.State.Status')
}

stopcontainer(){
    endpoint=$1
    container=$2
    echo curl $SOCK_OPT -s -X POST $endpoint/containers/$container/stop > /dev/stderr
    curl $SOCK_OPT -s -X POST $endpoint/containers/$container/stop
}
restartcontainer(){
    endpoint=$1
    container=$2
    echo curl $SOCK_OPT -s -X POST $endpoint/containers/$container/restart > /dev/stderr
    curl $SOCK_OPT -s -X POST $endpoint/containers/$container/restart
}

# buildtar(){
#    standalone=$1
#    local dir=${standalone%\/*}
#    local app=${standalone##*\/}
#    if [[ $dir = $app ]];then
#       dir='.'
#    fi

#    wdir=${PWD}
#    cd $dir
#    if [ ! -f $app.tar.gz ];then
#       echo tar zcvf $app.tar.gz $app > /dev/stderr
#       tar zcvf $app.tar.gz $app
#    fi
#    cd $wdir
#    echo $standalone.tar.gz
# }

findstandalone(){
   local result=$(ls *-standalone.jar target/*-standalone.jar 2> /dev/null)
   if [ -z "$result" ];then
      echo "$result not found !" > /dev/stderr
      exit
   fi
   if [ ! -f "$result" ];then 
      echo "multi standalone found: $result !" > /dev/stderr
      exit
   fi
   echo $result
}

# putstandalone(){
#     endpoint=$1
#     container=$2
#     working_dir=$3
#     jartar=$4

#     echo curl -X PUT ${endpoint}/containers/${container}/archive?path=$working_dir -H \'Content-Type: application/x-tar\' --data-binary @$jartar > /dev/stderr
#     curl -X PUT ${endpoint}/containers/${container}/archive?path=$working_dir -H 'Content-Type: application/x-tar' --data-binary @$jartar
# }


### start to deploy
deploy_standalone=$(findstandalone)
if [ ! $deploy_standalone ];then
   exit
fi

## stop container first
echo stopping container $deploy_container ..
stopcontainer $ENDPOINT $deploy_container
status=$(getcontainerstatus $ENDPOINT $deploy_container)
if [[ ! $status = 'exited'  ]];then
   echo "fatal: fail to stop $deploy_container: $status !"
   exit
fi
echo stopped: $status !


## build tar
# echo build tar $deploy_standalone.tar.gz ..
# jartar=$(buildtar $deploy_standalone)
 
## put standalone 
echo deploying $deploy_standalone ..
# working_dir=$(workingdir $ENDPOINT $deploy_container 2> /dev/null)
# putstandalone $ENDPOINT $deploy_container $working_dir $jartar
## local deploy
filesystem_workingdir=$(getcontainerworkingdir $ENDPOINT $deploy_container 2> /dev/null)
app=${deploy_standalone#*/}
ls -l $filesystem_workingdir/$app
echo cp $deploy_standalone $filesystem_workingdir
cp $deploy_standalone $filesystem_workingdir
ls -l $filesystem_workingdir/$app

## restart container
echo restarting container $deploy_container ..
restartcontainer $ENDPOINT $deploy_container

status=$(getcontainerstatus $ENDPOINT $deploy_container)
echo restarted: $status ..
