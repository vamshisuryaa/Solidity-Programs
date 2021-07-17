pragma solidity ^0.5.13;


/*
-ABI stands for Application binary interface
ABI in compilation details is a  JSON array basically describing all the functions, the whole interfaceof this smart contract

-Function hashes are the way how you interact with a smart contract on blockchaiN
*/





/*    ======FUNCTIONS AND OPCODES========

        -----Interaction-----
        
        -Low level, through "data" field when sending a transaction
        (Function hash is created by the free library behind the remix , it calculates hash and signing of transactions with thr right hash so that blockchain can do something with it)
        -Client use an "ABI" Array (Application Binary interface) -This is the one crutial element that people need to interact with the smart contract
        The ABI Array contains all the functions/parameters/Return values of the contract(ABI arrays contain everything you need to interact with the smart contract)


        ----- ABI-----

        - Its a json file
        - Contains all the information to interact with the contract
        - The smart contract on the blockchain is just Binary
            * Client-software doesn't know the interfaces
            *Need to be told via an external configuration->ABI

        -----Function Signature-----
        
        - Interact with a "getter" function without parameters
            *function myUint()
            *Function hash is the first 4 bytes of the Keccak256 hash of the function signature
                -bytes4(keccak256("myUint()"));
        
        -Interact with a getter function with parameters:
            * function someFunction(uint _myUint1, address _someAddr)
            * Function hash is the first 4 bytes of the keccak256 hash of the function signature
                -Bytes4(keccak256("someFunction(uint256,address)"))
        
        -Interact with a setter?
            * Encode the parameters as well
            https://docs.soliditylang.org/en/latest/abi-spec.html

        =====DEBUGGING====
        
        - Step by step
        - Transaction based, currently no breakpoints
            *Step into after it happens, not while it happens
        - Show gas costs for Opcodes, stack and memory
            * Decent amount of details
        - Relatively good for prototyping   
        
        
        =====GAS AND OPERATIONAL COSTS======
        
        - Idea - Detach execution cost from ether
            - Like a car: Usage "petrol" per 100km. Petrol cost goes up and down
                        Consumption stays the same
            - Like electricity: KWh usage stays the same price varies
            - Like Water: Liters of water used
            
        - Gas price varies: Gas comsumption constant
            - Therefore: Ether cost varies


   CHECK ETHEREUM YELLOW PAPER FOR MORE DETAILS
   
   Key Take-Aways
   
   - Transaction object is populated with encoded data field
   - Functions are encoded, Arguments are encoded
        -There are libraries for that
    - Gas costs are determined by the operational complexity
        * Gas is detached from ether
   
   
*/








contract MyContract{
    string public myString ="Hello world";
}