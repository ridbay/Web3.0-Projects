//SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract Notes {
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
    //CONSTRUCTORS
    // Constructors functions that are only executed only once when the smart contract is deployed,
    // string public Name;
    // constructor(string memory name){
    //     Name = name;
    // }
    //FUNCTION MODIFIERS: Used to restrict the user from performing some actions
    // string public name = "Ridwan";
    // address owner;
    // constructor(){
    //     owner = msg.sender; //msg.sender is a global variable
    // }
    // modifier onlyOwner(){ //onlyOwner can be a custom text like theOwner etc
    //     require(owner == msg.sender, "You are not the owner");
    //     _; // acts as 'return' in javascript
    // }
    // function changeName(string memory _newName) public onlyOwner {
    //     name = _newName;
    // }
    // //function modifiers can accept arguments/parameters
    // modifier equalToFive(uint num){
    //     require(num ==5, "The number you passed is not five");
    //     _;
    // }
    // function addNumbers(uint _num) public pure equalToFive(_num) returns(uint){
    //     return _num+5;
    // }
    // CONST & IMMUTABLE KEYWORDS
    // Adding constant keyword to variable will prevent re-assigning of the variable and it has to be initialized immediately it is declared
    // string public constant name = "Ridwan";
    // //Adding Immutable keyword to a variable will make it re-assignable and you dont have to initialize when declared, immutable wont work with 'bytes' and 'string'
    // // but works with uint and byte32
    // uint public immutable pincode;
    // // bytes public immutable pin;
    // // string public immutable lname;
    // constructor(){
    //     // name = "Balogun"; // Can not be re-assigned
    //     pincode = 1233; // Can be re-assigned
    // }
    //STRUCT - Declaring custom datatypes
    // struct Employee{
    //     string Name;
    //     uint8 Age;
    //     uint8[] EmployeeIDs; // Array of EmployeeIDs
    // }
    // Employee public NewEmployee;
    // Employee[] NewEmployees; // An array of employees
    // function AddEmployee() public {
    //     NewEmployee.Name = "Ridwan";
    //     NewEmployee.Age = 33;
    //     NewEmployee.EmployeeIDs.push(123);
    // }
    // function AddAllEmployees() public {
    //     NewEmployees.push(NewEmployee);
    // }
    // //STRING CONCATENATION
    // function concat(string memory _a, string memory _b) public pure returns(string memory fullName){
    //     return string(abi.encodePacked(_a, " ", _b));
    // }
    // MAPPING
    // mapping(uint => string) public Person;
    // mapping(string => uint) public Age;
    // function addMap () public {
    //     Person[1]= "Ridwan";
    //     Age["Ridwan"]= 33;
    // }
    //Advance Mapping
    // struct Employee{
    //     string Name;
    //     uint Age;
    // }
    // mapping(uint=> Employee) public Employees;
    // function advanceMapping() public {
    //     Employees[1]= Employee("Ridwan", 33);
    // }
    // //ARRAYS
    // //There two types, Dynamic arrays and Fixed size arrays
    // uint[10] public Num1; //Fixed size array (cant hold more than 10 elements)
    // uint[] public Num2; //Dynamic size array (Can hold unlimited number of elements)
    // uint[] public Num3 = [1,2,3,5]; // Can be initialized
    // //Operations on an array (4), push,pop, length and delete can be used on dynamic type arrays but only length and delete can be used on fixed type arrays
    // //Push
    //     function pushArray(uint _num) public {
    //         Num2.push(_num);
    //     }
    // //Pop
    //     function popArray() public {
    //         Num2.pop();
    //     }
    // //length
    // function lenArray() public  view returns(uint) {
    //         return Num2.length;
    //     }
    // //Delete
    // function deleteArray(uint _index) public {
    //         delete Num2[_index];
    //     }
    //     struct College{
    //         string Name;
    //         string Address;
    //         uint collegeId;
    //         uint[] deptId;
    //     }
    //     College[] colleges; // This is an array of items with College structure
    // //BYTES ARRAY
    // // Storing data on blockchain is very expensive, type of data and length of data to be stored should be of great consideration
    // // Always choose byte over string when storing data, though there are few exceptions when to use bytes over strings
    // // there are two ways declare byte; when the length of the data is known and when the length of the data is unknown
    // //1. When we already know the length
    // bytes6 public name = "Ridwan"; //Length of 6;
    // bytes7 public name1 = "Balogun"; // Lenght of 7
    // bytes32 public name2 = "Ridwan Ridwan Ridwan Ridwan Balo"; //Lenght of 32 characters
    // // elements in bytes can be accessed but cannot be modified
    // function access() public view returns(bytes1){
    //     // name[4] = "o"; // cant modify
    //     return name[2];
    // }
    // //2. When we do not know the length
    //  bytes public name3 ="I can do any length here";
    //  //Operations on byte datatype: length and pop
    // // LOOPS
    // // Do while loop
    // uint[] public num;
    // // function doWhileLoop() public {
    // //     uint x = 0;
    // //     do{
    // //     num.push(x);
    // //     x++;
    // //     }while(x < 20);
    // // }
    // // function whileLoop() public {
    // //     uint x = 1;
    // //     while(x < 20){
    // //         num.push(x);
    // //         x++;
    // //     }
    // // }
    // function forLoop() public {
    //     for(uint i; i < 5; i++){
    //         num.push(i);
    //     }
    // }
    // // ENUMS
    // enum loanstatus {Applied, InProgress, Verified, Approved}
    // loanstatus RidbayLoanStatus;
    // function applyLoan() public returns(uint, loanstatus){
    //     RidbayLoanStatus = loanstatus.Applied;
    //     return(block.timestamp, RidbayLoanStatus);
    // }
    // function Progress() public{
    //     RidbayLoanStatus = loanstatus.InProgress;
    // }
    // function IsInProgress()public view returns(bool){
    //     require(RidbayLoanStatus == loanstatus.InProgress, "Not in Progress");
    //     return(true);
    // }
    // function LoanStatus()public view returns(loanstatus){
    //     return RidbayLoanStatus;
    // }
    //EVENTS
    //Solidity is the bridge between blockchain and the outside world,
    // Reasons for Events in Solidity: Return values from your smartcontract to the outside of the smartcontract
    // address sender;
    // string name;
    // // event userDetails(address _sender, string _name);
    // //Event indexing: it means you can access/filter the event faster based on the variables (similary to primary key in database)
    // //You can only have a maximum of 3 parameters in an indexed event, if there are more than 3 parameters in the event, others parameters will be no-indexed
    // //Data stored in the event cannot be accessed inside the same contract
    // // Events are cheaper than storage, events are stored in logs
    //     // event userDetails(address indexed _sender, string indexed _name);
    // //It is recommended not to index string types as the hash of it will be stored and will be difficult to retrieve the original value
    // event userDetails(address indexed _sender, string _name);
    // function emitEvent(address _sender, string memory _name) public {
    //     emit userDetails(_sender, _name);
    // }
    // ADDRESS AND ADDRESS PAYABLE
    // address owner; //can be initialized with an address  e.g address owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    // address payable reciever; //can not be initiailized with an address unless it is type casted, e.g address owner = payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
    // address public owner;
    // address payable public reciever = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
    // function getBalance () public returns(uint, uint){
    //     owner = msg.sender;
    //     // reciever.transfer(10); //This means I want to send 10 eth from the contract address to the reciever's address
    //     // reciever.send(10); // This returns true or false
    //     return(owner.balance, reciever.balance);
    // }
    //How to recieve ether inside a smart contract
    // //Use the payable keyword
    // function balanceEth()public payable returns(uint){
    //     return address(this).balance;
    // }
    // address payable receiver = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
    // function transferEth() public {
    //     receiver.transfer(5);
    // }
}
