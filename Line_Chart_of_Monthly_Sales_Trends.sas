/* Aggregate sales data by month */
proc sql;
    create table monthly_sales as
    select 
        month(sale_date) as sale_month, /* Extract month from sale date */
        sum(quantity_sold) as total_units_sold /* Total units sold */
    from 
        sales_data
    group by 
        calculated sale_month;
quit;

proc sgplot data=monthly_sales;
    series x=sale_month y=total_units_sold / markers; /* Create a line chart with markers */
    xaxis label="Month" integer values=(1 to 12);
    yaxis label="Total Units Sold";
    title "Monthly Sales Trends";
run;

/* Importance:
   Helps identify seasonal patterns in tire sales, enabling better inventory and marketing strategies.
*/
