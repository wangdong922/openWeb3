// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Method {
    uint private a;

    // 公共调用
    function methd(uint _a) public pure returns(uint) {
        return _a;
    }

    //函数内部调用
    function methd2(uint _a) private  pure returns(uint) {
        return _a;
    }

    // 函数内部以及子合约中调用
    function methd3(uint _a) internal  pure returns(uint) {
        return _a;
    }

    // 函数外部调用，函数内调用需要用this
    function methd4(uint _a) external  pure returns(uint) {
        return _a;
    }

    function methd5() external  view returns(uint) {
        return a;
    }

    function deposit() external payable {
        // 接收以太币
    }
}