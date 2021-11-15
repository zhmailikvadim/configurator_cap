using CatalogService as my from '../../srv/configurator_srv';

annotate my.configurator_Kinds {
    ID          @readonly;
    name        @title : 'Name';
    description @title : 'Description';
    to_models   @Common.Composition;
}

annotate my.configurator_Kinds with @UI : {
    PresentationVariant            : {
        Text           : 'Default',
        Visualizations : ['@UI.LineItem'],
        SortOrder      : [{
            $Type      : 'Common.SortOrderType',
            Property   : name,
            Descending : false
        }]
    },
    Identification                 : [
        {Value : name},
        {Value : description},
    ],
    SelectionFields                : [
        name,
        description
    ],
    HeaderInfo                     : {
        TypeName       : 'Kind',
        TypeNamePlural : 'Kinds',
        Title          : {
            $Type : 'UI.DataField',
            Value : name
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : description
        }
    },
    LineItem                       : [
        {Value : name},
        {Value : description},
    ],
    Facets                         : [
        {
            $Type  : 'UI.CollectionFacet',
            Label  : '{i18n>Booking}',
            ID     : 'Kind',
            Facets : [
                { // booking details
                    $Type  : 'UI.ReferenceFacet',
                    ID     : 'KindData',
                    Target : '@UI.FieldGroup#Kind',
                    Label  : 'Kind'
                },
                {
                    $Type  : 'UI.ReferenceFacet',
                    Label  : '{i18n>administrativeData}',
                    Target : '@UI.FieldGroup#AdministrativeData'
                },
            ]
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Target : 'children',
            Label  : '{i18n>Models}'
        }
    ],
    FieldGroup #Kind               : {
        $Type : 'UI.FieldGroupType',
        Label : 'Kind',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : name
            },
            {
                $Type : 'UI.DataField',
                Value : description
            },
        ]
    },
    FieldGroup #AdministrativeData : {
        Label : '{i18n>administrativeData}',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : LastChangedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : LastChangedBy,
            }
        ]
    }
};
