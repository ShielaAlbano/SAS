/* Analyzing defect rates by material type */
proc sql;
    create table material_defects as
    select 
        material_type, 
        count(*) as total_tires, /* Total tires of the material */
        sum(defect_flag) as defects, /* Total defects */
        (calculated defects / calculated total_tires) * 100 as defect_rate format=8.2 /* Defect rate percentage */
    from 
        material_data
    group by 
        material_type /* Group by material type */
    order by 
        defect_rate desc; /* Sort by highest defect rate */
quit;

/* Importance:
   Identifies materials prone to defects, aiding in material quality control and procurement decisions.
*/
