using app.configurator from '../db/configurator';

//@requires : 'authenticated-user'
service CatalogService {

    @odata.draft.enabled
    entity configurator_Kinds @(Capabilities : {
        InsertRestrictions : {Insertable : true},
        UpdateRestrictions : {Updatable : true},
        DeleteRestrictions : {Deletable : true}
    }) as projection on configurator.Kinds;

    @odata.draft.enabled
    entity configurator_Models @(Capabilities : {
        InsertRestrictions : {Insertable : true},
        UpdateRestrictions : {Updatable : true},
        DeleteRestrictions : {Deletable : true}
    }) as projection on configurator.Models;

    @odata.draft.enabled
    entity configurator_Components @(Capabilities : {
        InsertRestrictions : {Insertable : true},
        UpdateRestrictions : {Updatable : true},
        DeleteRestrictions : {Deletable : true}
    }) as projection on configurator.Components;

    function Count() returns Integer;

}
