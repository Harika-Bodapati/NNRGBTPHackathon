namespace com.satinfotech.electronics;
using { cuid , managed } from '@sap/cds/common';

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
     @title: 'Is_gstn_registered'
     Is_gstn_registered:Boolean default false;
     @title: 'GSTIN number'
     gst_no: String(20);
     @title: 'Is Vendor'
     vendor:Boolean default false;
     @title: 'Is Customer'
     customer:Boolean default false;
}

entity Product {
    key ID: UUID;
    @title: 'Product ID'
    p_id           : String(20); 
    @title: 'Product Name'
    name     : String(100);
    @title: 'Product Image URL'
    imageURL        : String(255);
    @title: 'Product Cost Price'
    costPrice       : Decimal(15, 2); 
    @title: 'Product Sell Price'
    sellPrice       : Decimal(15, 2); 
}

@cds.persistence.skip
entity State {
    @title:'code'
    key code: String(3);
    @title:'description'
    description:String(10);
    
}
entity Stock {
    key ID            : UUID;
    @title:'Store ID'
    storeId         : Association to Store;
    @title:'Product ID'
    productId       : Association to Product;
    @title:'Stock Quantity'
    stock_qty        : Integer;
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
