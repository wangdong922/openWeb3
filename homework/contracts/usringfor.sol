// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

library Search {
    function indexOf(uint[] storage self, uint value) public view returns(uint) {
        for(uint i = 0; i < self.length; i++) {
            if (self[i] == value) {
                return i;
            }
        }
        return uint(0);
    }
}

contract C {
    using Search for uint[];
    uint[] data;

    function append(uint value) public {
        data.push(value);
    }

    function replace(uint _old, uint _new) public {
        uint index = data.indexOf(_old);
        if (index == 0) {
            data.push(_new);
        } else {
            data[index] = _new;
        }
    }
}