/* Step 10: Archive records older than 5 years */
data tire_data_archive tire_data_active;
    set tire_data_imputed;

    /* Separate records into archive and active datasets */
    if production_date < intnx('year', today(), -5, 'same') then output tire_data_archive;
    else output tire_data_active;
run;

/* Importance:
   Optimizes the active dataset for current operations while preserving older records for historical analysis.
*/
