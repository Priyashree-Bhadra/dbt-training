select
    p.productid, 
    p.productname, 
    p.category,
    p.subcategory,
    c.customerid, 
    c.customername, 
    c.segment, 
    c.country,
    o.orderdate,
    o.orderid,
    o.shipdate,
    o.ordercostprice,
    o.ordersellingprice,
    {{markdown('ordersellingprice','ordercostprice')}} as markdown,
    o.ordersellingprice-o.ordercostprice as profit
from {{ ref('raw_orders') }} as o 
left join {{ ref('raw_customer') }} as c on o.customerid=c.customerid
left join {{ ref('raw_product') }} as p on o.productid=p.productid
