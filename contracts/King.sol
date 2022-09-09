pragma solidity ^0.8.0;

contract King {
    constructor() payable {
        require(msg.value > 0);
        (bool succ, ) = payable(0x27ebb035d0BeeabB93e4415A5a0591918a80EFE3).call{value: address(this).balance}("");
        require(succ);
    }
}