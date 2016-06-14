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

