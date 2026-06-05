// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/Crowdfunding.sol";

contract DeployCrowdfunding is Script {
    function run() external returns (Crowdfunding) {
        vm.startBroadcast();

        Crowdfunding crowdfunding = new Crowdfunding();

        vm.stopBroadcast();

        return crowdfunding;
    }
}
