pragma solidity ^0.5.13;



/*          ======SETTER AND GETTER FUNCTIONS=====
 
                1. Writing transactions : Transactions
                2. Reading Transactions : Call   
                
                Calls are against a blockchain node
                -Remember : Everyone has a copy of the blockchain
                -If you don't need to change anything, you dont need to inform other participants
                -Reading is virtually free
    

                1)View Function: Reading from the state and from other view functions
                2)Rure Function: Not reading or modifying state
                
                
                *Getter functions are usually view functions
                
                ======FUNCTION VISIBILITY======
                
                - PUBLIC  - can be called internally and externally (Inheritance also)
                - PRIVATE - Only for within the contract, not externally reachable and not via derivated contracts (No inheritance)
                - EXTERNAL - can be called from other contracts, Can be called externally
                - INTERNAL - Only from the contract itself or from derived contracts. Cant be invoked by a transaction
                
                
                ====CONSTRUCTOR=====(called only once)
                
                - A function with the name "constructor(...)"
                - Called only during deployment
                - Cant be called afterwards
                - Is either public or internal
                
                ====FALLBACK FUNCTION====
                
                - A function without a name "Function()"
                - Called when a transaction without function-call is sent to smart contract
                - Called when the function-call in the transaction isnt found
                - can be only external
                
                - Contracts receiving Ether without a fallback function and without function call will throw an exception
                - You cannot completely avoid receiving Ether (even if you disable all payable functions)
                    * Miner reward or selfdestruct(address) will forcefully credit ether
                - Worst case: You can only rely on 2300 gas
                    *_contractAddress.transfer(1 ether); send only 2300 gas along
                - Forcefully prevent contract execution if called with contract data
                    *require(msg.data.length==0)
*/



contract FunctionsExample{
    mapping ( address => uint) public balanceReceived;
    
    address payable owner;
    
    
    //Constructor is called only once during deployment of smart contract, we can never call constructor ever again
    constructor() public{
        owner = msg.sender;
    }
    
    
    
    //WRIRING FUNCTION CAN CALL BOTH VIEW AND PURE FUNCTIONS
    
    // A VIEW FUNCTION CAN ACCESS THE STATE BUT ONLY IN  A READING WAY, A VIEW FUNCTION CAN CALL OTHER PURE FUNCTIONS AND OTHER VIEW FUNCTIONS 
    //BUTA VIEW FUNCTION CANNOT CALL OTHER WRITNIG FUNCTIONS
    function getOwner() public view returns (address){ // VIEW function return something
      
      return owner;  
    }
    
    
    // A PURE FUNCTION IS A FUNCTION WHICH IS NOT INTERACTING WITH ANY STORAGE VARIABLES(balanceReceived, owner are storage variables) (other languages CLASS VARIABLES)- Storage variables store a specific state of a smart contract
    function convertWeiToEther(uint _amountInWei) public pure returns (uint)
    {
        return _amountInWei/ 1 ether; // writing 1 ether is similar to writing 1000000000000000000
    }
    //A PURE FUNCTION CAN CALL ANOTHER PURE FUNCTION BUT IT CANT CALL A VIEW FUNCTION OR A WRITING FUNCTION BECAUSE IT VIOLATES THE RULE
    
    
    function destroySmartContract() public {
        require(msg.sender== owner,"you are not the owner");
        selfdestruct(owner);
    }
    
    function receiveMoney() public payable{
        assert(balanceReceived[msg.sender]+ msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender]+=msg.value;
    }
    
    function withdrawMoney( address payable _to, uint _amount) public {
        
        require(_amount <= balanceReceived[msg.sender], "NOT ENOUGH FUNDS" );
          assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
          balanceReceived[msg.sender]-= _amount;
          _to.transfer(_amount);
    }
    
    
    function () external payable{   //FALL BACK FUNCTION - No function name and must always be external 
    
    receiveMoney();
    
    }
}

//Fall back is a catch all for either 1. you dont interact with any function
                                    //2.or none of the function matches to the transaction  encoded data field    