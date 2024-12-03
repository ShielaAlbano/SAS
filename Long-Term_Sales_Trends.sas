/* Summarizing yearly sales trends for strategic planning */
proc sql;
    create table yearly_sales_trends as
    select 
        year(sale_date) as sale_year, /* Extract year */
        tire_type, 
        sum(quantity_sold) as total_units_sold, /* Total units sold */
        sum(quantity_sold * sale_price) as total_revenue format=dollar12.2 /* Total revenue */
    from 
        sales_data
    group by 
        sale_year, tire_type /* Group by year and tire type */
    order by 
        sale_year, tire_type; /* Logical ordering */
quit;

/* Importance:
   Tracks annual performance trends, helping guide long-term planning and product strategy.
*/
