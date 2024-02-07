const cds = require('@sap/cds');
module.exports = cds.service.impl(function () {

    const { Business_Partner, State } = this.entities();
    this.on(['READ'], State, async(req) => {
        states = [
            {"code":"AP", "description":"Andhra Pradesh"},
            {"code":"GA", "description":"Goa"},
            {"code":"JK", "description":"Jammu and Kashmir"},
            {"code":"KA", "description":"Karnataka"},
            {"code":"KL", "description":"Kerala"},
            {"code":"MP", "description":"Madhya Pradesh"},
            {"code":"MH", "description":"Maharashtra"},
            {"code":"TN", "description":"Tamil Nadu"},
            {"code":"TS", "description":"Telangana"},
        ]
          states.$count=states.length;
          return states;
        });
});