// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Demo {
    struct Todo {
        string name;
        bool isCompleted;
    }
    Todo[] public list;
    // 创建任务
    function create(string memory _name) external  {
        list.push(Todo({
            name: _name,
            isCompleted: false
        })
        );
    }
    function modiName1(string memory name_,uint256 _index) external {
        list[_index].name = name_;
    }

    function modiName2(string memory name_,uint256 _index) external {
        Todo storage temp = list[_index];
        temp.name = name_;
    }

    // 修改完成状态1:手动指定完成或者未完成
    function modiStatus1(uint256 index_,bool status_) external {
        list[index_].isCompleted = status_;
    }
    // 修改完成状态2:自动切换 toggle
    function modiStatus2(uint256 index_) external {
        list[index_].isCompleted = !list[index_].isCompleted;
    }

    // 获取任务1: memory : 2次拷贝
    function get1(uint256 index_) external view returns(string memory name_,bool status_){
        Todo memory temp = list[index_];
        return (temp.name,temp.isCompleted);
    }

    // 获取任务2: storage : 1次拷贝
    // 预期：get2 的 gas 费用比较低（相对 get1）
    function get2(uint256 index_) external view returns(string memory name_,bool status_){
        Todo storage temp = list[index_];
        return (temp.name,temp.isCompleted);
    }
}