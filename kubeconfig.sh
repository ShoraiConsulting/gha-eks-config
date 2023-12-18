#!/bin/bash

TEMPDIR=$(mktemp -d)

echo $INPUTS_CA >$TEMPDIR/ca.crt

kubectl config set-context \
  --cluster=current \
  --namespace=default \
  --user=gha \
  --certificate-authority=$TEMPDIR/ca.crt \
  --server=$INPUTS_SERVER \
  --token=$INPUTS_TOKEN \
  --username=$INPUTS_USER

echo "K8S_TEMP=$TEMPDIR" >> $GITHUB_ENV