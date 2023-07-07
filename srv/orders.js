const cds = require("@sap/cds");
const { Orders } = cds.entities("com.training");

module.exports = (srv) => {
    srv.on("READ", "GetOrders", async(req) => {
        console.log(`Method: ${req.method}`);
        return await SELECT.from(Orders);
    });
};