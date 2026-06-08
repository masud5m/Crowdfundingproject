// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RewardToken is ERC20 {
    address public crowdfunding;

    constructor() ERC20("Crowdfunding Reward", "CFR") {
        crowdfunding = msg.sender;
    }

    function mint(address to, uint256 amount) external {
        require(msg.sender == crowdfunding, "Not authorized");
        _mint(to, amount);
    }
}
