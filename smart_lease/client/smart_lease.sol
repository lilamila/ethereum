// set up personas
contract user {

    address public owner;

    function user(){
        owner = msg.sender;
        }

    function kill(){
        suicide(owner);
    }

}

contract Tenant is user {
    string public tenantName;

    mapping(address=>Lease) public leases;

    struct Lease{
        bool active;
        uint lastUpdate;
        uint256 rent;
    }

    function Tenant(string _name){
        tenantName = _name;
    }


    function registerToLandlord(address _landlordAddress) onlyOwner{

        leases[_landlordAddress] = Lease({
            active: true,
            lastUpdate: now,
            rent: 0
            });
    }


    function setRent(uint256 _rent){
        if(leases[msg.sender].active){
                leases[msg.sender].lastUpdate = now;
                leases[msg.sender].rent = _rent;
            }else{
                throw;
            }
    }

    function payRent(address _landlordAddress){
        _landlordAddress.send(leases[_landlordAddress].rent);

    }

    function endLease(address _landlordAddress){
        if(leases[_landlordAddress].debt == 0){
            leases[_landlordAddress].active = false;

            }else{
                throw;
            }
    }
}

contract Landlord is user {

    string public landlordName;
    string public physicalAddress;

    function Landlord(
        string _name,
        string _physicalAddress){

        landlordName = _name;
        physicalAddress = _physicalAddress;
    }

    function setRent(uint256 _rent, address _tenantAddress){

        Tenant person = Tenant(_tenantAddress);
        person.setRent(_rent);

    }
}

