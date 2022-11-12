#!/bin/sh

if [ ! -d m2 ];then
  mkdir m2
fi

cd m2
curl -sO https://gitee.com/smallsaas/sandbox/raw/master/tag/m2/settings.xml
