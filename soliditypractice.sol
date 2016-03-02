Solidity practice

contract ValueStorage {
		uint value;
		function set(uint newValue) {
			value = newValue;
		}
		function get() returns (uint val) {
			return value;
		}
}

contract Coin {
	mapping(address => uint) balances;
	function Coin(uint initial) {
		var miner
	}
}

contract mortal {
    /* Define variable owner of the type address*/
    address owner;

    /* this function is executed at initialization and sets the owner of the contract */
    function mortal() { owner = msg.sender; }

    /* Function to recover the funds on the contract */
    function kill() { if (msg.sender == owner) suicide(owner); }
}

contract greeter is mortal {
    /* define variable greeting of the type string */
    string greeting;

    /* this runs when the contract is executed */
    function greeter(string _greeting) public {
        greeting = _greeting;
    }

    /* main function */
    function greet() constant returns (string) {
        return greeting;
    }
}


