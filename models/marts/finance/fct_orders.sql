with customers as (
    select * from {{ref('stg_jaffle_shop__customers')}}
),
orders as (
    select * from {{ref('stg_jaffle_shop__orders')}}
),
payments as (
    select * from {{ ref('stg_stripe__payments') }}
),
order_amounts as (
    select 
        order_id,
        sum(nvl(amount,0)) as amount
    from payments
    where status = 'success'
    group by order_id
),
final as (
select
    orders.order_id,
    orders.customer_id,
    order_amounts.amount
from orders
     left join order_amounts using(order_id)
)
select * from final