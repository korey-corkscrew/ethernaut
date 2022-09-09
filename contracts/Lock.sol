pragma solidity ^0.8.0;

// The goal of this challenge is to be able to sign offchain a message
// with an address stored in winners.
interface IChallenge{
    function exploit_me(address winner) external;
    function lock_me() external;
}

contract Challenge {
    IChallenge challenge = IChallenge(0xcD7AB80Da7C893f86fA8deDDf862b74D94f4478E);

    function add(address user) external {
        challenge.exploit_me(user);
    }

    fallback() external {
        challenge.lock_me();
    }
}