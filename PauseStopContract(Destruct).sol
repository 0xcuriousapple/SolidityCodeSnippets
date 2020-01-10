pragma solidity ^0.5.11;
contract StartStopUpdateExample {
    
address owner;
bool public paused;

constructor() public {
owner = msg.sender;
}

function sendMoney() public payable {
}

function setPaused(bool _paused) public {
require(msg.sender == owner, "You are not the owner");
paused = _paused;
}

function withdrawAllMoney(address payable _to) public {
require(msg.sender == owner, "You cannot withdraw!");
require(!paused, "Contract Paused currently");
_to.transfer(address(this).balance);
}

function destroySmartContract(address payable _to) public {
require(msg.sender == owner, "You are not the owner");
//remianing funds are sent to _to
//you can never delete smartcontract from blockcahin we can only stop it, once
selfdestruct(_to);
}

}