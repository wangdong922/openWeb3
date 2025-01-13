// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

contract Owner {
    struct Identity {
        address addr;
        string name;
    }
    enum State {
        HasOwner,
        NoOwner
    }

    event ownerSet(address indexed oldOwnerAddr, address indexed newOwnerAddr);
    event ownerRemoved(address indexed oldOwnerAddr);

    modifier isOwner() {
        require(msg.sender == owner.addr, "Caller is not owner");
        _;
    }

    Identity private owner;
    State private state;

    constructor (string memory name) {
        owner.addr = msg.sender;
        owner.name = name;
        state = State.HasOwner;
        emit ownerSet(address(0), owner.addr);
    }

    function changeOwner(address addr, string calldata name) public isOwner {
        owner.addr = addr;
        owner.name = name;
        emit ownerSet(owner.addr, addr);
    }

    function removeOwner() public isOwner {
        emit ownerRemoved(owner.addr);
        delete owner;
        state = State.NoOwner;
    }

    function getOwner() external view returns (address, string memory) {
        return (owner.addr, owner.name);
    }
    function getState() external view returns (State) {
        return state;
    }
}