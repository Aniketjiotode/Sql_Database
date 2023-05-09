select * from production.products

select * from production.brands

--Innerjoins

select production.products.product_name,production.brands.brand_name from production.products inner join production.brands
on production.products.brand_id = production.brands.brand_id

SELECT    product_name, category_name, brand_name FROM   production.products p INNER JOIN production.categories c ON c.category_id = p.category_id
INNER JOIN production.brands b ON b.brand_id = p.brand_id

--Leftjoins

SELECT  product_name,order_id FROM production.products p LEFT JOIN sales.order_items o ON o.product_id = p.product_id ORDER BY  order_id;

--Rigthjoins

SELECT  product_name,order_id FROM production.products p Right JOIN sales.order_items o ON o.product_id = p.product_id ORDER BY  order_id;

--outerjoins
SELECT  product_name,order_id FROM production.products p full outer JOIN sales.order_items o ON o.product_id = p.product_id ORDER BY  order_id;

--selfjoins

SELECT    p.product_name FROM   production.products p INNER JOIN production.products c ON c.category_id = p.category_id

--crossjoin

SELECT  product_name,order_id FROM production.products cross JOIN sales.order_items 


--Subquery

--non-correlated

SELECT    order_date, customer_id FROM  sales.orders WHERE customer_id 
IN (
        SELECT
            customer_id
        FROM
            sales.customers
        WHERE
            city = 'New York'
    )

-- correlated

SELECT   product_name,list_price, category_id FROM production.products p1 WHERE  list_price 
IN (
        SELECT
            MAX (p2.list_price)
        FROM
            production.products p2
        WHERE
            p2.category_id = p1.category_id
        GROUP BY
            p2.category_id
)


