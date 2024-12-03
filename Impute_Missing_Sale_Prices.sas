/* Step 9: Fill missing sale prices with the average price for the same tire type */
proc sql;
    create table tire_data_imputed as
    select 
        *,
        coalesce(sale_price, mean(sale_price)) as imputed_sale_price
    from 
        tire_data_cleaned_relationships
    group by 
        tire_type;
quit;

/* Importance:
   Prevents missing sale prices from skewing revenue analysis by filling them with logical averages.
*/
