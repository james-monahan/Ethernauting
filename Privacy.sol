//determine memory slot for array indexed at 2
//await web3.eth.getStorageAt(instance, 5) data in 5th slot (last piece of used storage)

//helper function to get bytes16 from data
pragma solidity ^0.6.0;
contract GetBytes {
  function get_bytes(bytes32 _answer) public returns(bytes16) {
      bytes16 answer = bytes16(_answer);
      return answer;
  }
  
  //use returned value
  //await contract.unlock('0xc49f8a07fc64243e34cbd218eb28d3f3')
