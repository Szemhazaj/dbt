select 
    id,
    orderid,
    paymentmethod,
    status,
    amount,
    created
from {{ source('stripe', 'payment') }}