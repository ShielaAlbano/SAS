/* Summarizing warranty claims for each tire type */
proc sql;
    create table warranty_summary as
    select 
        tire_type, 
        count(*) as total_claims, /* Total claims filed */
        sum(claim_amount) as total_claim_value format=dollar12.2, /* Total value of claims */
        mean(claim_amount) as avg_claim_value format=dollar8.2 /* Average claim value */
    from 
        warranty_claims
    group by 
        tire_type /* Group by tire type */
    order by 
        total_claim_value desc; /* Sort by total claim value */
quit;

/* Importance:
   Identifies costly warranty claims and helps refine warranty policies to reduce expenses.
*/
