with

orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
),

final as (
    select
        orders.customer_id,
        orders.order_id,
        sum(payments.amount)
    from orders
    left join payments on orders.order_id = payments.order_id
    where payments.status = 'success'
    group by 1, 2
)

select * from final
