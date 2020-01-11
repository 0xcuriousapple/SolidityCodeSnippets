pragma solidity ^0.5.11;

contract MyContract{
    
    string public s="Hello World!";
} 

/*
Variables
boolean
bool public x;

int
uint -> uint256
unsigned 256bit (mul of 8)
int varaibles wrap automatically
ex uint8 (0-255) if -- at 0 = 255 if ++ at 255 =0
int8 (-127 to 127)

address
address add;
add.balance;
add.transfer();
add.send()'
add.call()....

Strings
String public mysting = "HelloWorld"
String is stoerd as byte array here, but there is no random access
string manipulation is not aval in solidity
its consumes too much gas for storage and manipulation.

ref type need to mention meneory location
string is ref type
function setmystring (string memory str)
{
    
    
}

Solution : str stored outside blk and hash of str is stored on blk

Mappings
Structures 
Arrays( use mapping avoid array for gas)
Enum

Variables defualt Values
boolean false
string empty string
int 0 

Public varaibles auto get getter func with their name
*/
