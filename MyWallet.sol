 pragma solidity ^0.8.0;

//import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0-beta.0/contracts/ownership/Ownable.sol";

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";
contract Allowance is Ownable{
    
    using SafeMath for uint;
    event AllowanceChanged(address indexed _forWho, address indexed _fromWhom, uint indexed _oldAmount, uint indexed _newAmount);// Indexed is used so that we can search for them later in the side chain or event chain
    
    mapping(address => uint) public allowance;
  
  function addAllowance(address _who, uint _amount) public onlyOwner {
      
      emit AllowanceChanged(_who,msg.sender,allowance[_who],_amount);
      
      allowance[_who] = _amount;
      
  }
 
   
    
    modifier ownerOrAllowed(uint _amount){
        require(isOwner() || allowance[msg.sender] >= _amount,"YOU ARE NOT ALLOWED");
        
    } 
    
    function reduceAllowance(address _who,uint _amount ) internal {
        
        emit AllowanceChanged(_who,msg.sender,allowance[_who],allowance[_who].sub (_amount));
      
         allowance[_who] = allowance[_who].sub(_amount);
    }
    
}




contract MyWallet is Allowance{
    
    event MoneySent(address indexed _benificiary, uint indexed _amount);
    event MoneyReceived(address indexed _from, uint indexed _amount);
    
    
    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount){
       require(_amount<= address(this).balance,"There are not enough funds stored in the smart contract");
       if(!isOwner()){
           reduceAllowance(msg.sender);
       }
       
       emit MoneySent(_to,_amount);
       _to.transfer(_amount); 
     }
     
     function renounceOwnership() public onlyOwner{
         revert("can't renounce ownership here");
         
     }
    
     receive () external payable {
        
        emit MoneyReceived(msg.sender, msg.value);
    }
}


  /* (1)address public owner;  (commented part - Not necesaty because we are using open zeppelin libraty ownable.sol)
                                Modifier in the library is also onlyOwner
    constructor() public{
        owner = msg.sender;
    }
    
    modifier onlyOwner(){
    
    require(owner == msg.sender, "YOU ARE NOT ALLOWED"); 
    _;
    
    }*/

