k3d cluster create mycluster \
--api-port 127.0.0.1:6550 \
-p 80:80@loadbalancer \
-p 443:443@loadbalancer \
-p 3000:3000@loadbalancer \
-p 9090:9090@loadbalancer \
--k3s-server-arg "--no-deploy=traefik" \
--agents 2 --servers 1