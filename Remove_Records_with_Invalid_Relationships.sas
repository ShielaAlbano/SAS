/* Step 8: Remove records with invalid date relationships */
data tire_data_cleaned_relationships;
    set tire_data_currency;

    /* Remove entries where the production date is after the sale date */
    if production_date > sale_date then delete;
run;

/* Importance:
   Ensures logical consistency in date relationships, preventing erroneous analysis.
*/
