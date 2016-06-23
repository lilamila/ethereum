import Web3 from 'web3';
import marked from 'marked';
import angular from 'angular';
import ngMaterial from 'angular-material';
import ngAnimate from 'angular-animate';
import ngMessages from 'angular-messages';
import ngSanitize from 'angular-sanitize';
import Identicon from 'identicon.js/identicon';
import Connector from './loader';
import collapse from './collapse';
window.Identicon = Identicon;
import 'angular-identicon/dist/angular-identicon';
import Chart from 'chart.js';
import AngularChart from 'angular-chart.js/dist/angular-chart';
window.AngularChart = AngularChart;
window.Chart = Chart;

var landlord =  //get submission from UI
var tenant = //get submission from UI

var smartLeaseContract = web3.eth.contract([{"constant":false,"inputs":[],"name":"kill","outputs":[],"type":"function"},{"inputs":[],"type":"constructor"}]);
var smartLease = smartLeaseContract.new(
		landlord, tenant)


// compile the source code
web3.eth.compile.solidity(soliditySource)






(function(){
  
   var connector = new Connector(window.web3, window.location.hash);
   var web3      = connector.web3;
   var address   = connector.address;
   var now       = new Date();

// define main-controller
function leaseContractCtrl( $scope, $mdDialog, $parse, $filter, $http, $sce) {

   var defaultAccounts = connector.accounts;
   $scope.account   = defaultAccounts[0];            // address of the user to send the transaction from.
   $scope.accounts  = defaultAccounts;               // the list of users accounts                    
   $scope.filter    = { active:true, split: false};  // filter the proposal list 
   $scope.total     = 1;                             // total Supply
   $scope.leaseContract = [];                           // loaded leaseContracts
   $scope.isMist    = connector.isMist;
   $scope.address   = address;
   $scope.warning   = "";

   // called, when selecting a leaseContract 
   $scope.showLeaseContract = function(p,ev) {           
      $scope.currentLeaseContract=p;
      p.chartData = p._chartData;
      
      // if this leaseContract was taken from the cache we need to load the current values
      if (p.needsUpdate) loadLeaseContract(p.id, refresh); 
         
      if (!p.gasNeeded[$scope.account] && connector.isMist) {
        // we need to check, if the user already voted. We do this, by calling the vote-function without a transaction and checking if all the gas is used, which means
        // a error was thrown ans so the user is not allowed to vote.
        var gas = 0x999999;
        web3.eth.estimateGas({ to: address, data: buildVoteFunctionData(p.id,true), from: $scope.account, gas: gas, }, function(err,data) {
            console.log("checking vote for "+p.id+" (account="+$scope.account+"):"+data+"<"+gas);
           // only if the estimated gas is lower then the given we knwo it would be succesful, otherwise all the gas is used, because a exception is thrown.
           p.enabled   = data < gas && $scope.account!=address; // it is only allowed if no error was thrown and if we didn't use the address-account, which is simply used as fallback for showing as readonly.
           p.gasNeeded[$scope.account] = data;
           refresh();
        });
      }
   };

