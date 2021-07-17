pragma solidity ^0.5.13;

contract ExceptionExample{
   
    //Uint64 can store upto 18 ether, we must be careful as the value may wrap around as earlier discussed
   
    mapping(address => uint64) public BalanceReceived;
   
    function ReceiveMoney()  public payable{
        assert(BalanceReceived[msg.sender] + uint64(msg.value) >= BalanceReceived[msg.sender]);
        BalanceReceived[msg.sender] += uint64(msg.value);
    }
   
    function WithdrawMoney (address payable _to, uint64 _amount) public {
       
     
        require(_amount <= BalanceReceived[msg.sender], "Insufficient Balance");
        assert(BalanceReceived[msg.sender] >= BalanceReceived[msg.sender]- _amount);
        BalanceReceived[msg.sender] -= _amount;
            _to.transfer(_amount);
       
       
       
       
        //REQUIRE IS FOR INPUT VALIDATION
        //ASSERT IS FOR CHECKING INTERNAL VARIABLE STATES (INVARIANTS)
        //REVERT
       
       
       
    }
}
