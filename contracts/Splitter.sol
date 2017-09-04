pragma solidity ^0.4.4;

	mapping (address => uint) balances;
	address public bob;
    address public carol;

    function Splitter(address bobAddress, address carolAddress) {
        bob = bobAddress;
        carol = carolAddress;
	}

}
