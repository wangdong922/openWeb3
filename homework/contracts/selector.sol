// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Selector {
    // 状态变量存储函数选择器
    bytes4 public storedSelector;

    function squre(uint x) external pure returns (uint) {
        return x * x;
    }
    function double(uint x) external pure returns (uint) {
        return 2 * x;
    }

    function getSelectorSqure() external pure returns (bytes4) {
        return this.squre.selector;
    }

    function getSelectorDouble() external pure returns (bytes4) {
        return bytes4(keccak256("double(uint256)"));
    }

    function execte(bytes4 selector, uint x) external returns(uint z) {
        (bool success, bytes memory data) = address(this).call(abi.encodeWithSelector(selector, x));
        require(success,"call filed");
         z = abi.decode(data, (uint));
         return z;
    }

    function storeSelector(bytes4 selector) public {
        storedSelector = selector;
    }
    // 函数：调用存储在 storedSelector 中的函数，并返回结果
    function executeStoredFunction(uint x) public returns(uint){
        require(storedSelector != bytes4(0), "Selector not set");
        (bool success, bytes memory data) = address(this).call(abi.encodeWithSelector(storedSelector, x));
        require(success, "Function call failed");
        return abi.decode(data, (uint));
    }
}