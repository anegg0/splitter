pragma solidity ^0.4.4;

contract Splitter {
	address owner;
	uint half;
	mapping (address => uint) public balances;
	event AmountSplitting(address recipient1, address recipient2, uint amount);

    function Splitter() {
	owner = msg.sender;
	}

	function Split(address recipient1, address recipient2)
	public
	payable
	returns(bool success)
	{
	half = msg.value / 2;
	balances[recipient1] += half;
	balances[recipient2] += half;
	AmountSplitting(recipient1, recipient2, msg.value);
	return true;
	}
}