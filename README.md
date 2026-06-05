# Crowdfunding Smart Contract

## Overview

This project is a decentralized crowdfunding platform built with Solidity and Foundry.

Users can create fundraising campaigns, contribute ETH to campaigns, withdraw funds when funding goals are achieved, and receive refunds if campaigns fail to meet their goals before the deadline.

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

## Author

Group Crowdfunding Project
