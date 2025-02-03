-- List all product categories available in the inventory
select distinct category 
	from products; 

-- Identify the top 5 customer_id with the highest purchase base on quantity of purchase.
select customer_id, sum(quantity) 
	from sales
	Group by customer_id
	order by sum(quantity) desc
	limit 5;

-- Count the number of products available in each category
select distinct category, sum(stock_level) as number_of_products 
	from products
	group by category
	order by category asc;


-- Identify the top 5 customer_id based on their total spending
select s.customer_id,  sum(s.quantity * p.price) as total_spending
	from sales as s join products as p
	on s.product_id = p.product_id
	group by customer_id
	order by total_spending desc
	limit 5;

-- List all customers and their corresponding sales. Include customers who have not made any purchases
select c.customer_id, c.customer_name, s.sale_id, s.sale_date, s.product_id, s.quantity
	from customers as c 
	left join sales as s 
	on c.customer_id = s.customer_id;

-- List all products and the details of their sales, including products that haven't been sold
select p.product_name, p.product_id, s.sale_id, s.sale_date, s.customer_id
	from sales as s 
	right join products as p 
	on s.product_id = p.product_id;

/*** List all customers and all products, showing customer details along with product details where applicable. 
	Include customers who have not bought anything and products that haven't been sold. **/

select c.customer_id, c.customer_name,
	c.email, c.phone, p.product_id,p.product_name, p.category
	from customers as c
	full join sales as s on c.customer_id = s.customer_id
	full join products as p on s.product_id = p.product_id;


-- Identify the top 5 customer (customer_name) with the highest purchase base on quantity of purchase.
select c.customer_name, sum(s.quantity) 
	from customers as c 
	left join sales as s 
	on c.customer_id = s.customer_id
	Group by c.customer_name
	order by sum(s.quantity) desc
	limit 5;