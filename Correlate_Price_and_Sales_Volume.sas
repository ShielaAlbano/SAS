/* Correlation between sale price and sales volume by tire type */
proc sql;
    create table price_sales_correlation as
    select 
        tire_type, 
        corr(sale_price, quantity_sold) as correlation format=8.2 /* Correlation coefficient */
    from 
        sales_data
    group by 
        tire_type /* Group by tire type to calculate correlation for each category */
    order by 
        correlation desc;
quit;

/* Importance:
   Determines price sensitivity and supports pricing strategy optimization for each tire type.
*/
