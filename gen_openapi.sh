#!/bin/bash
set -e

X=0

while [ "$X" -lt 3 ] ; do
    path=`randword`
    name=`randword`
    helm template --set prefix=${path} --set name=${name} ./chart | kubectl apply -f -
    let "X = X + 1"
done
