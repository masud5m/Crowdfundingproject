// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/Crowdfunding.sol";

contract CrowdfundingTest is Test {
    Crowdfunding crowdfunding;

    address creator = address(100);
    address contributor = address(200);

    function setUp() public {
        crowdfunding = new Crowdfunding();

        vm.deal(creator, 10 ether);
        vm.deal(contributor, 10 ether);
    }

    function testCreateCampaign() public {
        vm.prank(creator);

        crowdfunding.createCampaign(
            "School Project",
            5 ether,
            7 days
        );

        assertEq(crowdfunding.campaignCount(), 1);
    }

    function testContribute() public {
        vm.prank(creator);

        crowdfunding.createCampaign(
            "School Project",
            5 ether,
            7 days
        );

        vm.prank(contributor);

        crowdfunding.contribute{value: 1 ether}(1);

        (
            ,
            ,
            ,
            ,
            uint256 amountRaised,
            
        ) = crowdfunding.campaigns(1);

        assertEq(amountRaised, 1 ether);
    }

    function testWithdrawFunds() public {
        vm.prank(creator);

        crowdfunding.createCampaign(
            "School Project",
            5 ether,
            7 days
        );

        vm.prank(contributor);

        crowdfunding.contribute{value: 5 ether}(1);

        uint256 balanceBefore = creator.balance;

        vm.prank(creator);

        crowdfunding.withdrawFunds(1);

        uint256 balanceAfter = creator.balance;

        assertEq(
            balanceAfter,
            balanceBefore + 5 ether
        );
    }
   function testRefund() public {
    vm.prank(creator);

    crowdfunding.createCampaign(
        "School Project",
        5 ether,
        7 days
    );

    vm.prank(contributor);

    crowdfunding.contribute{value: 1 ether}(1);

    uint256 balanceBefore = contributor.balance;

    // Move blockchain time forward
    vm.warp(block.timestamp + 8 days);

    vm.prank(contributor);

    crowdfunding.refund(1);

    uint256 balanceAfter = contributor.balance;

    assertEq(
        balanceAfter,
        balanceBefore + 1 ether
    );
}
}
