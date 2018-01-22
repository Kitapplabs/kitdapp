pragma solidity ^0.4.18;

import './Owned.sol';
import './ECRToken.sol';
import './Utils.sol';

contract User{}

contract LABankdapp is Utils, Owned, ECRToken{
    /* Define variable greeting of the type bytes32 */
    bytes32 greeting;
    address[] private users;
    mapping(address => bytes32[]) private mapSkills;

    function () public {
        revert(); // throw reverts state to before call
    }

    function LABankdapp() public{
        greeting = stringToBytes32("HELLO WORLD");
    }

    function setGreeter(bytes32 _greeting) public {
        greeting = _greeting;
    }

	function getSender() public constant returns(address){
        return msg.sender;
    }

    function greet() public constant returns(bytes32) {
        return greeting;
    }

    function getUser(uint index) public constant returns(address){
        if(users.length > index) return users[index];
        else return address(0);
    }

    function insertUser(uint initialAmount) public returns(address){
        address uad = new User();
        users.push(uad);
        balances[uad] = initialAmount; // ex pour les adhérents 
        return uad;
    }

    function getSkills(address _uad) public constant returns(bytes32[]) {
        return mapSkills[_uad];
    }

    function addSkill(address _uad, bytes32 _skill) public returns(uint){
        mapSkills[_uad].push(_skill);
        return mapSkills[_uad].length;
    }

    function removeSkill(address _uad, bytes32 _skill) public returns(uint){
        bytes32 lastItem = mapSkills[_uad][mapSkills[_uad].length-1];
        uint res;
        for(uint i = 0; i < mapSkills[_uad].length; i++){
            if(mapSkills[_uad][i] == _skill){
                res = i;
            break;
            }
        }
        mapSkills[_uad][res] = lastItem;
        mapSkills[_uad].length--;
        return(mapSkills[_uad].length);
    }
}
