pragma solidity ^0.5.11;

contract InheritanceModifierExample {
    
mapping(address => uint) public tokenBalance;
address owner;
uint tokenPrice = 1 ether;

constructor() public {
owner = msg.sender;
tokenBalance[owner] = 100;
}

function createNewToken() public {
require(msg.sender == owner, "You are not allowed");
tokenBalance[owner]++;
}

function burnToken() public {
require(msg.sender == owner, "You are not allowed");
tokenBalance[owner]--;
}

function purchaseToken() public payable {
require((tokenBalance[owner] * tokenPrice) / msg.value > 0, "not enough tokens");
tokenBalance[owner] -= msg.value / tokenPrice;
tokenBalance[msg.sender] += msg.value / tokenPrice;
}

function sendToken(address _to, uint _amount) public {
require(tokenBalance[msg.sender] >= _amount, "Not enough tokens");
assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
tokenBalance[msg.sender] -= _amount;
tokenBalance[_to] += _amount;
}

}


/*
We can make code above efficient by uding modifier
modifier onlyOwner {
require(msg.sender == owner, "You are not allowed");
_;
}
//...
/...
function createNewToken() public onlyOwner {
tokenBalance[owner]++;
}

function burnToken() public onlyOwner {
tokenBalance[owner]--;
}


_ significance :
everything inside func will be  copied over here to the underscore
and then everything in modier will be copied back to function body
*/

/* One step further
Using Inheritance

Inheritance AND Importing are great to abstract away func

pragma solidity ^0.5.11;

contract Owned {

    address owner;
    constructor() public {
    owner = msg.sender;
    }
    
    modifier onlyOwner {
    require(msg.sender == owner, "You are not allowed");
    _;
    }

}

contract InheritanceModifierExample is Owned {

    mapping(address => uint) public tokenBalance;
    uint tokenPrice = 1 ether;
    
    constructor() public {
    tokenBalance[owner] = 100;
    }
    
    function createNewToken() public onlyOwner {
    tokenBalance[owner]++;
    }
.....


one step further
Importing File 

pragma solidity ^0.5.11;

import "./Owned.sol";

contract InheritanceModifierExample is Owned {



Inheritance
you can actually do multiple inheritance where you can use let's say a contract.
A is X,Y,Z.
And then the question becomes what if you have multiple times the same function in those X Y sets.
Which ones is called first.
It's the last one.
You can use super to access functions from the base contract.
only one single smart contract gets deployed even though you derive from smart contracts.
*/
