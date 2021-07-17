/*We cannot have return variables in writing solidity functions

- We can have return variables in writing solidity functions inside the smart contract
 but we cannot return anything outside to the one who created the transaction
*/


/*  =============EVENTS AND RETURN VALUES==============

   -EVM has a logging functionality(logs are stored on a side chain)
    
    event MyEvent(uint _arg1, address indexed _arg2) - if we define any of our index parameters, this can be upto 3 parameters

    -used for return values from transactions
    - used externally to trigger functionaity
    - used as a cheap data storage
    
    -writing transactions cannot return values


    *Events can emit data which is stored on a side chain and its much cheaper than storing it in strings on storage variabless

    - Writing functions cant return data externally
        - I nstead return a transaction blockhash
        - Transaction can take long or may fail
        
    -The idea is to use a event instead        

    
            ====EVENTS AS DATASTORAGE======
        
        Problem: Storing data is extremely expensive on the ethereum bblockchain
        
        solution:
        - Store data off-chain and store only a proof(hash)-> notary
        - Store data in another blockchain such as IPFS(InterPlanetary File System)
        - Store data in Event logs if not necessary

            
            ======EVENTS IN dApps======
            
            -Applications can subscribe and listen to these events through the RPC interface of an ethereum client
            -Events are inheritble members of contracts
            -The log and its event data is not accessible from within contracts
            -"indexed" event parameters can be searched for  later

            * Events are used for return values, data storage and trigger, -Events can not be retrieved from within the smart contracts,- event arguments marked as indexed can be searched for,- events are cheap

*/



pragma solidity ^0.5.11;

contract EventExample{
    
    mapping(address=> uint) public tokenBalance;
    
    event TokensSent(address _from, address _to, uint _amount);
    
    constructor() public{
        tokenBalance[msg.sender]=100;
    }
    
    function sendToken(address _to, uint _amount) public returns(bool){
        
        require(tokenBalance[msg.sender]>= _amount,"Not enough tokens");
        assert(tokenBalance[_to] +_amount >= tokenBalance[_to] );
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
        tokenBalance[msg.sender]-= _amount;
        tokenBalance[_to] += _amount;
        
        
        emit TokensSent(msg.sender, _to, _amount);
        return true;
    
    //This works on javascript vm but not on real blockchain, when we switch to injected web3 we notice we cant do this
      // Instead of return values we use events to send return values to the one who iniated the transaction  
    }
}