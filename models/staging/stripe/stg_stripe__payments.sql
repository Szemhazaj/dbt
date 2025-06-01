select 
    id as payment_id,
    orderid as order_id,
    paymentmethod,
    status,
    -- convert cents to dollars
    amount/100 as amount,
    created
from {{ source('stripe', 'payment') }}