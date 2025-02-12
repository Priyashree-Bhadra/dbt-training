select 
    productid,
    productname,
    category,
    subcategory,
    sum(profit) as totalprofit
    from {{ ref('stg_orders') }}
    group by
    productid,
    productname,
    category,
    subcategory
