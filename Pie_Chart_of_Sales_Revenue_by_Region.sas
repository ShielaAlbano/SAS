/* Calculate total revenue by region */
proc sql;
    create table regional_revenue as
    select 
        region, 
        sum(quantity_sold * sale_price) as total_revenue format=dollar12.2 /* Calculate total revenue */
    from 
        sales_data
    group by 
        region;
quit;

proc sgpie data=regional_revenue;
    pie region / response=total_revenue datalabel category=region; /* Create a pie chart */
    title "Revenue Contribution by Region";
run;

/* Importance:
   Visualizes revenue contribution from different regions to guide resource allocation.
*/
