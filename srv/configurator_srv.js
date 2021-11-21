//const configurator_Kinds = cds.entities('configurator_Kinds');
//const configurator_Models = cds.entities('configurator_Models');
//const colors = require("colors");

module.exports = cds => {

    //console.log(cds);
    /* cds.on('READ', 'configurator_Kinds', async (feq, next) => {
         const items = await next();
         console.log("Implementation");
         return items.map(item => {
             if (item.name1 > 100) {
                 item.name1 += ' SALE NOW ON!'
             }
             return "Hello";
         })
 
     })*/

    cds.after('CREATE', 'configurator_Kinds', (req) => {
        console.log("CreateAfter");
        //   const order = req.data
        // if (order.quantity > 11) throw 'Order quantity must not exceed 11'
    })

    cds.before('CREATE', 'configurator_Kinds', (req) => {
        console.log("CreateBefore");
        //   const order = req.data
        // if (order.quantity > 11) throw 'Order quantity must not exceed 11'
    })

    cds.on('Count', async () => {
        return 99;
    })
    cds.after('READ', 'configurator_Models', xs => {
        console.log('Read models after');

    })

    cds.before('READ', 'configurator_Models', req => {
        console.log('Read models before', req);

    })

    cds.on('createModel', async (req,) => {
        //console.log('Create Model',req);
        //console.log('CreateModelReq',  await cds.tx(req).run (SELECT.from(req.target).columns('*')));
        //console.log('Target',  req.target);
        console.log('Params',req.params);
        const idKind = await req.params[0].ID;
        console.log('ID',  idKind);
        const db = cds.transaction(req);
        //console.log('transaction', db);
        let { configurator_Models } = cds.entities;
        //console.log(configurator_Models1);
        //const result = await db.read(configurator_Models).where({ ID_kind_ID: idKind });
        //console.log(result);
        //const result2= await db.update `${configurator_Models}`.with({ description: 'update v1' }).where({ ID_kind_ID: idKind });
       // console.log('Result insert',result_insert);
       // let result1 = await cds.create('CatalogService.configurator_Models').entries({ ID_kind_ID: idKind, name:'New entry'});
        //let result1 = await INSERT.into `${configurator_Models}`.entries({ID_kind_ID : idKind, name : 'New entry'});
        let result2 = await UPDATE(configurator_Models).where `ID_kind_ID=${idKind}`.with `description=${'Updated entry1'}`;
        console.log('Result2',result2);

    })

    cds.before("*", req => {
        //console.log(`Method: ${req.method}`.yellow.inverse);
        //console.log(`Target: ${req.target.name}`.yellow.inverse);
    })

}
