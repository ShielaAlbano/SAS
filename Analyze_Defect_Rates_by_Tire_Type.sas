/* Analyzing defect rates by tire type to identify quality issues */
proc sql;
    create table defect_analysis as
    select 
        tire_type, 
        count(*) as total_produced, /* Total tires produced */
        sum(defect_flag) as total_defects, /* Total defective tires */
        (calculated total_defects / calculated total_produced) * 100 as defect_rate format=8.2 /* Defect rate as percentage */
    from 
        tire_production
    group by 
        tire_type /* Group by tire type */
    order by 
        defect_rate desc; /* Sort by highest defect rate */
quit;

/* Importance:
   Identifies tire types with the highest defect rates, helping focus quality control measures on problematic categories.
*/
