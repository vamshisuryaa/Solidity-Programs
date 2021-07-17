pragma solidity ^0.8.0;

/*      ====library properties=====
    - Libraries are a bit like smart contracts
    - code is reused using DELEGATECALL feature
    - code is executed in the context of the calling contracts
        *"this" is the calling contract, not the library
    -libraries are assumed to be stateless
    -it is not possible to destroy a library
    
    
    =====restrictions=====
    - No state variables
    - cannot inherit nor be be inherited
    -cannot receive ether
    
    -Allof thich might be lifted at some point in the future

*/

import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/utils/math/SafeMath.sol";

 //import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/math/SafeMath.sol";
contract LibrariesExample{
    
    using SafeMath for uint;
    
    mapping(address => uint) public tokenBalance;
    
    
    
    constructor() public{
        tokenBalance[msg.sender] = 1;
    }
    
    
    function sendToken(address _to, uint _amount) public returns (bool){
        
        // tokenBalance[msg.sender]-= _amount; //This wraps around and gives largest unsigned integer number to avoid such things we use libraries 
        tokenBalance[msg.sender]=tokenBalance[msg.sender].sub(_amount); 
        //tokenBalance[_to] += _amount;
        tokenBalance[_to] = tokenBalance[_to].add(_amount);
       
        return true;
    }
}