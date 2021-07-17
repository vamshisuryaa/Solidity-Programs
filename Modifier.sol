pragma solidity ^0.5.11;


//IMPORTING OF FILES
/* One file can have several smart contracts

    1. Global level
    
    -import "filename";

    2.Import all members of a file:

    -import * as symbolName from "filename";

    3.Import specific members of a file:

    import{symbol1 as alias1, symbol2} from "filename"


 */


/* - Modifiers change behavior of function
   - They automatically check a pre condition
*/



/* 3  contract Owned{
    address owner;
    
    constructor() public{
        owner = msg.sender;
    } 
    
    modifier onlyOwner(){
        
        require(msg.sender == owner,"You are not allowed");
        _;
    
    }*/
}

contract InheritanceModifierExample is Owned{
    
    mapping(address => uint) public tokenBalance;
    
    address owner;
    
    uint tokenPrice= 1 ether;
    
    constructor() public{
        // owner = msg.sender;
        tokenBalance[owner]= 100;  
    }
    
 
    
    
   /* 2 modifier onlyOwner(){
        
        require(msg.sender == owner,"You are not allowed");
        _;
    }
    */
    
     function createnewToken() public onlyOwner {
        tokenBalance[owner]++;
    }
    
    function burnToken() public onlyOwner{
        tokenBalance[owner]--;
    }
    
    
 /* 1.  function createnewToken() public onlyOwner {
        require(msg.sender == owner,"You are not allowed");
        tokenBalance[owner]++;
    }
    
    function burnToken() public onlyOwner{
        require(msg.sender== owner, "You are not allowed");
        tokenBalance[owner]--;
    }
    */
    function purchaseToken() public payable{
        require((tokenBalance[owner]*tokenPrice) / msg.value > 0 ,"Not enough tokens");
        tokenBalance[owner]-= msg.value/tokenPrice;
        tokenBalance[msg.sender]+=msg.value/tokenPrice;
    }
    
    function sendToken(address _to, uint _amount) public {
        require(tokenBalance[msg.sender]>= _amount,"Not enough tokens");
        assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender]- _amount <= tokenBalance[msg.sender]);
        
    }
}