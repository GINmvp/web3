// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * 将ETH通过WETH包装成一个ERC20代币
 * 存入一个ETH-则铸造一个代币并转移给存储者
 * 取出一个ETH-则销毁一个代币

    3 个查询
        balanceOf: 查询指定地址的 Token 数量
        allowance: 查询指定地址对另外一个地址的剩余授权额度
        totalSupply: 查询当前合约的 Token 总量
    2 个交易
        transfer: 从当前调用者地址发送指定数量的 Token 到指定地址。
            这是一个写入方法，所以还会抛出一个 Transfer 事件。
        transferFrom: 当向另外一个合约地址存款时，对方合约必须调用 transferFrom 才可以把 Token 拿到它自己的合约中。
    2 个事件
        Transfer
        Approval
    1 个授权
        approve: 授权指定地址可以操作调用者的最大 Token 数量。
 * 
*/
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract WETH is ERC20("dog","GB"){

    mapping(address=>uint) public userAmount;
    /**
    铸币函数
    */ 
    function mint(address _address,uint _count) internal {
        _mint(_address,_count);
    }
    /**
    销毁函数
    */ 
    function burn(address _address,uint _count) internal {
        _burn(_address,_count);
    }

    /**
    用户存款ETH
    为用户铸造等量的代币
    并将代币交易给用户
    */
    function save() public payable {
        uint amount = msg.value;
        require(amount > 0,"amount should > 0");
        userAmount[msg.sender] += amount;
        mint(msg.sender,amount);
    }

    /**
    用户提取ETH
    检查用户的账户的代币余额
    将代币烧掉然后兑换成ETH
    交易给用户
    */
    function withdrew(uint _amount) public payable {
        uint balance = balanceOf(msg.sender);
        address _add = msg.sender;
        require(balance >= _amount,"you have no enough GB");

        burn(msg.sender,_amount);
        userAmount[_add] -= _amount;
        payable(_add).transfer(_amount);
    }
    
}// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * 将ETH通过WETH包装成一个ERC20代币
 * 存入一个ETH-则铸造一个代币并转移给存储者
 * 取出一个ETH-则销毁一个代币

    3 个查询
        balanceOf: 查询指定地址的 Token 数量
        allowance: 查询指定地址对另外一个地址的剩余授权额度
        totalSupply: 查询当前合约的 Token 总量
    2 个交易
        transfer: 从当前调用者地址发送指定数量的 Token 到指定地址。
            这是一个写入方法，所以还会抛出一个 Transfer 事件。
        transferFrom: 当向另外一个合约地址存款时，对方合约必须调用 transferFrom 才可以把 Token 拿到它自己的合约中。
    2 个事件
        Transfer
        Approval
    1 个授权
        approve: 授权指定地址可以操作调用者的最大 Token 数量。
 * 
*/
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract WETH is ERC20("dog","GB"){

    mapping(address=>uint) public userAmount;
    /**
    铸币函数
    */ 
    function mint(address _address,uint _count) internal {
        _mint(_address,_count);
    }
    /**
    销毁函数
    */ 
    function burn(address _address,uint _count) internal {
        _burn(_address,_count);
    }

    /**
    用户存款ETH
    为用户铸造等量的代币
    并将代币交易给用户
    */
    function save() public payable {
        uint amount = msg.value;
        require(amount > 0,"amount should > 0");
        userAmount[msg.sender] += amount;
        mint(msg.sender,amount);
    }

    /**
    用户提取ETH
    检查用户的账户的代币余额
    将代币烧掉然后兑换成ETH
    交易给用户
    */
    function withdrew(uint _amount) public payable {
        uint balance = balanceOf(msg.sender);
        address _add = msg.sender;
        require(balance >= _amount,"you have no enough GB");

        burn(msg.sender,_amount);
        userAmount[_add] -= _amount;
        payable(_add).transfer(_amount);
    }
    
}// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * 将ETH通过WETH包装成一个ERC20代币
 * 存入一个ETH-则铸造一个代币并转移给存储者
 * 取出一个ETH-则销毁一个代币

    3 个查询
        balanceOf: 查询指定地址的 Token 数量
        allowance: 查询指定地址对另外一个地址的剩余授权额度
        totalSupply: 查询当前合约的 Token 总量
    2 个交易
        transfer: 从当前调用者地址发送指定数量的 Token 到指定地址。
            这是一个写入方法，所以还会抛出一个 Transfer 事件。
        transferFrom: 当向另外一个合约地址存款时，对方合约必须调用 transferFrom 才可以把 Token 拿到它自己的合约中。
    2 个事件
        Transfer
        Approval
    1 个授权
        approve: 授权指定地址可以操作调用者的最大 Token 数量。
 * 
*/
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract WETH is ERC20("dog","GB"){

    mapping(address=>uint) public userAmount;
    /**
    铸币函数
    */ 
    function mint(address _address,uint _count) internal {
        _mint(_address,_count);
    }
    /**
    销毁函数
    */ 
    function burn(address _address,uint _count) internal {
        _burn(_address,_count);
    }

    /**
    用户存款ETH
    为用户铸造等量的代币
    并将代币交易给用户
    */
    function save() public payable {
        uint amount = msg.value;
        require(amount > 0,"amount should > 0");
        userAmount[msg.sender] += amount;
        mint(msg.sender,amount);
    }

    /**
    用户提取ETH
    检查用户的账户的代币余额
    将代币烧掉然后兑换成ETH
    交易给用户
    */
    function withdrew(uint _amount) public payable {
        uint balance = balanceOf(msg.sender);
        address _add = msg.sender;
        require(balance >= _amount,"you have no enough GB");

        burn(msg.sender,_amount);
        userAmount[_add] -= _amount;
        payable(_add).transfer(_amount);
    }
    
}// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * 将ETH通过WETH包装成一个ERC20代币
 * 存入一个ETH-则铸造一个代币并转移给存储者
 * 取出一个ETH-则销毁一个代币

    3 个查询
        balanceOf: 查询指定地址的 Token 数量
        allowance: 查询指定地址对另外一个地址的剩余授权额度
        totalSupply: 查询当前合约的 Token 总量
    2 个交易
        transfer: 从当前调用者地址发送指定数量的 Token 到指定地址。
            这是一个写入方法，所以还会抛出一个 Transfer 事件。
        transferFrom: 当向另外一个合约地址存款时，对方合约必须调用 transferFrom 才可以把 Token 拿到它自己的合约中。
    2 个事件
        Transfer
        Approval
    1 个授权
        approve: 授权指定地址可以操作调用者的最大 Token 数量。
 * 
*/
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract WETH is ERC20("dog","GB"){

    mapping(address=>uint) public userAmount;
    /**
    铸币函数
    */ 
    function mint(address _address,uint _count) internal {
        _mint(_address,_count);
    }
    /**
    销毁函数
    */ 
    function burn(address _address,uint _count) internal {
        _burn(_address,_count);
    }

    /**
    用户存款ETH
    为用户铸造等量的代币
    并将代币交易给用户
    */
    function save() public payable {
        uint amount = msg.value;
        require(amount > 0,"amount should > 0");
        userAmount[msg.sender] += amount;
        mint(msg.sender,amount);
    }

    /**
    用户提取ETH
    检查用户的账户的代币余额
    将代币烧掉然后兑换成ETH
    交易给用户
    */
    function withdrew(uint _amount) public payable {
        uint balance = balanceOf(msg.sender);
        address _add = msg.sender;
        require(balance >= _amount,"you have no enough GB");

        burn(msg.sender,_amount);
        userAmount[_add] -= _amount;
        payable(_add).transfer(_amount);
    }
    
}