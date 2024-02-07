namespace com.satinfotech.electronics;
using { managed, cuid } from '@sap/cds/common';

@assert.unique:{
bpn:[bpn]
}
entity Business_Partner: cuid, managed {
     @title: 'Business Partner Number'
     bpn:String(10);
     @title: 'Name'
     name: String(20) @mandatory;
     @title: 'Address1'  
     addr1:String(40)  @mandatory;
     @title: 'Address2'
     addr2:String(30)   @mandatory;
     @title:'City'
     city:String(40)   @mandatory;
     @title: 'State'
     state:String(40)  @mandatory;
     @title: 'PIN Code'
     pin: String(20)    @mandatory;
}

@cds.persistence.skip
entity State{ 
     @title: 'code'
     key code:String(10);
     @title: 'description'  
     description: String(50);
}

entity Store : cuid, managed {
    @title: 'Store ID'
    store_ID: String(20) @mandatory;
    @title: 'Name'
    name: String(20) @mandatory;
    @title: 'Address1'  
    address1:String(40)  @mandatory;
    @title: 'Adress2'
    address2:String(30)   @mandatory;
    @title:'City'
    city:String(40)   @mandatory;
    @title: 'State'
    state:String(30)  @mandatory;
    @title: 'PIN Code.'
    pin_code: String(20)    @mandatory;
}
