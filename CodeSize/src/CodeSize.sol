// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;
// ✅
contract CodeSize {
    /**
     * The challenge is to create a contract whose runtime code (bytecode) size is greater than 1kb but less than 4kb
     */

    address a;
    string message = "Hello, Solidity Devs";

    function mul(uint256 _value1, uint256 _value2) external pure {
        _value1 * _value2;
    }

    function caller() external returns(address){
        a = msg.sender;
        return a;
    }

    function changeMessage() external {
        message = "Greetings, Foundry Developers! Have a wonderful day, and remember to bully those Devs who are still not using Foundry!";
    }    
    
    function makeDay() external pure returns(string memory) {
        return "Eyyyyo! You Are Doing Great Keep At It! Have a great day and don't forget to practice your foundry testings!";
    }
}
