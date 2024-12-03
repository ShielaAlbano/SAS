/* Analyzing defect trends over time by production line */
proc sql;
    create table defect_trends as
    select 
        production_line, 
        year(defect_date) as defect_year, /* Extract year */
        month(defect_date) as defect_month, /* Extract month */
        count(*) as monthly_defects /* Total defects per month */
    from 
        defect_data
    where 
        defect_flag = 1 /* Only consider defective tires */
    group by 
        production_line, defect_year, defect_month /* Group by line and time */
    order by 
        production_line, defect_year, defect_month; /* Logical ordering */
quit;

/* Importance:
   Tracks defect trends, enabling identification of problematic production lines and months requiring attention.
*/
