/* Step 5: Standardize region names */
data tire_data_standardized;
    set tire_data_validated;
    
    /* Standardize variations of region names */
    select (upcase(region));
        when ('NORTH ZONE', 'NORTHERN') region = 'North';
        when ('SOUTH ZONE', 'SOUTHERN') region = 'South';
        when ('EASTERN REGION', 'EAST ZONE') region = 'East';
        when ('WESTERN REGION', 'WEST ZONE') region = 'West';
        otherwise region = 'Unknown';
    end;
run;

/* Importance:
   Ensures region names are consistently formatted for accurate grouping and analysis.
*/
