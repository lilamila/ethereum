// can be run on server or client, if run on client, creates minimongo connection (only in memory/local storage)
Deposits = new Mongo.Collection('deposits', {connection:null});
new PersistentMinimongo(Deposits);