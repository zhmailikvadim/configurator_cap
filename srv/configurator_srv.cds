using app.configurator from '../db/configurator';

//@requires : 'authenticated-user'
service CatalogService {

    @odata.draft.enabled
    //@fiori.draft.enabled
    entity configurator_Kinds @(Capabilities : {
        DeleteRestrictions : {Deletable : true},
        InsertRestrictions : {Insertable : true},
        UpdateRestrictions : {Updatable : true}
    }) as projection on configurator.Kinds actions {
                              @sap.applicable.path : 'createModelEnabled'
                              //@cds.odata.bindingparameter.collection
        action createModel();
    };

    @odata.draft.enabled
    //@fiori.draft.enabled
    @Common.DraftRoot.ActivationAction : 'createModel'
    entity configurator_Models @(Capabilities : {
        DeleteRestrictions : {Deletable : true},
        InsertRestrictions : {Insertable : true},
        UpdateRestrictions : {Updatable : true}
    }) as projection on configurator.Models actions {
        action deleteModel();
    };

    @odata.draft.enabled
    //@fiori.draft.enabled
    entity configurator_Components @(Capabilities : {
        DeleteRestrictions : {Deletable : true},
        InsertRestrictions : {Insertable : true},
        UpdateRestrictions : {Updatable : true}
    }) as projection on configurator.Components;

    function Count() returns Integer;

}
