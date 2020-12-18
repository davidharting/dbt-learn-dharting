with final as (
    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status,
        amount / 100 as amount, -- Converting cents to dollars
        created as created_on,
        _batched_at
    from raw.stripe.payment
)

select * from final