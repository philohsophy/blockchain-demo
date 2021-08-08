#!/bin/sh

CLUSTERNAME=mycluster

k3d cluster create "${CLUSTERNAME}" \
--api-port 127.0.0.1:6550 \
-p 80:80@loadbalancer \
-p 443:443@loadbalancer \
-p 3000:3000@loadbalancer \
-p 9090:9090@loadbalancer \
--k3s-server-arg "--no-deploy=traefik" \
--k3s-server-arg "--flannel-backend=vxlan" \
--agents 2 --servers 1