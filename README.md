# Crowdfunding Smart Contract

A decentralized crowdfunding platform built with Solidity and Foundry on Ethereum.

This project enables users to create fundraising campaigns, contribute ETH, withdraw funds when funding goals are achieved, and receive refunds when campaigns fail to meet their targets before the deadline.

The smart contract demonstrates core blockchain concepts including fund management, access control, campaign lifecycle management, event logging, and automated testing.

## Live Deployment

Network: Sepolia Testnet

Contract Address:
`0x5B227075c80cd8548da539557588e5a3f45c8449`

## Key Features

* Create fundraising campaigns
* Set funding goals and campaign durations
* Accept ETH contributions from supporters
* Allow creators to withdraw successfully raised funds
* Enable contributor refunds for unsuccessful campaigns
* Event logging for all major contract activities
* Automated testing using Foundry

## Why This Project Matters

Crowdfunding platforms traditionally rely on centralized intermediaries to manage funds and campaign outcomes.

This project demonstrates how fundraising campaigns can be managed transparently through smart contracts, allowing contributors and campaign creators to interact with predictable and verifiable rules on the Ethereum blockchain.


## Features

* Create crowdfunding campaigns
* Set funding goals
* Set campaign duration
* Contribute ETH to campaigns
* Withdraw funds after successful funding
* Refund contributors when funding goals are not met
* Event logging for all major actions

## Smart Contract Functions

### createCampaign()

Creates a new crowdfunding campaign.

### contribute()

Allows users to contribute ETH to a campaign.

### withdrawFunds()

Allows campaign creators to withdraw funds after the funding goal has been reached.

### refund()

Allows contributors to reclaim their funds if the campaign fails.

## Events

* CampaignCreated
* ContributionMade
* FundsWithdrawn
* RefundIssued

## Testing

Run all tests:

forge test -vv

Current test coverage:

* Campaign Creation
* Contribution
* Withdrawal
* Refund

## Deployment

Start a local blockchain:

anvil

Deploy contract:

forge script script/DeployCrowdfunding.s.sol:DeployCrowdfunding --rpc-url http://127.0.0.1:8545 --broadcast --private-key <PRIVATE_KEY>

## Technologies Used

* Solidity
* Foundry
* Anvil


## Contributors

Built as a collaborative blockchain development project using Solidity and Foundry.
