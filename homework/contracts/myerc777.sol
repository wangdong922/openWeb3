// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import "@openzeppelin/contracts/token/ERC777/IERC777Sender.sol";
import "@openzeppelin/contracts/token/ERC777/IERC777Recipient.sol";

contract MyREC777 is IERC777Sender,IERC777Recipient{
    function tokensToSend( 
        address operator, 
        address from, 
        address to, 
        uint256 amount, 
        bytes calldata userData, 
        bytes calldata operatorData 
    ) 
    external {

    }
    function tokensReceived( 
        address operator, 
        address from, 
        address to, 
        uint256 amount, 
        bytes calldata data, 
        bytes calldata operatorData ) external{

        }
}