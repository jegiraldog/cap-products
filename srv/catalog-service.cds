using {com.jegc as jegc} from '../db/schema';

service CatalogService {
    entity Products as projection on jegc.Products;
}
