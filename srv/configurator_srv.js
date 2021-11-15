const configurator_Kinds = cds.entities('configurator_Kinds');

module.exports = srv => {
   /* srv.on('READ', 'configurator_Kinds', async (feq, next) => {
        const items = await next();
        console.log("Implementation");
        return items.map(item => {
            if (item.name1 > 100) {
                item.name1 += ' SALE NOW ON!'
            }
            return "Hello";
        })

    })*/

   srv.after('CREATE', 'configurator_Kinds', (req) => {
        console.log("CreateAfter",req);
     //   const order = req.data
       // if (order.quantity > 11) throw 'Order quantity must not exceed 11'
    })

   srv.before('CREATE', 'configurator_Kinds', (req) => {
        //console.log("CreateBefore",req);
     //   const order = req.data
       // if (order.quantity > 11) throw 'Order quantity must not exceed 11'
    })

    srv.on('Count', async () => {
        return 99;
    })
}
