pragma solidity ^0.4.4;

contract Splitter {
	address public bob;
    address public carol;

	mapping (address => uint) balances;

    function Splitter(address bobAddress, address carolAddress) {
        bob = bobAddress;
        carol = carolAddress;
	}

}
