// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

contract HelloWorld {
    string public message;
    address public lastUpdater;


    event MessageUpdated(address indexed lastUpdater, string newMessage);
   
    constructor() {
        message = "Hello, World!";
        lastUpdater = msg.sender;
    }

    function updateMessage(string memory _newMessage) public {
        require(keccak256(abi.encodePacked(message)) != keccak256(abi.encodePacked(_newMessage)), "New message cannot be the same as the current message");
        message = _newMessage; 
        lastUpdater = msg.sender;
        emit MessageUpdated(msg.sender, _newMessage);
    }
}