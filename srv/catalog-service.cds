using {com.jegc as jegc} from '../db/schema';

service CatalogService {
    entity Products          as projection on jegc.Products;
    entity Suppliers         as projection on jegc.Suppliers;
    entity Currencies        as projection on jegc.Currencies;
    entity DimensionUnits    as projection on jegc.DimensionUnits;
    entity Categories        as projection on jegc.Categories;
    entity SalesData         as projection on jegc.SalesData;
    entity Review            as projection on jegc.ProductReview;
    entity StockAvailability as projection on jegc.StockAvailability;
    entity UnitOfMeasures    as projection on jegc.UnitOfMeasures;
    entity Months            as projection on jegc.Months;
    entity Order             as projection on jegc.Orders;
    entity OrderItems        as projection on jegc.OrderItems;


}
