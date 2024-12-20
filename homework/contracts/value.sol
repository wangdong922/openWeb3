// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;


contract Value {
    function add(uint x, uint y) public pure returns (uint z) {
        z = x + y;
    }
    function divide(uint x, uint y) public pure returns (uint z) {
        z = x / y;
    }
    function muilty(uint x, uint y) public pure returns (uint z) {
        z = x * y;
    }
    function jian(uint x, uint y) public pure returns (uint z) {
        z = x - y;
    }
    
}