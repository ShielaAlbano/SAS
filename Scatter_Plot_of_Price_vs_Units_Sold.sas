proc sgplot data=sales_data;
    scatter x=sale_price y=quantity_sold / datalabel=tire_type; /* Scatter plot of price and sales */
    xaxis label="Sale Price";
    yaxis label="Quantity Sold";
    title "Price vs. Units Sold";
run;

/* Importance:
   Shows the relationship between tire price and units sold, helping refine pricing strategies.
*/
