using app.configurator from '../db/configurator';

//@requires : 'authenticated-user'
service CatalogService {

    @odata.draft.enabled
    //@fiori.draft.enabled
    entity configurator_Kinds @(Capabilities : {
        Deletable  : true,
        Insertable : true,
        Updatable  : true,
    }) as projection on configurator.Kinds{*,} actions {
                              @sap.applicable.path : 'createModelEnabled'
        action createModel();
    };

    @odata.draft.enabled
    //@fiori.draft.enabled
    entity configurator_Models @(Capabilities : {
        Deletable  : true,
        Insertable : true,
        Updatable  : true,
    }) as projection on configurator.Models{*,} actions {
        action deleteModel();
    };

    @odata.draft.enabled
    //@fiori.draft.enabled
    entity configurator_Components @(Capabilities : {
        Deletable  : true,
        Insertable : true,
        Updatable  : true,
    }) as projection on configurator.Components {*,};

    function Count() returns Integer;

}
