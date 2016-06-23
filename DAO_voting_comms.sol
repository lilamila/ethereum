// DAO voting communications

proposalID

supportsProposal

// The race to empty postmortem notes : http://vessenes.com/deconstructing-thedao-attack-a-brief-code-tour/
//a function that can't be sent ether, but only called by token holders
function splitDAO (
	uint _proposalID,
	address _newCurator
	) noEther onlyTokenHolders returns (bool _success){
		// move ether and assign new Tokens
		uint fundsToBeMoved = 
			(balances[msg.sender] * p.splitData[0].splitBalance) /
			p.splitData[0].totalSupply;
		if
	(p.splitData[0].newDAO.createTokenProxy.value(fundsToBeMoved)
	(msg.sender) == false)
			throw;
		// Burn DAO Tokens
		Transfer(msg.sender, 0, balances[msg.sender]);
		withdrawRewardFor(msg.sender); //be nice, and get his rewards
		totalSupply -= balances[msg.sender];
		balances[msg.sender] = 0;
		paidOut[msg.sender] = 0;
		return true;

}