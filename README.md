# Blockchain Demo

![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/philohsophy/blockchain-demo)

## Table of Contents

1. [Outline](#Outline)
2. [How to run](#How-to-run)
3. [Components](#Components)
    - [Transaction Spawners](#Transaction-Spawners)
    - [Transaction Pool](#Transaction-Pool)
    - [Miners](#Miners)
    - [Blockchain Supervisor](#Blockchain-Supervisor)
    - [Models](#Models)
4. [Architecture](#Architecture)
    - [Building Block View](#Building-Block-View)
    - [Runtime View](#Runtime-View)
    - [Deployment View](#Deployment-View)

## Outline

This project creates a blockchain scenario utilizing multiple microservices which are orchestrated via Kubernetes.

**It serves as an educational project in order to:**

- dive into [Go](https://golang.org/)
- learn how TDD works with Go
- become familiar with [GitHub](https://github.com/) & [GitHub Actions](https://docs.github.com/en/actions) (the author's a [GitLab](https://gitlab.com)-guy...)
- increase the author's practical experience with [Kubernetes](https://kubernetes.io/)
- understand [Blockchain](https://en.wikipedia.org/wiki/Blockchain)-mechanisms
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
Transaction Spawner | [philohsophy/transaction-spawner](https://github.com/philohsophy/transaction-spawner) | ![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/philohsophy/transaction-spawner)
Transaction Pool | [philohsophy/transaction-pool](https://github.com/philohsophy/transaction-pool) | ![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/philohsophy/transaction-pool)
Miners | [philohsophy/blockchain-miner](https://github.com/philohsophy/blockchain-miner) | ![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/philohsophy/blockchain-miner)
Blockchain Supervisor | [philohsophy/blockchain-supervisor](https://github.com/philohsophy/blockchain-supervisor) | ![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/philohsophy/blockchain-supervisor)
Models | [philohsophy/blockchain-models](https://github.com/philohsophy/blockchain-models) | ![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/philohsophy/blockchain-models)

Additionally the following external services will be used:

Service | Usage | Added?
:--- | :--- | :---
[Grafana](https://grafana.com/) | Visualization of Blockchain metrics | Yes
[Prometheus](https://prometheus.io/) | Monitoring of metrics, i.e.:<br /> - amount of transactions waiting to be processed <br /> - min/max/avg processing time for transactions  <br /> - running miner-instances | In Process
[NATS](https://nats.io/) | Async communication between components | No
[fluentd](https://www.fluentd.org/) | Logging | No
[Jaeger](https://www.jaegertracing.io/) | Tracing  | No

### Transaction Spawners

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

>Hint: Use dark-mode (Profile → Settings → Appearance → "Default dark" / "Dark dimmed")

### Building Block View

---

![UML](./architecture/views/building-block-view.svg)

### Runtime View

---

![UML](./architecture/views/runtime-view.svg)

### Deployment View

---

TODO
