pragma solidity ^0.5.0;

contract TodoList{
	uint public taskCount = 0;

	struct Task{
		uint id;
		string content;
		bool completed;
	}

	mapping(uint => Task) public tasks;

	event TaskCreated(
		uint id,
		string content,
		bool completed
	);

	event TaskCompleted(
		uint id,
		bool completed
	);

	event TaskRemoved(
		uint id,
		string content,
		bool completed
	);

	constructor() public{
		createTask("Check out TomAuto");
	}

	function createTask(string memory _content) public{
		taskCount ++;
		tasks[taskCount] = Task(taskCount, _content, false);
		emit TaskCreated(taskCount, _content, false);
	}

	function toggleCompleted(uint _id) public {
		Task memory _task = tasks[_id];
		_task.completed = !_task.completed;
		tasks[_id] = _task;
		emit TaskCompleted(_id, _task.completed);
	}

	function remove(uint _id, string memory _content) public {
		Task memory _remove = tasks[_id];
		_remove.completed = false;
		_remove.content = _content;
		tasks[_id] = _remove;
		emit TaskRemoved(_id, _remove.content, _remove.completed);
	}

}