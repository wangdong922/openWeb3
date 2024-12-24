// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import "./mathLib.sol";
// library MathLib {
//     function add(uint a, uint b) internal pure returns(uint) {
//         return a + b;
//     }
//     function jian(uint a, uint b) internal pure returns(uint) {
//         return a - b;
//     }
//     function mult(uint a, uint b) internal pure returns(uint) {
//         return a * b;
//     }
//     function divi(uint a, uint b) internal pure returns(uint) {
//         return a / b;
//     }
// }

contract CalcTest {
    function add(uint a, uint b) public pure returns(uint) {
        return MathLib.add(a, b);
    }
}