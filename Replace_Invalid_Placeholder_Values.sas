/* Step 3: Replace placeholder values with missing values */
data tire_data_replaced;
    set tire_data_cleaned;
    
    /* Replace 'N/A', 'Unknown', or zero values with SAS missing values (.) */
    if region = 'N/A' or region = 'Unknown' then region = '';
    if sale_price = 0 then sale_price = .;
    if production_date = '1900-01-01' then production_date = .;
run;

/* Importance:
   Converts invalid or placeholder values to missing values for proper handling during analysis.
*/
