// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataSharing {
    struct ResearchData {
        string dataHash;
        address owner;
        bool shared;
        uint256 timestamp;
    }

   
    mapping(string => ResearchData) private dataRegistry;

    event DataRegistered(string dataHash, address owner);
    event DataShared(string dataHash, address owner);

    function registerData(string memory _dataHash) public {
        require(bytes(_dataHash).length > 0, "Data hash is required");
        require(dataRegistry[_dataHash].owner == address(0), "Data already registered");

        dataRegistry[_dataHash] = ResearchData({
            dataHash: _dataHash,
            owner: msg.sender,
            shared: false,
            timestamp: block.timestamp
        });

        emit DataRegistered(_dataHash, msg.sender);
    }

    function shareData(string memory _dataHash) public {
        require(dataRegistry[_dataHash].owner == msg.sender, "Only the owner can share data");

        dataRegistry[_dataHash].shared = true;

        emit DataShared(_dataHash, msg.sender);
    }

    function getData(string memory _dataHash) public view returns(ResearchData memory)
    {
        return dataRegistry[_dataHash];
    }
}

