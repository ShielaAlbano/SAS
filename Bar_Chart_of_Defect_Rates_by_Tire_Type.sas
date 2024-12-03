/* Visualize defect rates for each tire type */
proc sql;
    create table defect_rates as
    select 
        tire_type, 
        sum(defect_flag) as defect_count, /* Total defects */
        count(*) as total_produced, /* Total produced */
        (calculated defect_count / calculated total_produced) * 100 as defect_rate format=8.2 /* Defect rate as a percentage */
    from 
        tire_data
    group by 
        tire_type;
quit;

proc sgplot data=defect_rates;
    vbar tire_type / response=defect_rate datalabel; /* Create a bar chart with defect rates */
    yaxis label="Defect Rate (%)";
    xaxis label="Tire Type";
    title "Defect Rates by Tire Type";
run;

/* Importance:
   Highlights which tire types have the highest defect rates, aiding quality control efforts.
*/
