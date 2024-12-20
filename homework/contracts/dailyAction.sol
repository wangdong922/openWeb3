// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract DailyAction {
    uint public lastActionTime;
    address public owner;
    

    constructor() {
        owner = msg.sender;
        lastActionTime  = block.timestamp - 1 days;
    }

    function performAction() public {
        require(msg.sender == owner, "Only owner can perform this action.");
        require(block.timestamp >= lastActionTime + 1 days, "You can only perform this action once per day.");
        lastActionTime = block.timestamp;
    }
}