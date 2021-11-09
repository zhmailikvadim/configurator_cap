namespace app.configurator;

type Name : String(50);
type LDescription : String(500);

entity Kinds {
    key ID     : UUID;
        name   : Name;
        models : Association to many Models
                     on models.ID_kind = $self;

};

entity Models {
    key ID         : UUID;
    key ID_kind    : Association to Kinds;
        name       : Name;
        components : Association to many Components
                         on components.ID_model = $self;
};

entity Components {
    key ID          : UUID;
    key ID_model    : Association to Models;
        name        : Name;
        description : LDescription;

}
