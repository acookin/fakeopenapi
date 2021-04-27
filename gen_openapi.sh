#!/bin/bash
set -e
COUNT=5

if [[ -n "${1}" ]] ; then
    COUNT=${1}
fi

X=0

while [ "$X" -lt $COUNT ] ; do
    path=`randword`
    name=`randword`
    helm template --set prefix=${path} --set name=${name} ./chart | kubectl apply -f -
    let "X = X + 1"
done
