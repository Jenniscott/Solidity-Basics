// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorage {
    uint256 public storedNumber;
    address public owner;

    constructor () {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Access denied!");
        _;
    }

    function storeNumber(uint256 _number) public onlyOwner {
        storedNumber = _number;
    }

    function retrieveNumber() public view returns (uint256) {
        return storedNumber;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        require(_newOwner != address(0), "Address cannot be zero");
        owner = _newOwner;
    }

}