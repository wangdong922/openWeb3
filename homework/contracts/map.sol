// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Map {
    mapping(address => uint) public points;
    address[] public users;

    function addUser(address _user) public {
        require(points[_user] == 0, "User already exists");
        users.push(_user);
        points[_user] = 100;// 初始化用户积分为100
    }

    function transferPoints(address _to, uint _amount) public {
        require(points[msg.sender] >= _amount, "Insufficient points.");
        points[msg.sender] -= _amount;
        points[_to] += _amount;
    }
    function getUsers() public view returns(address[] memory) {
        return users;
    }
}