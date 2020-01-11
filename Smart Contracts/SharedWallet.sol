pragma solidity ^0.6.0;
contract owned
{
    address owner;
    constructor()public{
        owner = msg.sender;
    }
     modifier onlyowner
     {
         require(msg.sender==owner,"You are not allowed");
         _;
     }
}
contract sharedWallet is owned
{
    
    uint256 public balance;
    mapping(address => uint) public Allownce;
    
    event receipt(address _to, uint _amount,string status);
    event ebal(uint _balance);
    event eallow(uint _allowance);
    
    //Deposit
    receive() external payable {
        balance += msg.value;
    }
    
    //getBalance
    function GetBalance() public{
        emit ebal(balance);
    }
    
    //getRemainingAllowance
    function RemainingAllowance() public{
        emit eallow(Allownce[msg.sender]);
    }
    
    //Withdrawal
    
    function WithdrawalChild(address payable _b, uint256 _amount) internal
    {
            balance-=_amount;
            require(balance>=0, "Insufficient balance");
            _b.transfer(_amount);
            emit receipt(_b,_amount,"Money withdrawn Sucessfully");
            this.GetBalance();
    }
    function Withdrawal(uint256 _amount) public {
        
        if(msg.sender == owner)
        {
            WithdrawalChild(msg.sender,_amount);
        }
        else if (Allownce[msg.sender] >= _amount)
        {
            Allownce[msg.sender]-=_amount;
            WithdrawalChild(msg.sender,_amount);
        }
        else
        {
            emit receipt(msg.sender,_amount,"Withdrawl amount is more than Allownce");
            this.RemainingAllowance();
        }
    }
    
    //Set Allownce
    function SetAllowance(address _to, uint256 al) public onlyowner{
        
        Allownce[_to]=al;
    }
    
    
    fallback () external {
        
    }
    
}