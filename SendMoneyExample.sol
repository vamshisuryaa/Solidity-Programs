pragma solidity ^0.5.13;

contract SendMoneyExample{
   
    uint public balanceReceived;
   
    function receiveMoney() public payable {  //Message Object
        balanceReceived += msg.value; // inside msg.value is the amount in wei that is stored, that was tranfereed
    }
   
   
    function getBalance() public view returns (uint){
       
        return address(this).balance;
    }
   
    function withdrawMoney() public { // We are going to withdraw all the money who is sending a transaction to this function
       
       address payable  to = msg.sender;  //we can do this with another property in msg object called " Message sender property"
   
       
        to.transfer(this.getBalance());// The argument is the amount in wei that we want to tranfer to the address calling this function

        // on every address we can call a balance property and a transfer function
   
    }
   
    function withdrawMoneyTo(address payable _to) public {
       
       _to.transfer(this.getBalance());
    }
   
   

}