#!/usr/bin/bash
port=8080
jar_opt=$9
jar_target=$9
profiles_opt=$9
for opt in $@;do
  if [[ $opt = --server.port=* ]];then 
     port=${$opt#--server.port}
  elif [[ $opt = --spring.profiles.active=* ]];then 
     profiles_opt=$opt
  elif [[ $opt = -jar ]];then
     jar_opt=$opt
  elif [ $jar_opt ];then   
     jar_target=$opt
     unset jar_opt
  fi
done

# pare jar location and jar bin
parsejarvolume(){
   local jar_path=$1
   local jar_root
   if [ ! $jar_path ];then 
      return
   fi
   ## always to /
   if [[ ! $jar_path = /* ]];then
      jar_path="${PWD}/$jar_path"
   fi

   ## get jar_root
   jar_root=${jar_path%/*}

   ## build -v 
   if [ $jar_path ];then 
      jar_line="-v $jar_root:$jar_root -v $jar_path:$jar_path"
   fi

   echo $jar_line
}


# getimage() {
   image=adoptopenjdk:11-jre-hotspot
   if [ $(uname -m) = armv7l ];then 
      image=adoptopenjdk:hotspot-focal
   fi
   if [ $(docker image ls adoptopenjdk:11-jdk-hotspot --format='{{.ID}}' 2> /dev/null) ];then 
      image=adoptopenjdk:11-jdk-hotspot
   fi
#    echo $image
# }
if [ $port ];then 
   port_line="-p $port:8080"
fi
jar_line=$(parsejarvolume $jar_target)

# echo docker run --rm $port_line $jar_line $image java $@
docker run --rm \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/timezone:/etc/timezone:ro \
$port_line $jar_line \
$image java $@
