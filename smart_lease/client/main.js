import { Template } from 'meteor/templating';
import { ReactiveVar } from 'meteor/reactive-var';

import './main.html';


if (Meteor.isClient) {
	// define Sessions
	Session.setDefault('latestBlock', {hello:'testing'}); // updated by the 'latestBlock' function in connector.js
	
	// helpers enable use on html
	Template.body.helpers({
		leases: [
			{ physAddress: "286 Gangsters"}, // TODO attach to EVM /or Blockstack
			{ physAddress: "The Villager"},
			{ physAddress: "Milton Mansion"}
			]
		});

	Template['blockchainStatus'].helpers({
		currentBlock: function () {
			return JSON.stringify(Session.get('latestBlock'), null, 2);
		}
	});
}

if (Meteor.isServer) {
	Meteor.startup(function () {

	});
}



// Template['getContractsByUser'].helpers({

// });

// Template['createNewLease'].events({
//   'click button.create': function (e, template) {
//     alert(template.find('input').value +)
//   }


// };

// Template.hello.onCreated(function helloOnCreated() {
//   // counter starts at 0
//   this.counter = new ReactiveVar(0);
// });

// Template.hello.helpers({
//   counter() {
//     return Template.instance().counter.get();
//   },
// });

// Template.hello.events({
//   'click button'(event, instance) {
//     // increment the counter when button is clicked
//     instance.counter.set(instance.counter.get() + 1);
//   },
// });
