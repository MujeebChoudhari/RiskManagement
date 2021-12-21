using riskmanagement as rm from '../db/schema';


// Annotate Risk Element
annotate rm.Risks with {
    ID @title : 'Risk';
    title @title : 'Title';
    owner @title : 'Owner';
    prio @title : 'Priority';
    descr @title : 'Description';
    miti @title : 'Mitigation';
    impact @title : 'Impact';    
    //### BEGIN OF INSERT
bp @title : 'Business Partner';
//### END OF INSERT
criticality @title : 'Criticality';
}

// Annotate Mitigation Elements
annotate rm.Mitigations with {
    
    ID @( UI.Hidden, commong : {Text : descr});
    owner @title : 'Owner';
    descr @title : 'Description';
}

annotate rm.BusinessPartners with {
BusinessPartner @(
UI.Hidden,
Common : {Text : LastName}
);
LastName @title : 'Last Name';
FirstName @title : 'First Name';
}

annotate rm.Risks with {
    miti @( common : {

Text : miti.descr,
TextArragement : #TextOnly,
ValueList : {
    Label : 'Mitigations',
    CollectionPath : 'Mitigations',
    Parameters : [
        {
         $Type : 'Common.ValueListParameterInOut',
         LocalDataProperty : miti_ID,
         ValueListProperty : 'ID'
        },
        {
         $Type : 'Common.ValueListParameterDisplayOnly',
         ValueListProperty : 'descr'
        }
    ]
}

    });

bp @(Common : {
Text : bp.LastName,
TextArrangement : #TextOnly,
ValueList : {
Label : 'Business Partners',
CollectionPath : 'BusinessPartners',
Parameters : [
{$Type : 'Common.ValueListParameterInOut',
LocalDataProperty : bp_BusinessPartner,
ValueListProperty : 'BusinessPartner'
},
{$Type : 'Common.ValueListParameterDisplayOnly',
ValueListProperty : 'LastName'
},
{$Type : 'Common.ValueListParameterDisplayOnly',
ValueListProperty : 'FirstName'
}]}}
)

}



