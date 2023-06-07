using {com.jegc as jegc} from '../db/schema';

service CustomerService {
    entity CustomerSrv as projection on jegc.Customer;
}
