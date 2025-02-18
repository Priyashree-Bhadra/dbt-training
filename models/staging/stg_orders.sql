select
    {{ dbt_utils.generate_surrogate_key(['o.orderid', 'c.customerid','p.productid']) }} as stg_key,
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
    o.ordercostprice as ordercostprice,
    o.ordersellingprice as ordersellingprice,
    o.ordersellingprice-o.ordercostprice as profit,
    {{ markup('ordersellingprice','ordercostprice')}} as markup,
    d.delivery_team as delivery_team
from {{ ref('raw_orders') }} as o 
left join {{ ref('raw_customer') }} as c on o.customerid=c.customerid
left join {{ ref('raw_product') }} as p on o.productid=p.productid
left join {{ ref('delivery_team') }} as d on o.shipmode=d.shipmode