// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Mytoken is ERC20{
    event Deposit(address indexed dst, uint wad); 
    event Withdrawal(address indexed src, uint wad); 


    constructor() ERC20("My Token", "MT")  {
        _mint(msg.sender, 1000000000 * 10 ** 4);
    }

    function totalSupply() public view override returns (uint) { 
        return address(this).balance; 
    }

    receive() external  payable { 
        this.deposit();
    }

    function deposit() external payable { 
        _mint(msg.sender, msg.value); 
        emit Deposit(msg.sender, msg.value); 
    } 
    function withdraw(uint wad) external payable{ 
        _burn(msg.sender, wad);
        transfer(msg.sender,wad);
        emit Withdrawal(msg.sender, wad); 
    }

    function decimals() public view virtual override returns (uint8) {
        return 4;
    }
}
