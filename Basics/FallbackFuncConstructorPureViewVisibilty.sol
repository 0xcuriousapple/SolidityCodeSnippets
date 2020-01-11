pragma solidity ^0.5.13;
contract FunctionsExample {
mapping(address => uint) public balanceReceived;
address payable owner;

//
constructor() public {
owner = msg.sender;
}

function destroySmartContract() public {
require(msg.sender == owner, "You are not the owner");
selfdestruct(owner);
}

function receiveMoney() public payable {
assert(balanceReceived[msg.sender] + msg.value >= balanceReceived[msg.sender]);
balanceReceived[msg.sender] += msg.value;
}

function withdrawMoney(address payable _to, uint _amount) public {
require(_amount <= balanceReceived[msg.sender], "not enough funds.");
assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
balanceReceived[msg.sender] -= _amount;
_to.transfer(_amount);
}

/*Fallback f: A contract can have exactly one unnamed function. 
This function cannot have arguments and cannot return anything. 
called when a tx without a function call is sent to the smart contract
called when thr function call in the tx isnt found
can only be external

fallback function is here to receive ether as simple tx.
beware of gas limit
*/
function () external payable {
receiveMoney();
}



// It indicates that the function will not alter the storage state in any way.
function getOwner() public view returns(address) {
return owner;
}

//view/pure is only against your local blockchain node/dont need mining
//Pure is even more restrictive, indicating that it won't even read the storage state.
function convertWeiToEth(uint _amountInWei) public pure returns(uint) {
return _amountInWei / 1 ether;
}

//Visibility : https://bitsofco.de/solidity-function-visibility-explained/

}