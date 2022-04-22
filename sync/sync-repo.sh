#!/bin/sh
# echo "git clone ssh://git@git.f.smallsaas.cn:7022/home/git/apps/nft-web.git"

syncrepo(){
   repo=$1
   repo=${repo%.git}
   remote=$2
   branch=$3
   if [ ! $remote ];then 
      remote=gitee
   fi
   if [ ! $branch ];then 
      branch=master
   fi

   cd src
   cd $repo
   git remote -v

   echo git pull origin $branch 
   git pull origin $branch
   if [ $? != 0 ];then 
      echo git pull origin $branch failure ! > /dev/stderr
      exit -1
   fi
   echo git push $remote $branch 
   git push $remote $branch
   if [ $? != 0 ];then 
      echo git push $remote $branch failure ! > /dev/stderr
      exit -1
   fi

   cd ../..
}

repo=$1
remote=$2
branch=$3
if [ ! $repo ];then 
  ls src
  echo 'usage: sync-repo.sh <repo> <remote> <branch>'
  exit
fi

echo 'usage: sync-repo.sh <repo> <remote> <branch>'
echo '  e.g. sync-repo.sh nft sandbox master'
echo "sync-repo.sh $repo $remote $branch"
syncrepo $repo $remote $branch

echo ""
#echo "git clone ssh://git@git.f.smallsaas.cn:7022/home/git/apps/$repo.git"
#echo "git clone ssh://git@git.f.smallsaas.cn:7207/home/git/<apps>/$repo.git"
#echo "git clone git@gitee.com:smallsaas/$repo.git"

