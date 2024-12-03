/* Calculating inventory turnover rates by tire type */
proc sql;
    create table inventory_turnover as
    select 
        tire_type, 
        sum(starting_inventory + replenishments - ending_inventory) as total_inventory, /* Total inventory handled */
        sum(units_sold) as total_units_sold, /* Total units sold */
        (calculated total_units_sold / calculated total_inventory) as turnover_rate format=8.2 /* Inventory turnover rate */
    from 
        inventory_data
    group by 
        tire_type /* Group by tire type */
    order by 
        turnover_rate desc; /* Sort by turnover rate */
quit;

/* Importance:
   Identifies tire types with efficient inventory turnover, aiding in stock management and reducing carrying costs.
*/
