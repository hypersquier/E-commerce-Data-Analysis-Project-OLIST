SELECT 
  --Order information and time
  o.order_id,
  o.customer_id ,
  o.order_status,
  o.order_purchase_timestamp as Purchase_date,
  o.order_delivered_customer_date as delivered_date,
  TIMESTAMP_DIFF(o.order_delivered_customer_date, o.order_purchase_timestamp, DAY) AS delivery_time_days,

  --Sales and Product Information
  oi.price,
  oi.freight_value,
  p.product_category_name as product_category,
  p.product_id , 

  --Customer Information
  c.customer_unique_id,
  c.customer_state ,
  c.customer_city , 

  -- Seller Information
  s.seller_id ,
  s.seller_state,
  s.seller_city 

FROM
    `fgag-439510.Brazilian_ECommerce_Public_Dataset_by_Olist.olist_orders` AS o
join  
     `fgag-439510.Brazilian_ECommerce_Public_Dataset_by_Olist.olist_order_items_dataset` as oi
      ON o.order_id = oi.order_id
join 
      `fgag-439510.Brazilian_ECommerce_Public_Dataset_by_Olist.olist_customers` as c

      ON o.customer_id = c.customer_id
join  
      `fgag-439510.Brazilian_ECommerce_Public_Dataset_by_Olist.olist_products` AS p 
       ON oi.product_id = p.product_id
join
    `fgag-439510.Brazilian_ECommerce_Public_Dataset_by_Olist.olist_sellers` AS s
    ON oi.seller_id = s.seller_id
