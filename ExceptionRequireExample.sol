pragma solidity ^0.5.13;

contract ExceptionExample{
   
    mapping(address => uint) public BalanceReceived;
   
    function ReceiveMoney()  public payable{
        BalanceReceived[msg.sender] += msg.value;
    }
   
    function WithdrawMoney (address payable _to, uint _amount) public {
       
          /*   if(_amount <= BalanceReceived[msg.sender])  doesnt throw error message to user if amount greater, so we need require to throw exceptions
        {
            BalanceReceived[msg.sender] -= _amount;
            _to.transfer(_amount);
        }
        */
        require(_amount <= BalanceReceived[msg.sender], "Insufficient Balance");
        BalanceReceived[msg.sender] -= _amount;
            _to.transfer(_amount);
       
       
       
       
        //REQUIRE IS FOR INPUT VALIDATION
        //ASSERT IS FOR CHECKING INTERNAL VARIABLE STATES (INVARIANTS)
        //REVERT -
       
       
       
    }
}
