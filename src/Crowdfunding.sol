// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Crowdfunding {

    struct Campaign {
        address creator;
        string title;
        uint256 goal;
        uint256 deadline;
        uint256 amountRaised;
        bool withdrawn;
    }

    uint256 public campaignCount;

    mapping(uint256 => Campaign) public campaigns;

    mapping(uint256 => mapping(address => uint256)) public contributions;

    event CampaignCreated(
        uint256 indexed campaignId,
        address indexed creator,
        string title,
        uint256 goal,
        uint256 deadline
    );

     event ContributionMade(
    uint256 indexed campaignId,
    address indexed contributor,
    uint256 amount
);
    event FundsWithdrawn(
    uint256 indexed campaignId,
    address indexed creator,
    uint256 amount
);
    event RefundIssued(
    uint256 indexed campaignId,
    address indexed contributor,
    uint256 amount
);

    function createCampaign(
        string memory _title,
        uint256 _goal,
        uint256 _duration
    ) public {

        require(_goal > 0, "Goal must be greater than zero");
        require(_duration > 0, "Duration must be greater than zero");

        campaignCount++;

        campaigns[campaignCount] = Campaign({
            creator: msg.sender,
            title: _title,
            goal: _goal,
            deadline: block.timestamp + _duration,
            amountRaised: 0,
            withdrawn: false
        });

        emit CampaignCreated(
            campaignCount,
            msg.sender,
            _title,
            _goal,
            block.timestamp + _duration
        );
    }
     function contribute(uint256 _campaignId) public payable {

    Campaign storage campaign = campaigns[_campaignId];

    require(_campaignId > 0 && _campaignId <= campaignCount,
        "Campaign does not exist");

    require(block.timestamp < campaign.deadline,
        "Campaign has ended");

    require(msg.value > 0,
        "Must send ETH");

    campaign.amountRaised += msg.value;

    contributions[_campaignId][msg.sender] += msg.value;

    emit ContributionMade(
        _campaignId,
        msg.sender,
        msg.value
    );
}
   function withdrawFunds(uint256 _campaignId) public {

    Campaign storage campaign = campaigns[_campaignId];

    require(msg.sender == campaign.creator,
        "Not campaign creator");

    require(campaign.amountRaised >= campaign.goal,
        "Goal not reached");

    require(!campaign.withdrawn,
        "Funds already withdrawn");

    campaign.withdrawn = true;

    payable(campaign.creator).transfer(
        campaign.amountRaised
    );

    emit FundsWithdrawn(
        _campaignId,
        campaign.creator,
        campaign.amountRaised
    );
}

function refund(uint256 _campaignId) public {

    Campaign storage campaign = campaigns[_campaignId];

    require(block.timestamp > campaign.deadline,
        "Campaign still active");

    require(campaign.amountRaised < campaign.goal,
        "Campaign succeeded");

    uint256 amount =
        contributions[_campaignId][msg.sender];

    require(amount > 0,
        "No contribution found");

    contributions[_campaignId][msg.sender] = 0;

    payable(msg.sender).transfer(amount);

    emit RefundIssued(
        _campaignId,
        msg.sender,
        amount
    );
}
}
