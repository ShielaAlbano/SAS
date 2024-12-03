/* Step 7: Normalize all sale prices to USD */
data tire_data_currency;
    set tire_data_dimensions;
    
    /* Apply conversion rates for non-USD prices */
    if currency = 'EUR' then sale_price = sale_price * 1.1; /* Example exchange rate */
    else if currency = 'GBP' then sale_price = sale_price * 1.3;
    else if currency ne 'USD' then sale_price = .; /* Mark unrecognized currencies as missing */
    currency = 'USD'; /* Standardize currency */
run;

/* Importance:
   Ensures all sale prices are in a consistent currency for easier comparison and analysis.
*/
