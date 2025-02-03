# GadgetGalaxy-Inventory
## Product Analysis: Business Inventory Management

<img src="https://github.com/jamesehiabhi/GadgetGalaxy-Inventory/blob/main/Displays/Galaxy_Cover.png" alt="Displays" width="800" height="400"/> 

### Introduction
This report provides an in-depth analysis of Gadget Galaxy's database, offering valuable insights into product categories, customer purchases, and sales details. The analysis aims to answer specific questions to help Gadget Galaxy make informed decisions to enhance their inventory management and customer relationship strategies.

#### 1. Product Categories Available in the Inventory
To list all product categories available in the inventory, we use the following SQL query:

    SELECT DISTINCT category
    FROM products;

This query retrieves all unique product categories from the products table. The distinct categories help Gadget Galaxy understand the diversity of their product offerings.

#### 2. Top 5 Customers with the Highest Purchase Quantity
To identify the top 5 customers based on purchase quantity, we use:

    SELECT customer_id, SUM(quantity) 
    FROM sales
    GROUP BY customer_id
    ORDER BY SUM(quantity) DESC
    LIMIT 5;

This query sums the purchase quantities for each customer and orders them in descending order, limiting the result to the top 5. Identifying these top customers can help Gadget Galaxy tailor their marketing strategies to retain and reward their most valuable customers.

#### 3. Number of Products Available in Each Category
To count the number of products available in each category, we use:

    SELECT category, SUM(stock_level) AS number_of_products 
    FROM products
    GROUP BY category
    ORDER BY category ASC;

This query groups products by category and sums their stock levels. Understanding the stock levels in each category helps in managing inventory more effectively and ensuring that popular categories are well-stocked.

#### 4. Top 5 Customers Based on Total Spending
To identify the top 5 customers based on their total spending, we use:

    SELECT s.customer_id, SUM(s.quantity * p.price) AS total_spending
    FROM sales AS s 
    JOIN products AS p ON s.product_id = p.product_id
    GROUP BY customer_id
    ORDER BY total_spending DESC
    LIMIT 5;

This query calculates the total spending by multiplying the quantity of products purchased by their price and summing it up for each customer. Knowing the top spenders can help Gadget Galaxy focus on high-value customers and create personalized offers to increase their loyalty.

#### 5. All Customers and Their Corresponding Sales
To list all customers and their corresponding sales, including those who have not made any purchases, we use:

    SELECT c.customer_id, c.customer_name, s.sale_id, s.sale_date, s.product_id, s.quantity
    FROM customers AS c 
    LEFT JOIN sales AS s ON c.customer_id = s.customer_id;

This query performs a left join to include all customers, even those without sales records. This comprehensive view helps Gadget Galaxy understand customer behavior and identify potential customers who may need more engagement.

#### 6. All Products and Details of Their Sales
To list all products and the details of their sales, including products that haven't been sold, we use:

    SELECT p.product_name, p.product_id, s.sale_id, s.sale_date, s.customer_id
    FROM sales AS s 
    RIGHT JOIN products AS p ON s.product_id = p.product_id;

This query performs a right join to include all products, even those without sales records. This information is crucial for identifying slow-moving products and making decisions about promotions or discontinuation.

#### 7. All Customers and All Products
To list all customers and all products, showing customer details and product details where applicable, we use:

    SELECT c.customer_id, c.customer_name, c.email, c.phone, p.product_id, p.product_name, p.category
    FROM customers AS c
    FULL JOIN sales AS s ON c.customer_id = s.customer_id
    FULL JOIN products AS p ON s.product_id = p.product_id;

This query performs a full join to include all customers and products, even if there are no corresponding sales records. This holistic view helps Gadget Galaxy understand the complete landscape of their customer base and product inventory.

#### 8. Top 5 Customers (Customer Name) with the Highest Purchase Quantity
To identify the top 5 customers by name based on purchase quantity, we use:

    SELECT c.customer_name, SUM(s.quantity) 
    FROM customers AS c 
    LEFT JOIN sales AS s ON c.customer_id = s.customer_id
    GROUP BY c.customer_name
    ORDER BY SUM(s.quantity) DESC
    LIMIT 5;

This query sums the purchase quantities for each customer name and orders them in descending order, limiting the result to the top 5. Recognizing these top customers by name can help in personalizing communication and building stronger relationships.

<br>

<img src="https://github.com/jamesehiabhi/GadgetGalaxy-Inventory/blob/main/Displays/Total%20Number_EachCat.png" alt="Displays" width="800" height="400"/> 
<img src="https://github.com/jamesehiabhi/GadgetGalaxy-Inventory/blob/main/Displays/Highest_Quantity.png" alt="Displays" width="800" height="400"/> 
<img src="https://github.com/jamesehiabhi/GadgetGalaxy-Inventory/blob/main/Displays/All_Categories.png" alt="Displays" width="800" height="400"/> 

________________________________________
### Conclusion
This report provides a comprehensive analysis of Gadget Galaxy's database, offering insights into product categories, customer purchases, and sales details. These insights can help Gadget Galaxy make informed decisions to enhance their inventory management and customer relationship strategies. By focusing on top customers and understanding product performance, Gadget Galaxy can drive growth and improve customer satisfaction.
________________________________________
<br>

### *Kindly share your feedback and I am happy to Connect 🌟*

<img src="https://github.com/jamesehiabhi/GadgetGalaxy-Inventory/blob/main/Displays/My%20Card1.jpg" alt="Displays" width="600" height="150"/>



