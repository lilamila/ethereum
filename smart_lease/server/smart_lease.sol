/* needed logic

features:
1. ability for tenants to apply for credit check
2. contract where people sign lease
	amount on lease
	duration of lease
3. tenants fulfill monthly payments
	if not then severity of legal action upon 
	1 week overdue
	30 days overdue
	60 days overdue
	system takes x% fee per transaction to pay for gas and to smart contract owner
4. feedback system for tenants - chip in dishwasher, fridge, shower other connected items in house
*/

contract SmartLease  {
	mapping (address => uint) public coinBalanceOf;
    uint monthlyRent;
    uint monthsDuration;
    bool leaseCompleted = false;
    token addressOfTokenUsedForRent

    event StartLease(address tenant, address landlord, uint date);

    struct Landlord {
        address public landlord;

    }
    /* data structure to hold information about lease tenants*/
    struct Tenant {
    	address public tenant;
        uint amount
    	bool approved = false;
    }

    /* at initialization, setup the landlord */
    function SmartLease(
        address ifLeaseSignedSendTo,
        uint monthlyRentInEthers,
        uint monthsDuration, //set to array
        uint etherCostofTenantSigning,
        token addressOfTokenUsedForRent
        ){
        landlord = ifLeaseSignedSendTo;
        monthlyRent = monthlyRentInEthers * 1 ether;
        deadlines[] =  //iterate loop to for payment schedule
        signingPrice = etherCostofTenantSigning * 1 ether;
        tokenReimbursement = token(addressOfTokenUsedForReimbursement);
    }
    /* The anonymous function is the default called whenever anyone sends funds to the contract */
    function () {
        if (leaseCompleted) throw;
        uint amount = msg.value;
        tenants[tenants.length++] = Tenant({addr: msg.sender, amount: amount});
        amountPaid += amount;
        tokenReimbursement.transfer(msg.sender, amount/price)
        StartLease(msg.sender, Landlord(), now)
    }
    
    /* lease signing */
    function signLease(string _signature) public {
        signature = _signature;
    }

    event signLease(address tenant, address landlord, string _signature);

    token.sendCoin.sendTransaction(eth.accounts[1], 1000, {from: eth.accounts[0]})

    /* monthly payment function takes timestamp as argument */
    function payRent(address landlord, uint _monthlyRent) returns(bool sufficient) {
        if (coinBalanceof[msg.sender] < _monthlyRent) return false;
        //add if statement to ensure monthlyRent payment not already paid for month
        //add timestamp to payment(?)
        coinBalanceOf[msg.sender] -= _monthlyRent;
        coinBalanceOf[landlord] += _monthlyRent;
        leasePayment(msg.sender, landlord, _monthlyRent); 
        return true;
}

	event leasePayment(address tenant, address landlord, uint monthlyRent);



contract token { function transfer(address receiver, uint amount){  } }


contract smartLease {
    address public beneficiary;
    uint public fundingGoal; uint public amountRaised; uint public deadline; uint public price;
    token public tokenReward;   
    Funder[] public funders;
    event FundTransfer(address backer, uint amount, bool isContribution);
    bool smartLeaseClosed = false;

    /* data structure to hold information about campaign contributors */
    struct Funder {
        address addr;
        uint amount;
    }

    /*  at initialization, setup the owner */
    function smartLease(
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

    /* The function without name is the default function that is called whenever anyone sends funds to a contract */
    function () {
        if (smartLeaseClosed) throw;
        uint amount = msg.value;
        funders[funders.length++] = Funder({addr: msg.sender, amount: amount});
        amountRaised += amount;
        tokenReward.transfer(msg.sender, amount / price);
        FundTransfer(msg.sender, amount, true);
    }

    modifier afterDeadline() { if (now >= deadline) _ }

    /* checks if the goal or time limit has been reached and ends the campaign */
    function checkGoalReached() afterDeadline {
        if (amountRaised >= fundingGoal){
            beneficiary.send(amountRaised);
            FundTransfer(beneficiary, amountRaised, false);
        } else {
            for (uint i = 0; i < funders.length; ++i) {
              funders[i].addr.send(funders[i].amount);  
              FundTransfer(funders[i].addr, funders[i].amount, false);
            }               
        }

        beneficiary.send(this.balance); // send any remaining balance to beneficiary anyway
        smartLeaseClosed = true;
    }
}


