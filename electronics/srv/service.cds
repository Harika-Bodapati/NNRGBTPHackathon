using { com.satinfotech.electronics as db} from '../db/schema';

service ElectronicsDB {
    entity Business_Partner as projection on db.Business_Partner;
    entity Store as projection on db.Store;
    entity State as projection on db.State;
}

annotate ElectronicsDB.Business_Partner with @odata.draft.enabled;
annotate ElectronicsDB.Store with @odata.draft.enabled;

annotate ElectronicsDB.Business_Partner with {
    pin     @assert.format: '^\d{6}$';

}

annotate ElectronicsDB.State with @(
    UI.LineItem: [
       {
            $Type : 'UI.DataField',
            Value : code
        },
        {
            $Type : 'UI.DataField',
            Value : description
        },  
    ],
);

annotate ElectronicsDB.Business_Partner with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : bpn
        },     
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Value : addr1
        },
        {
            $Type : 'UI.DataField',
            Value : addr2
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : state
        },
        {
            $Type : 'UI.DataField',
            Value : pin
        }, 
    ],
    UI.SelectionFields: [ bpn ],       

    UI.FieldGroup #BPN : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : bpn,
            },
            {
                $Type : 'UI.DataField',
                Value : name,
            },            
            {
                $Type : 'UI.DataField',
                Value : addr1,
            },
            {
                $Type : 'UI.DataField',
                Value : addr2,
            },
            {
                $Type : 'UI.DataField',
                Value : city,
            },
            {
                $Type : 'UI.DataField',
                Value : state,
            },
            {
                $Type : 'UI.DataField',
                Value : pin,
            }, 

        ],
    },

    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'BPInfoFacet',
            Label : 'BP Information',
            Target : '@UI.FieldGroup#BPN',
        },
    ],    
);

annotate ElectronicsDB.Business_Partner with {
    state @(     
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'State',
            CollectionPath : 'State',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : state,
                    ValueListProperty : 'code'
                },

                {

                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description'
                }
            ]
        }
    );
};