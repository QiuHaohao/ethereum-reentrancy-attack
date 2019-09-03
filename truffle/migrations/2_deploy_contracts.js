var Bank = artifacts.require("Bank");
var Attacker = artifacts.require("Attacker");

module.exports = function(deployer) {
	deployer.deploy(Bank).then(function(bank) {
		return deployer.deploy(Attacker, bank.address)
	});
};

