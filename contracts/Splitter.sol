pragma solidity ^0.4.4;

contract Splitter {
	address owner;
	uint half;
	uint leftOver;
	address sender;
	mapping (address => uint) public balances;
	event AmountSplitting(address sender, address recipient1, address recipient2, uint amount);
	event Withdrawing(address recipient, uint amount);

    function Splitter() {
	owner = msg.sender;
	}

	function Split(address recipient1, address recipient2)
	public
	payable
	returns(bool success)
	{
	half = msg.value / 2;
	sender = msg.sender;
	balances[recipient1] += half;
	balances[recipient2] += half;
	leftOver = msg.value - 2 * half; 
	balances[msg.sender] = balances[msg.sender] += leftOver;
	AmountSplitting(sender, recipient1, recipient2, msg.value);
	return true;
	}

	function Withdraw() public returns(bool success){
	if(leftOver > 0) {
	msg.sender.transfer(leftOver);
	}
  	Withdrawing(msg.sender, leftOver);
  	return true;
	}
}