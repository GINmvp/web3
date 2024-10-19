// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
众筹合约是一个募集资金的合约，在区块链上，我们是募集以太币，类似互联网业务的水滴筹。区块链早起的 ICO 就是类似业务。
众筹合约分为两种角色：一个是受益人，一个是资助者。
状态变量按照众筹的业务：
    状态变量
        筹资目标金额    fundingGoal
        当前募集金额    fundingAmount
        资助者列表      funders
        资助者人数      fundersKey
需要部署时候传入的数据:
     受益人
     筹资目标数量

*/ 
contract Crowd {
    // 受益人
    address public beneficiary;
    // 捐助人
    mapping (address=>uint256) public funders;
    // 众筹目标金额
    uint public fundingGoalAmount;
    // 当前众筹金额
    uint public fundingAmount;
    // 资助人数
    uint public count;
    // 资助状态
    bool public _type = false;

    constructor(uint _count,address _owner){
        require(_count > 0,"amount should > 0");
        require(_owner != address(0),"address illegal");
        fundingGoalAmount = _count;
        beneficiary = _owner;
    }
    // 捐赠
    function donation() external payable {
        uint amount = msg.value;
        require(amount > 0,"amount should > 0");
        require(_type = false,"Crowd has finished");
        funders[msg.sender] += amount;
        fundingAmount += amount;
        count += 1;
    }

    function withdrew() external payable {
        require(fundingAmount >= fundingGoalAmount,"Crowdfunding is not finished yet");
        // 一系列的判断。。。。。。
        _type = true;
        payable(beneficiary).transfer(fundingAmount);
    }
}