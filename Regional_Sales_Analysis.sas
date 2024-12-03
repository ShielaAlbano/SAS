/* Analyzing sales performance by region and tire type */
proc sql;
    create table regional_sales as
    select 
        region, 
        tire_type,
        count(*) as total_transactions, /* Total transactions per region */
        sum(quantity_sold) as total_units_sold, /* Total tires sold */
        sum(quantity_sold * sale_price) as total_revenue, /* Total revenue generated */
        mean(sale_price) as avg_sale_price format=8.2 /* Average sale price */
    from 
        sales_data
    group by 
        region, tire_type /* Group by region and tire type */
    order by 
        region, total_revenue desc; /* Order by region and revenue */
quit;

/* Importance:
   Highlights top-performing regions and tire types, guiding targeted marketing and resource allocation.
*/
