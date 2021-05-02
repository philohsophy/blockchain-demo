# Dummy Blockchain

## Table of Contents

1. [Outline](#Outline)
2. [Components](#Components)
    - [Transaction Clients](#Transaction-Clients)
    - [Transaction Pool](#Transaction-Pool)
    - [Miners](#Miners)
    - [Blockchain Supervisor](#Blockchain-Supervisor)
    - [Models](#Models)
3. [Architecture](#Architecture)
    - [Building Block View](#Building-Block-View)
    - [Runtime View](#Runtime-View)
    - [Deployment View](#Deployment-View)

---

## Outline

This project

Disclaimer:
This project

---

## Components

This Project will consist of the following components:

Component | Repository | Status
:--- | :--- | :---
Transaction Clients | [philohsophy/transaction-client](https://github.com/philohsophy/transaction-client) | Not implemented
Transaction Pool | [philohsophy/transaction-pool](https://github.com/philohsophy/transaction-pool) | v0.1.0
Miners | [philohsophy/dummy-blockchain-miner](https://github.com/philohsophy/dummy-blockchain-miner) | Not implemented
Blockchain Supervisor | [philohsophy/dummy-blockchain-supervisor](https://github.com/philohsophy/dummy-blockchain-supervisor) | Not implemented
Models | [philohsophy/dummy-blockchain-models](https://github.com/philohsophy/dummy-blockchain-models) | In progress

### Transaction Clients

Clients generate transactions.

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

---

## Architecture

### Building Block View

![UML](./architecture/views/building-block-view.jpg)

### Runtime View

![UML](./architecture/views/runtime-view.jpg)

### Deployment View

TODO
