// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract MagicNum {

  address public solver;

  constructor() public {}

  function setSolver(address _solver) public {
    solver = _solver;
  }

  /*
    ____________/\\\_______/\\\\\\\\\_____        
     __________/\\\\\_____/\\\///////\\\___       
      ________/\\\/\\\____\///______\//\\\__      
       ______/\\\/\/\\\______________/\\\/___     
        ____/\\\/__\/\\\___________/\\\//_____    
         __/\\\\\\\\\\\\\\\\_____/\\\//________   
          _\///////////\\\//____/\\\/___________  
           ___________\/\\\_____/\\\\\\\\\\\\\\\_ 
            ___________\///_____\///////////////__
  */
}

contract MagicNumHack {
    // 0x602a - PUSH1(0x2a)
    // 0x6000 - PUSH1(0x00)
    // 0x52   - MSTORE
    // 0x6020 - PUSH1(0x20)
    // 0x6000 - PUSH1(0x00)
    // 0xf3   - RETURN

    constructor() public {
        assembly {
            mstore(0x00, 0x602a60005260206000f3)
            return(0x16, 0x0a)
        }
    }
}