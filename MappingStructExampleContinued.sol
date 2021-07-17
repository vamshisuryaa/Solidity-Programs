pragma solidity ^0.5.13;

contract MappingStructExample{
   
     struct Payment{ // lets us create our oum data structures
        uint amount;
        uint timestamps;
    }
   
    struct Balance{
        uint totalBalance;
        uint numPayments;
        mapping(uint => Payment) payments;
       
    }
   
    mapping(address => Balance ) public balanceReceived;
   
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
   
    function sendMoney() public payable {
       
        balanceReceived[msg.sender].totalBalance += msg.value; // you can access struct value by a . (dot)
   
     
         Payment memory payment = Payment(msg.value, now); //because it is a reference type we should mention where its going to be stored (memory)
                                                           // Now gives us current timestamp
   
        balanceReceived[msg.sender].payments[balanceReceived[msg.sender].numPayments] = payment;
        balanceReceived[msg.sender].numPayments++;
    }
   
   
    function withdrawMoney(address payable _to, uint _amount) public {
       
      require(balanceReceived[msg.sender].totalBalance >= _amount, "Insufficient funds") ;
     
      balanceReceived[msg.sender].totalBalance -= _amount;
     
     _to.transfer(_amount);
       
    }
   
   
    function withdrawAllMoney(address payable _to) public {
       
        uint balanceToSend = balanceReceived[msg.sender].totalBalance;
       
       
        balanceReceived[msg.sender].totalBalance = 0;
       
        _to.transfer(balanceToSend);
       
       // _to.transfer(address(this).balance); - This was send to send all the funds from the smart contract
    }
}
