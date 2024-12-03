/* Analyzing monthly sales trends to identify seasonal patterns */
proc sql;
    create table monthly_sales as
    select 
        month(sale_date) as sale_month, /* Extract month from sale date */
        count(*) as total_sales, /* Total number of sales */
        sum(quantity_sold) as total_units_sold, /* Total tires sold */
        sum(quantity_sold * sale_price) as total_revenue /* Total revenue */
    from 
        sales_data
    group by 
        sale_month /* Group data by sale month */
    order by 
        sale_month; /* Order by month for logical flow */
quit;

/* Importance:
   Provides insights into seasonal sales trends, enabling better inventory planning and marketing strategies.
*/
