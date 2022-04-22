#!/bin/sh

syncbackrepo(){
   repo=$1
   repo=${repo%.git}
   branch=$2
   if [ ! $branch ];then 
      branch=master
    fi

   cd src
   cd $repo
   git remote -v

   echo git pull gitee $branch 
   git pull gitee $branch
   if [ $? != 0 ];then 
      echo git pull gitee $branch ! > /dev/stderr
      exit -1
   fi
   echo git push origin $branch 
   git push origin $branch
   if [ $? != 0 ];then 
      echo git push origin $branch failure ! > /dev/stderr
      exit -1
   fi

   cd ../..
}

repo=$1
branch=$2
if [ ! $repo ];then 
  ls src
  exit
fi

syncbackrepo $repo $branch
