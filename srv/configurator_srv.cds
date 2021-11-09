using app.configurator from '../db/configurator';

service CatalogService {

entity configurator_Kinds as projection on configurator.Kinds;
entity configurator_Models as projection on configurator.Models;
entity configurator_Components as projection on configurator.Components;

}
