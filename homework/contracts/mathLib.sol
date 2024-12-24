// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

library MathLib {
    function add(uint a, uint b) external pure returns(uint) {
        return a + b;
    }
    function jian(uint a, uint b) external pure returns(uint) {
        return a - b;
    }
    function mult(uint a, uint b) external pure returns(uint) {
        return a * b;
    }
    function divi(uint a, uint b) external pure returns(uint) {
        return a / b;
    }
}