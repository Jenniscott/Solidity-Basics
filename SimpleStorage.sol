// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorage {
    uint256 public storedNumber;
    address public owner;


    event NumberStored(address indexed user, uint256 number);
    event OwnershipTransferred(address indexed oldOwner, address indexed newOwner);

    constructor () {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Access denied!");
        _;
    }

    function storeNumber(uint256 _number) public onlyOwner {
        storedNumber = _number;

        emit NumberStored(msg.sender, _number);
    }

    function retrieveNumber() public view returns (uint256) {
        return storedNumber;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        require(_newOwner != address(0), "Address cannot be zero");
        address oldOwner = owner;
        owner = _newOwner;

        emit OwnershipTransferred(oldOwner, _newOwner);
    }

}