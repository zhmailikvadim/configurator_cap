const configurator_Kinds = cds.entities('configurator_Kinds');
const colors = require("colors");

module.exports = srv => {

    //console.log(srv);
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
        console.log("CreateAfter", req);
        //   const order = req.data
        // if (order.quantity > 11) throw 'Order quantity must not exceed 11'
    })

    srv.before('CREATE', 'configurator_Kinds', (req) => {
        console.log("CreateBefore",req);
        //   const order = req.data
        // if (order.quantity > 11) throw 'Order quantity must not exceed 11'
    })

    srv.on('Count', async () => {
        return 99;
    })
    srv.after('READ', 'configurator_Models', xs => {
        console.log('Read models', xs);

    })

        srv.before('READ', 'configurator_Models', req => {
        //console.log('Read models', req);

    })

    srv.on('createModel', async(req)=>{
        console.log('CreateModelReq', req.target
        );
    })

    srv.before("*", req =>{
        console.log(`Method: ${req.method}`.yellow.inverse);
        console.log(`Target: ${req.target.name}`.yellow.inverse);
    })

}
