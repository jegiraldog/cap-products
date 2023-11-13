using com.training as training from '../db/training';

service ManageOrders {
    type cancelOrderReturn {
        status  : String enum {
            Succeded;
            Failed
        };
        message : String
    };

    entity Orders as projection on training.Orders;
    function getClientTaxRate(clientEmail : String(65)) returns Decimal(4, 2);
    action   cancelOrder(clientEmail : String(65))      returns cancelOrderReturn;
}
