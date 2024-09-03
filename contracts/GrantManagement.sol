//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./DataSharing.sol";

contract GrantManagement{
    struct Grant {
        string grantName;
        uint256 amount;
        address researcher;
        bool approved;
    }

    mapping(uint256 => Grant) public grants;
    uint256 public grantCount;

    DataSharing public dataSharing;

    event GrantApplied(uint256 grantId, string grantName, address researcher);
    event GrantApproved(uint256 grantId, address researcher);

    constructor(address _dataSharingAddress){
        dataSharing = DataSharing(_dataSharingAddress);
    }

    function applyForGrant(string memory _grantName, uint256 _amount,string memory _dataHash) public {
        require(bytes(_grantName).length > 0, "Grant Name is Reqiured");
        require(_amount > 0, "Grant Amount Must Be Grater Than Zero");

        DataSharing.ResearchData memory data = dataSharing.getData(_dataHash);
        require(data.owner == msg.sender, "Must own data to apply for grant");

        grants[grantCount] = Grant({
            grantName : _grantName,
            amount: _amount,
            researcher : msg.sender,
            approved: false
        });
        
        emit GrantApplied(grantCount, _grantName, msg.sender);
        grantCount++;
    }

    function approveGrant(uint256 _grantId) public {
        Grant storage grant = grants[_grantId];
        require(grant.researcher != address(0), "Grant does not exist");

        grant.approved = true;
        emit GrantApproved(_grantId, grant.researcher);
    }

}

