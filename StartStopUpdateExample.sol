pragma solidity ^0.5.13;


contract StartStopUpdateExample{
   
    address owner;
   
    bool public paused;
   
    constructor() public {
       
        owner = msg.sender;
    }
   
    function sendMoney() public payable{
       
    }
   
    function setPaused(bool _paused) public{
       
        require(msg.sender == owner," You are not the owner");
        paused = _paused;
    }
   
   
    function WithdrawAllMoney(address payable _to) public {
       
       
        require(msg.sender==owner, "You are not the owner");
       
        require(!paused,"Contract is paused");
        _to.transfer(address(this).balance);
    }
   
 
    function destroySmartContract(address payable _to) public  // we should mention address that receives the rest of the funds that are stored in the smart contract
    {
        require(msg.sender ==owner,"You are not the owner");
    selfdestruct(_to);
    }

}