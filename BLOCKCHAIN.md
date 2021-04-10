# Blockchain Architecture

This document collects & describes general components and features of a Blockchain architecture

## Refs

- https://www.pluralsight.com/guides/blockchain-architecture
- https://mlsdev.com/blog/156-how-to-build-your-own-blockchain-architecture

## Components

### General Blockchain Components

Component | Purpose / Description | Notes
:--- | :--- | :---
| Transaction | Smallest building block of a blockchain. | Generally consists of a:<ul><li>recipent address</li><li>sender address</li><li>value</li> |
| Block | Data structures that bundle sets of transactions. </br> Distributed to all nodes in the network. </br>Blocks are created by Miners | Consists of: <ul><li>version - the current version of the block structure</li><li>previous block header hash - the reference this block's parent block</li><li>merkle root hash - a cryptographic hash of all of the transactions included in this block</li><li>time - the time that this block was created</li><li>nBits - the current difficulty that was used to create this block</li><li>nonce ("number used once") - a random value that the creator of a block is allowed to manipulate however they so choose</li></ul>|
| Miner |||
| Node |||
| Consensus |||
| --- | --- | --- |
