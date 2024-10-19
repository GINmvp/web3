// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
TodoList是类似便签一样功能的东西，记录我们需要做的事情，以及完成状态。
需要完成的功能：
    创建任务
    任务名写错的时候修改任务名称
    修改完成状态
        手动指定完成或者未完成
        自动切换
            如果未完成状态下，改为完成
            如果完成状态，改为未完成
    获取任务
*/ 


contract TodoList {
    struct Todo{
        string taskName;
        bool taskType;
    }

    uint256 private taskId;

    mapping(uint256=>Todo) public todoList;

    modifier checkStr(string calldata _str){
        require(bytes(_str).length > 0,"name cannot be empty");
        _;
    }

    /**
    获取任务id
    */ 
    function getTaskId() private returns (uint){
        return taskId++;
    }

    /**
    创建一个任务
    */ 
    function createTask(string calldata _name) external checkStr(_name) returns(uint256){
        uint256 id = getTaskId();
        todoList[id] = Todo(_name,false);
        return id;
    }

    /**
    修改任务名
    */
    function editTaskName(uint256 _id,string calldata _newName) external checkStr(_newName){
        Todo storage task = todoList[_id];
        

        require(bytes(task.taskName).length > 0 && task.taskType == false,"the task is not exist or has finished");
        task.taskName = _newName;
    }

    /**
    手动指定任务是否完成
    */ 
    function editTaskTypeByHand(uint256 _id,bool _flag) external {
        Todo storage task = todoList[_id];
        require(bytes(task.taskName).length > 0,"the task is not exist");

        task.taskType = _flag;
    }

    function editTaskType(uint256 _id) external {
        Todo storage task = todoList[_id];
        require(bytes(task.taskName).length > 0,"the task is not exist");

        task.taskType == true ? (task.taskType = false) : (task.taskType = true);
    }
}