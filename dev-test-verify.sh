#!/usr/bin/env bash
mpdev verify --deployer=gcr.io/gke-istio-test-psb/tsb-operator/deployer:1.3 --wait_timeout=3600 | tee verify.log
