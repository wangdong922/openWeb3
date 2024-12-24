// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

interface IVault {
    function save(uint value) external;
    function withDraw(uint value) external;
}

contract Bank is IVault{
    address public owner;
    mapping(address => uint) public balances;
    constructor() {
        owner = msg.sender;
        balances[msg.sender] = 10;
    }
    function save(uint value) external{
        require(msg.sender == owner, "Only owner can save this action.");
        balances[msg.sender] += value;
    }

    function withDraw(uint value) external{
        require(msg.sender == owner, "Only owner can withDraw this action.");
        require(balances[msg.sender] >= value, "Insufficient balance.");
        balances[msg.sender] -= value;
    }
}

interface IToken  {
    function transfer(address recipient, uint256 amount) external;
}

// 实现接口的合约
contract Reward is IToken {
    mapping(address => uint256) public balances;
    constructor() {
        balances[msg.sender] = 1000;  // 初始化代币余额
    }
    // 实现接口中的 transfer 函数
    function transfer(address recipient, uint256 amount) public override {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
    }
}

contract MyToken {
    IToken immutable token;
    constructor(IToken _token) {
        token = _token;
    }

    // 调用 SimpleToken 合约的 transfer 函数来发送奖励
    function sendBonus(address user) public {
        token.transfer(user, 100);  // 向用户发送100个代币作为奖励
    }
}

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

contract MyERC20 is IERC20 {

    function totalSupply() external view returns (uint256){}
    function balanceOf(address account) external view returns (uint256){}
    function transfer(address recipient, uint256 amount) external returns (bool){}
    function allowance(address owner, address spender) external view returns (uint256){}
    function approve(address spender, uint256 amount) external returns (bool){}
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool){}
}