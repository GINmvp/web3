// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * 所有人都可以存钱ETH
 * 只有合约 owner 才可以取钱
 * 只要取钱，合约就销毁掉 selfdestruct
 * selfdestruct 在新版本中已经废弃
 * 
*/
contract SavingPot{
    address public owner;
    mapping (address => uint) public name;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(address _sender) {
        require(_sender == owner, "only owner can call this function");
        _;
    }

    function save() public payable{
        require(msg.value > 0, "amount should > 0");
        name[msg.sender] += msg.value;
    }

    function withdraw() public onlyOwner(msg.sender){
        uint balance = address(this).balance;
        require(balance > 0, "balance should > 0");
        payable(owner).transfer(balance);
    }
}