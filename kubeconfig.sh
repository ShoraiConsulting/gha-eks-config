#!/bin/bash

TEMPDIR=$(mktemp -d)

echo $CA >$TEMPDIR/ca.crt

kubectl config set-context \
  --cluster=current \
  --namespace=default \
  --user=gha \
  --certificate-authority=$TEMPDIR/ca.crt \
  --server=$URL \
  --token=$TOKEN \
  --username=$UNAME

echo "K8S_TEMP=$TEMPDIR" >> $GITHUB_ENV