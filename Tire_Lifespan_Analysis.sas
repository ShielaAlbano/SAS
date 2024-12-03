/* Analyzing average tire lifespan based on usage and failure data */
proc sql;
    create table tire_lifespan as
    select 
        tire_id, 
        intck('month', production_date, failure_date) as lifespan_months, /* Calculate lifespan in months */
        case 
            when mileage <= 20000 then "Low Usage"
            when mileage <= 40000 then "Medium Usage"
            else "High Usage"
        end as usage_category /* Categorize by usage */
    from 
        tire_usage_data
    where 
        failure_date is not null; /* Only consider tires with recorded failures */
quit;

/* Importance:
   Helps predict replacement timelines based on usage patterns and lifespan data.
*/
