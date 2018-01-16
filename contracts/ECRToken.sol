pragma solidity ^0.4.18;

import './Owned.sol';

contract SafeMath {
  function safeAdd(uint a, uint b) pure internal returns (uint) {
    if (a + b < a) return 0;
    else return a + b;
  }

  function safeSub(uint a, uint b) pure internal returns (uint) {
    if (b > a) return 0;
    else return a - b;
  }
}

contract ECRToken is Owned, SafeMath  {

  string public symbol;
  string public name;
  uint public decimals;

  mapping (address => uint) balances;

  // Triggered when tokens are transferred.
  event LogTransfer(address indexed from, address indexed to, uint value);

  function () public {
     //if ether is sent to this address, send it back.
     revert();
   }

  function ECRToken() public {
    balances[msg.sender] = 10**6;  // Give the creator all initial tokens (100000 for example)
    name = "ECROU";                // Set the name for display purposes
    symbol = "ECR";                // Set the symbol for display purposes
    decimals = 0;                  // Amount of decimals for display purposes
  }

  // Function to access name of token .
  function name() public constant returns (string){
      return name;
  }

 // Function to access symbol of token .
  function symbol() public constant returns (string ){
      return symbol;
  }

  // Function to access decimals of token .
  function decimals() public constant returns (uint) {
    return decimals;
  }

  function balanceOf(address who ) public constant returns (uint) {
    return balances[who];
  }

  //Transfer permitted only for owner here
  function transfer(address to, uint amount) onlyOwner public returns (bool) {
    return xfer(to, amount);
  }

  // Process a transfer internally.
  function xfer(address to, uint amount) internal returns (bool){
    if( balanceOf(msg.sender) < amount ) {
      revert();
    }

    if( safeAdd(balanceOf(to), amount)  == 0 ) {
      revert();
    }

    balances[msg.sender] -= amount;
    balances[to] += amount;

    LogTransfer( msg.sender, to, amount );
    return true;
  }

  // Reduce ECR
  function reduce(address from, uint amount) public returns (bool){
    if( balanceOf(from) < amount ) {
      revert();
    }

    if( safeSub(balanceOf(from), amount)  == 0 ) {
      revert();
    }

    balances[from] -= amount;
    return true;
  }

}
