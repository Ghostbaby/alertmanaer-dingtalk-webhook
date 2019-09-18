#!/bin/bash

alerts1='{
    "receiver": "admins",
    "status": "firing",
    "alerts": [
        {
            "status": "firing",
            "labels": {
                "alertname": "something_happend",
                "env": "prod",
                "instance": "server01.int:9100",
                "job": "node",
                "service": "prometheus_bot",
                "severity": "warning",
                "supervisor": "runit"
            },
            "annotations": {
                "summary": "Oops, something happend!",
                "description": "Oops, something happend!",
                "runbook_url": "https://github.com/kubernetes-monitoring/kubernetes-mixin/tree/master/runbook.md#alert-name-kubepodcrashlooping"
            },
            "startsAt": "2019-05-31T02:46:37.903Z",
            "endsAt": "0001-01-01T00:00:00Z",
            "generatorURL": "https://example.com/graph#..."
        }
    ],
    "groupLabels": {
        "alertname": "something_happend",
        "instance": "server01.int:9100"
    },
    "commonLabels": {
        "alertname": "something_happend",
        "env": "prod",
        "instance": "server01.int:9100",
        "job": "node",
        "service": "prometheus_bot",
        "severity": "warning",
        "supervisor": "runit"
    },
    "commonAnnotations": {
        "summary": "runit service prometheus_bot restarted, server01.int:9100"
    },
    "externalURL": "https://alert-manager.example.com",
    "version": "3"
}'

curl -XPOST -d"$alerts1" http://localhost:8080/webhook
