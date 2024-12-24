// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Car {
    uint public speed;
    function drive() virtual  public {

    }

}

contract ElectricCar is Car{
    uint public batteryLevel;
    function drive() public override {
        
    }
}

contract Person {
    function foo() virtual public {}
}

contract Employee {

}

contract Manager is Person,Employee {
    function foo() public override {}
}

abstract contract Shape {
    function area() virtual public;
}

contract Square is Shape {
    function area() public override {}
}

contract Circle is Shape {
    function area() public override {}
}