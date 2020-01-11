pragma solidity ^0.5.11;

contract EventExample {
    
    mapping(address => uint) public tokenBalance;
    
    event TokensSent(address _from, address _to, uint _amount);
    
    constructor() public {
    tokenBalance[msg.sender] = 100;
    }
    
    function sendToken(address _to, uint _amount) public returns(bool) {
      
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens");
        assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
        
        emit TokensSent(msg.sender, _to, _amount);
        
        return true;
    }

}
/*
you cannot  return variables to the outside world.
you can return if its inside
of send token abouve is called from outside there will be no output
to interact with outside world we have to use events
data from events is stored in logs of tx
event arguments marked as indexed

events

used for retuen values from tx
used externally to trigger functionality
used as cheap data storage


https://medium.com/coinmonks/storing-on-ethereum-analyzing-the-costs-922d41d6b316
Problem : Stroing data is extreamely expensive on eth
Sol :
Store data off chain and store only proof(hash) -> Notary
Store data in naother blockchain sucha as ipfs
Store data in event logs if not necess.

*/