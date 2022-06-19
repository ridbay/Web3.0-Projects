// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// pragma solidity ^0.8.0;
// pragma solidity >=0.8.0 <0.9.0;

contract SimpleStorage {
    //NOTES:
    //Every smart contract have a unique address,, just like a wallet address
    //Anytime there is a change on a contract or a new contract is deployed, it happens in a transaction.

    // //Data types
    // string public name="Ridwan";
    // uint public age = 33;
    // bool public isTrue = true;
    // address owner;
    // address payable owner1;
    //     struct Person{
    //         uint age;
    //         string name;
    //     }
    // Person public NewPerson = Person({
    //     age:33, name:"Ridwan balogun"
    // })

    // // Global variables
    // address public _owner = msg.sender;
    // bytes public _msgdata = msg.data;
    // uint public _blocknumber = block.number;
    // bytes32 public _blockhash = blockhash(3);
    // address public _coinbase = block.coinbase;
    // uint public _gaslimit = block.gaslimit;
    // uint public _blocktime = block.timestamp;
    // uint public _gasleft = gasleft();
    // address public originalCaller = tx.origin;

    // //Visibility modifers
    // //public - Assesiblie withing this contract and outside this contract
    // string public lname = "Balogun";

    // //private - The variable can only be accessed within this contract, functions/method within this contract can also access the variable
    // string private fname = "Ridwan"
    // //Internal - The variable can only be accessed within this contract and the contracting inheriting this contract, the default modifier in solidity is internal, so, you may or may not use the keyword
    // string internal city = "lagos"
    // //external - any state variable with external cannot be declared, external type is only used for functions
    // string external country = "Nigeria"

    // //Functions

    // // Pure - No state variables will be used, can't read state variables, pure functions are functions that only do some type of maths without saving the state anywhere
    // function add(int a, int b) public pure returns(int){
    //     return a+b;
    // }
    // uint pincode = 1234;

    // //View - Reading off the blockchain without making any state changes...Allows state variables to be used, can read state variables, but not modifying the state variable
    //public variables are also view functions
    // function pinc() public view returns(uint){
    //     return pincode + 5;
    // }

    //Storage Types
    // // 1. Storage: any variable declared outside of a function are state varibales will be directly stored on the blockchain by default, irrespective of the datatype
    // string twitterAccount = "ridbay";
    // // 2. memory (temporary memory storage): can be declared only inside a function, can be modified inside the function, once function execution is completed, the variables are cleared from memory
    // function displayAccountName(string memory _accountName) public pure returns(string memory){
    //     return _accountName;
    // }
    // // 3. Call Data: it is a temporary storage like memory storage but it is slightly different as it is non-modifiable inside the function once it is passed.
    // //another didfference is that is it cheaper than memory type and mostly used with external function types
    // function result(string calldata city) external pure returns(string calldata){
    //     // city = "abuja"; can be modfied, throws an eror
    //     return city;
    // }

    // // NB: External functions can be called inside the same contract
    // // Calling externa function
    // function callExternal() public view returns(string memory){
    //     return this.result(twitterAccount);
    // }

    uint256 favoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }
    // uint256[] public anArray;
    People[] public people;

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
