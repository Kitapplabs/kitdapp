pragma solidity ^0.4.18;

contract Owned {

    address public owner;

    function Owned() public {
      owner = msg.sender;
    }

    modifier onlyOwner {
        if (msg.sender != owner) revert();
        _;
    }

    function transferOwnership(address newOwner) onlyOwner public {
        owner = newOwner;
    }

    function kill() onlyOwner public {
        selfdestruct(owner);
  }
}
