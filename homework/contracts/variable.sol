// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;


contract Variable {

    uint storageData;
    constructor() {
        storageData = 10;
    }

    function getResult() public pure returns(uint) {
        uint a = 1;
        uint c = 2;
        return a + c;
    }

}