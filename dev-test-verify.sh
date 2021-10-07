#!/usr/bin/env bash
mpdev verify --deployer=gcr.io/gke-istio-test-psb/tsb-operator/deployer:1.3 | tee verify.log
