contract token { function trasnfer(address receiver, uint amount){}

contract Crowdsale {
	address public beneficiary;
	uint public fundingGoal; uint public amountRaised; uint public deadline; uint public price;
	token public tokenReward;
	Funder[] public funders;
	event FundTransfer(address backer, uint amount, bool isContribution);
	bool crowdsaleClosed = false;

	/* data structure to hold information about campaign contributor */
	struct Funder {
		address addr;
		uint amount;
	}

	/* at initialization, setup the owner */
	function Crowdsale(
        address ifSuccessfulSendTo, 
        uint fundingGoalInEthers, 
        uint durationInMinutes, 
        uint etherCostOfEachToken, 
        token addressOfTokenUsedAsReward
    ) {
        beneficiary = ifSuccessfulSendTo;
        fundingGoal = fundingGoalInEthers * 1 ether;
        deadline = now + durationInMinutes * 1 minutes;
        price = etherCostOfEachToken * 1 ether;
        tokenReward = token(addressOfTokenUsedAsReward);
    }   

}