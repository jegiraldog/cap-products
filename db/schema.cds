namespace com.jegc;

using {
    cuid,
    managed
} from '@sap/cds/common';


entity Products : cuid, managed {
    //key ID               : UUID;
    Name             : String;
    Description      : String;
    ImageUrl         : String;
    ReleaseDate      : DateTime;
    DiscontinuedDate : DateTime;
    Price            : Decimal(16, 2);
    Height           : Decimal(16, 2);
    Width            : Decimal(16, 2);
    Depth            : Decimal(16, 2);
    Quantity         : Decimal(16, 2);
    UnitOfMeasure    : Association to UnitOfMeasures;
    Currency         : Association to Currencies;
    Category         : Association to Categories;
    Supplier         : Association to Suppliers;
    DimensionUnit    : Association to DimensionUnits;
    SalesData        : Association to many SalesData
                           on SalesData.Product = $self;
    Reviews          : Association to many ProductReview
                           on Reviews.Product = $self;

};

entity Orders : cuid {
    //key ID       : UUID;
    Date     : Date;
    Customer : String;
    Item     : Composition of many OrderItems
                   on Item.Order = $self;
}

entity OrderItems : cuid {
    //key ID       : UUID;
    Order    : Association to Orders;
    Product  : Association to Products;
    Quantity : Integer;
}

entity Suppliers : cuid, managed {
    //key ID         : UUID;
    Name       : String;
    Street     : String;
    City       : String;
    State      : String(2);
    PostalCode : String(5);
    Country    : String(3);
    Email      : String;
    Phone      : String;
    Fax        : String;
    Product    : Association to many Products
                     on Product.Supplier = $self;
};

entity Categories {
    key ID   : String(1);
        Name : String;
};

entity StockAvailability {
    key ID          : Integer;
        Description : String;
};

entity Currencies {
    key ID          : String(3);
        Description : String;
};

entity UnitOfMeasures {
    key ID          : String(2);
        Description : String;
};

entity DimensionUnits {
    key ID          : String(2);
        Description : String;
};

entity Months {
    key ID               : String(2);
        Description      : String;
        ShortDescription : String(3);
};

entity ProductReview : cuid, managed {
    //key ID        : UUID;
    Product   : Association to Products;
    CreatedAt : String;
    Name      : String;
    Rating    : Integer;
    Comment   : String;
};

entity SalesData : cuid, managed {
    //key ID            : UUID;
    DeliveryDate  : DateTime;
    Revenue       : Decimal(16, 2);
    Product       : Association to Products;
    Currency      : Association to Currencies;
    DeliveryMonth : Association to Months;
}
