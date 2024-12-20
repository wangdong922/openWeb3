// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract MultiStageTimeLock {
    uint public stage1UnlockTime;
    uint public stage2UnlockTime;
    address public owner;

    constructor(uint _stage1Lock, uint _stage2Lock) {
        owner = msg.sender;
        stage1UnlockTime = block.timestamp + _stage1Lock * 1 days;
        stage2UnlockTime = block.timestamp + _stage2Lock * 1 days;
    }

    function withdrawStage1() public view{
        require(block.timestamp >= stage1UnlockTime, "Stage 1 funds are locked");
        require(msg.sender == owner, "Only owner can withdraw");
    }
    function withdrawStage2() public view{
        require(block.timestamp >= stage2UnlockTime, "Stage 2 funds are locked");
        require(msg.sender == owner, "Only owner can withdraw");
    }
}