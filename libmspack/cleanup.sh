#!/bin/sh
topdir=`pwd`
for x in . doc examples mspack src test
do
  cd "$topdir/$x"
  chmod -R a+rwx `cat .gitignore` 2>/dev/null
  rm -vrf `cat .gitignore`
done
