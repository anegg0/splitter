pragma solidity ^0.4.4;

contract Splitter {
	address public bob;
    address public carol;
	mapping (address => uint) public accounts;
	uint amountAfterSplit;
	event AmountSplitting(uint indexed amount, uint indexed splitAmount);
	// event Halfing(uint256 splitAmount);

    function Splitter(address _bob, address _carol) {
        bob = _bob;
        carol = _carol;
	}

	function Split()
	public
	payable
	returns(uint splitAmount)
	{
	amountAfterSplit = msg.value / 2;
	AmountSplitting(msg.value, amountAfterSplit);
	return amountAfterSplit;
	}

	function shareSplit() {
		accounts[bob] = accounts[bob] += amountAfterSplit;
		accounts[carol] = accounts[carol] += amountAfterSplit;
	}

	function getBalance(address addr) returns(uint) {
	return accounts[addr];
	}

		function getBalanceBob() returns(uint) {
	return accounts[bob];
	}
}