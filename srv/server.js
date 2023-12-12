const cds = require("@sap/cds");
const cors = require('cors');
const adapterProxy = require("@sap/cds-odata-v2-adapter-proxy");

cds.on("bootstrap", (app) =>{
    app.use(adapterProxy());
    app.use(cors());
    app.get("/alive", (_, res) =>{
        res.status(200).send("Server is Alive");
    });
});


if(process.env.NODE_ENV != "production"){
    console.log("NODE_ENV", process.env.NODE_ENV);
    require("dotenv").config();
}

module.exports = cds.server;