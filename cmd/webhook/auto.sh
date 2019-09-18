#!/bin/bash

GOOS=linux GOARCH=amd64 go build -o webhook

docker build -t harbor.ymmoa.com/monitoring/alertmanager-dingtalk-webhook:0.3.0 .
docker push harbor.ymmoa.com/monitoring/alertmanager-dingtalk-webhook:0.3.0
kubectl delete -f ./contrib/pwd-deployment.yaml
kubectl create -f ./contrib/pwd-deployment.yaml
