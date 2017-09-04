pragma solidity ^0.4.4;

contract Splitter {
	address bob;
    address carol;
	uint share;
// 	uint boBalance;
	uint payment;

	mapping (address => uint) balances;

    function Splitter(address _bob, address _carol) {
        bob = _bob;
        carol = _carol;
	}
	
    function Balance() returns(uint balance) {
     return  bob.balance;
	}

	function Split(uint payment)
	public
	payable
	returns (uint share)
	 {
		share = msg.value / 2;
		return share;
	}

}
