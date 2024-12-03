/* Step 2: Deduplicate records by keeping the most recent entry for each tire_id */
proc sort data=tire_data_cleaned nodupkey;
    by tire_id descending last_updated; /* Retain the most recent entry based on last_updated */
run;

/* Importance:
   Removes redundant data while retaining the most accurate and recent records.
*/
