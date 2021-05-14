# Dummy Blockchain

Part of [Dummy-Blockchain project](https://github.com/users/philohsophy/projects/1)

## Table of Contents

1. [Outline](#Outline)
2. [How to run](#How-to-run)
3. [Components](#Components)
    - [Transaction Clients](#Transaction-Clients)
    - [Transaction Pool](#Transaction-Pool)
    - [Miners](#Miners)
    - [Blockchain Supervisor](#Blockchain-Supervisor)
    - [Models](#Models)
4. [Architecture](#Architecture)
    - [Building Block View](#Building-Block-View)
    - [Runtime View](#Runtime-View)
    - [Deployment View](#Deployment-View)

## Outline

This project creates a "dummy"-blockchain scenario utilizing multiple microservices which are orchestrated via Kubernetes.

**It serves as an educational project in order to:**

- dive into [Go](https://golang.org/)
- learn how TDD works with Go
- become familiar with [GitHub](https://github.com/) & [GitHub Actions](https://docs.github.com/en/actions) (the author's a [GitLab](https://gitlab.com)-guy...)
- increase the author's practical experience with [Kubernetes](https://kubernetes.io/)
- understand this [Blockchain](https://en.wikipedia.org/wiki/Blockchain)-thingy inside-out
- evaluate some [CNCF graduated & incubating projects](https://www.cncf.io/projects/) like [Prometheus](https://prometheus.io/), [NATS](https://nats.io/), [Jaeger](https://www.jaegertracing.io/), [Flux](https://fluxcd.io/), ...

**Disclaimer:**
>This project does not claim any correctness regarding topics such as Blockchain, etc.

## How to run

The easiest way tu run this project is via [k3d](https://k3d.io/)

```bash
# Create k3s cluster
./k8s/create_cluster.sh
kubectl config use-context k3d-mycluster

# Start
kubectl apply -k ./k8s/

# Teardown
kubectl delete -k ./k8s/
```

## Components

This Project will consist of the following components:

Component | Repository | Status
:--- | :--- | :---
Transaction Spawner | [philohsophy/transaction-spawner](https://github.com/philohsophy/transaction-spawner) | v0.0.1
Transaction Pool | [philohsophy/transaction-pool](https://github.com/philohsophy/transaction-pool) | v0.1.1
Miners | [philohsophy/dummy-blockchain-miner](https://github.com/philohsophy/dummy-blockchain-miner) | To be implemented
Blockchain Supervisor | [philohsophy/dummy-blockchain-supervisor](https://github.com/philohsophy/dummy-blockchain-supervisor) | To be implemented
Models | [philohsophy/dummy-blockchain-models](https://github.com/philohsophy/dummy-blockchain-models) | v0.1.0-alpha

Additionally the following external services will be used:

Service | Usage | Added?
:--- | :--- | :---
[Grafana](https://grafana.com/) | Visualization of Dummy-Blockchain metrics | Yes
[Prometheus](https://prometheus.io/) | Monitoring of metrics, i.e.:<br /> - amount of transactions waiting to be processed <br /> - min/max/avg processing time for transactions  <br /> - running miner-instances | In Process
[NATS](https://nats.io/) | Async communication between components | No
[fluentd](https://www.fluentd.org/) | Logging | No
[Jaeger](https://www.jaegertracing.io/) | Tracing  | No

### Transaction Spawner(s)

Clients for spawning transactions.

### Transaction Pool

When users create transactions and submit them to the network, they are inserted into a pool. Miners can pick transactions from this pool and include them in a block.

### Miners

Can use different forms of [consensus algorithms](https://www.coindesk.com/short-guide-blockchain-consensus-protocols), like:

- Proof of work
- Proof of stake
- Proof of activity
- ...

### Blockchain Supervisor

- Sets difficulty+Consensus
- Reviews proof-of-work
- Manages Blockchain (inserts new found blocks)
- Provides information about current Block (hash+id)
- Notifies Miners when a new valid Block has been found and accepted

### Models

Repository with shared data models used by all services:

- Transaction
- Block

Also provides convinience functions like schema-validation for each model

## Architecture

### Building Block View

![UML](./architecture/views/building-block-view.jpg)

### Runtime View

![UML](./architecture/views/runtime-view.jpg)

### Deployment View

TODO
