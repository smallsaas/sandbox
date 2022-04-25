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

## workding_dir within container /webapps
workingdir_nginx(){
   endpoint=$1
   container=$2

   # echo "curl -s $endpoint/containers/$container/json | jq '.HostConfig.Binds[] | match(\"([a-z/]+):[a-z/]*/webapps[a-z/]*\").string'"
   # local binds=$(curl -s $endpoint/containers/$container/json | jq '.HostConfig.Binds[] | match("([a-z/]+):[a-z/]*/webapps[a-z/]*").string')
   echo curl $SOCK_OPT -s $endpoint/containers/$container/json > /dev/stderr
   local binds=$(curl $SOCK_OPT -s $endpoint/containers/$container/json | jq '.HostConfig.Binds[] | match("[a-z/]*/usr/share/nginx/html:rw").string')
   for bind in $binds;do
      bind=${bind%\"}
      bind=${bind#\"}
      bind=${bind%:rw}
      echo $bind
   done
}

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

## working dir from filesystem
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

puttartocontainer(){
   endpoint=$1
   container=$2
   working_dir=$3
   tarbin=$4

   echo curl $SOCK_OPT -X PUT ${endpoint}/containers/${container}/archive?path=$working_dir -H \'Content-Type: application/x-tar\' --data-binary @$tarbin > /dev/stderr
   curl $SOCK_OPT -X PUT ${endpoint}/containers/${container}/archive?path=$working_dir -H 'Content-Type: application/x-tar' --data-binary @$tarbin
   rm -f $tarbin
}

buildtar(){
   targetpath=$1

   local dir=${targetpath%\/*}
   local target=${targetpath##*\/}
   if [[ $dir = $target ]];then
      dir='.'
   fi

   wdir=${PWD}
   cd $dir
   if [ ! -f $target.tar.gz ];then
      echo tar zcvf $target.tar.gz $target > /dev/stderr
      tar zcvf $target.tar.gz $target > /dev/null
   fi
   cd $wdir
   echo $targetpath.tar.gz
}


### start to deploy
if [ ! -d dist ];then 
   echo no dist to deploy !
   exit
fi

## stop container first
status=$(getcontainerstatus $ENDPOINT $deploy_container)
if [[ $status = running ]];then
   echo stopping container $deploy_container ..
   stopcontainer $ENDPOINT $deploy_container
   status=$(getcontainerstatus $ENDPOINT $deploy_container)
   if [[ ! $status = 'exited'  ]];then
      echo "fatal: fail to stop $deploy_container: $status !"
      exit
   fi
fi
echo stopped: $status !


## build tar
if [ -f dist.tar.gz ];then
   rm -f dist.tar.gz
fi
echo build tar dist.tar.gz ..
disttar=$(buildtar dist)


##method 1# put standalone 
echo deploying dist.tar.gz ..
working_dir=$(workingdir_nginx $ENDPOINT $deploy_container 2> /dev/null)
echo puttartocontainer $ENDPOINT $deploy_container $working_dir $disttar
puttartocontainer $ENDPOINT $deploy_container $working_dir $disttar


##method 2 filesystem working dir
fswdir=$(getcontainerworkingdir $ENDPOINT $deploy_container)
echo fswdir=$fswdir


# app=${deploy_standalone#*/}
# ls -l $working_dir/$app
# echo cp $deploy_standalone $working_dir
# cp $deploy_standalone $working_dir
# ls -l $working_dir/$app

## restart container
echo restarting container $deploy_container ..
restartcontainer $ENDPOINT $deploy_container

status=$(getcontainerstatus $ENDPOINT $deploy_container)
echo restarted: $status ..
