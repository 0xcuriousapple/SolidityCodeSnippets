pragma solidity ^0.5.13;

contract SendMoney{
    
    uint public balance_received;
    //Fun/address is marked payable when it receives ether
    function receiveMoney() public payable{
        //Message objects: global    
         balance_received += msg.value;
    }
    
    function getBalance() public view returns(uint) {
         return address(this).balance;
    }
    
    function withdrawMoney() public{
        address payable to = msg.sender;
        to.transfer(this.getBalance());
    }
}