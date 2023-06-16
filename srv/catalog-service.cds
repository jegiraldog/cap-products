using {com.jegc as jegc} from '../db/schema';

service CatalogService {
    entity Products as projection on jegc.Products;
    entity Suppliers         as projection on jegc.Suppliers;
    entity Categories        as projection on jegc.Categories;
    entity StockAvailability as projection on jegc.StockAvailability;
    entity Currencies        as projection on jegc.Currencies;
    entity UnitOfMeasures    as projection on jegc.UnitOfMeasures;
    entity DimensionUnits    as projection on jegc.DimensionUnits;
    entity Months            as projection on jegc.Months;
    entity ProductReview     as projection on jegc.ProductReview;
    entity SalesData         as projection on jegc.SalesData;
}
