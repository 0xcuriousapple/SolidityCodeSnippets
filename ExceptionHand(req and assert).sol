
pragma solidity ^0.5.11;
contract ExceptionExample {
mapping(address => uint64) public balanceReceived;

function receiveMoney() public payable {
    
assert(balanceReceived[msg.sender] + uint64(msg.value) >= balanceReceived[msg.sender]);
balanceReceived[msg.sender] += uint64(msg.value);

}

function withdrawMoney(address payable _to, uint _amount) public {
    
require(_amount <= balanceReceived[msg.sender], "not enough funds.");
assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
balanceReceived[msg.sender] -= uint64(_amount);
_to.transfer(_amount);
}

}