pragma solidity ^0.5.13;

contract WorkingwithVariables{
   
    uint256 public myUint;
   
    function setMyUint(uint _myUint) public{
        myUint = _myUint;
    }
   
    bool public mybool;
   
    function setMyBool(bool _mybool ) public {
        mybool = _mybool;
       
    }
   
    uint8 public myUint8;
   
    function incrementUint() public {
        myUint8++;
    }

     
    function decrementUint() public {
        myUint8--;
    }
   
    address public myAddress;
   
    function setAddress (address _myAddress) public{
       
        myAddress = _myAddress;
       
    }
   
    function getBalanceOfAddress() public view returns(uint){
        return myAddress.balance;
    }
   
    string public myString; // Stores UTF - 8 characters, solidity doesn't support concatenation, searching strings and string manipulations
                            // using strings in solidity is expensive and must be avoided if possible
    function setMyString(string memory _myString) public {
        myString = _myString;
    }
    }