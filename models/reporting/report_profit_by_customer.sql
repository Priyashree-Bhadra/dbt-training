select 
    customerid,
    customername,
    segment,
    country,
    sum(profit) as totalprofit
    from {{ ref('stg_orders') }}
    group by
    customerid,
    customername,
    segment,
    country 
