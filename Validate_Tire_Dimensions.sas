/* Step 6: Validate tire dimensions */
data tire_data_dimensions;
    set tire_data_standardized;

    /* Validate and set missing values for invalid tire dimensions */
    if diameter < 10 or diameter > 30 then diameter = .;
    if width < 100 or width > 500 then width = .;
    if aspect_ratio < 10 or aspect_ratio > 100 then aspect_ratio = .;
run;

/* Importance:
   Ensures tire dimensions fall within logical ranges, maintaining data accuracy and reliability.
*/
