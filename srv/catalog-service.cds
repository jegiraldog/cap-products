using {com.jegc as jegc} from '../db/schema';

// service CatalogService {
//     entity Products          as projection on jegc.materials.Products;
//     entity Suppliers         as projection on jegc.sales.Suppliers;
//     entity Currencies        as projection on jegc.materials.Currencies;
//     entity DimensionUnits    as projection on jegc.materials.DimensionUnits;
//     entity Categories        as projection on jegc.materials.Categories;
//     entity SalesData         as projection on jegc.sales.SalesData;
//     entity Review            as projection on jegc.materials.ProductReview;
//     entity StockAvailability as projection on jegc.materials.StockAvailability;
//     entity UnitOfMeasures    as projection on jegc.materials.UnitOfMeasures;
//     entity Months            as projection on jegc.sales.Months;
//     entity Order             as projection on jegc.sales.Orders;
//     entity OrderItems        as projection on jegc.sales.OrderItems;
// }


define service CatalogService {

    entity Products          as
        select from jegc.materials.Products {
            ID,
            Name          as ProductName     @mandatory,
            Description                      @mandatory,
            ImageUrl,
            ReleaseDate,
            DiscontinuedDate,
            Price                            @mandatory,
            Height,
            Width,
            Depth,
            Quantity,
            UnitOfMeasure as ToUnitOfMeasure @mandatory,
            Currency      as ToCurrency      @mandatory,
            Category      as ToCategory      @mandatory,
            Category.Name as Category        @readonly,
            DimensionUnit as ToDimensionUnit,
            SalesData,
            Supplier,
            Reviews
        };

    @readonly
    entity Supplier          as
        select from jegc.sales.Suppliers {
            ID,
            Name,
            Email,
            Phone,
            Fax,
            Product as ToProduct
        };

    entity Reviews           as
        select from jegc.materials.ProductReview {
            ID,
            Name,
            Rating,
            Comment,
            createdAt,
            Product as Toproduct
        };

    @readonly
    entity SalesData         as
        select from jegc.sales.SalesData {
            ID,
            DeliveryDate,
            Revenue,
            Currency.ID               as CurrencyKey,
            DeliveryMonth.ID          as DeliveryMonthId,
            DeliveryMonth.Description as DeliveryMonth,
            Product                   as ToProduct
        };

    @readonly
    entity StockAvailability as
        select from jegc.materials.StockAvailability {
            ID,
            Description,
            Product as ToProduct
        };

    @readonly
    entity VH_Categories     as
        select from jegc.materials.Categories {
            ID   as Code,
            Name as Text
        };

    @readonly
    entity VH_Currencies     as
        select from jegc.materials.Currencies {
            ID          as Code,
            Description as Text
        };

    @readonly
    entity VH_UnitOfMeasure  as
        select from jegc.materials.UnitOfMeasures {
            ID          as Code,
            Description as Text
        };

    @readonly
    entity VH_DimensionUnits as
        select
            ID          as Code,
            Description as Text
        from jegc.materials.DimensionUnits;
}


define service MyService {

    entity SuppliersProduct  as
        select from jegc.materials.Products[Name = 'Bread']{
            *,
            Name,
            Description,
            Supplier.Address
        }
        where
            Supplier.Address.PostalCode = 98074;


    entity EntityInfix       as
        select Supplier[Name = 'Exotic Liquids'].Phone from jegc.materials.Products
        where
            Products.Name = 'Bread';

    entity EntityJoin        as
        select Phone from jegc.materials.Products
        left join jegc.sales.Suppliers as supp
            on(
                supp.ID = Products.Supplier.ID
            )
            and supp.Name = 'Exotic Liquids'
        where
            Products.Name = 'Bread';

};
