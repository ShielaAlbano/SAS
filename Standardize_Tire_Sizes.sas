Quality Control: Identify defects and problematic production processes or materials.
Operational Efficiency: Evaluate inventory turnover and streamline stock management.
Customer Insights: Analyze sales trends and warranty claims to improve customer satisfaction.
Strategic Planning: Leverage long-term trends to inform decision-making and resource allocation.
Cost Reduction: Highlight inefficiencies and reduce costs related to defects, warranties, and inventory.


/* Step 1: Load the dataset and standardize tire sizes */
data tire_data_cleaned;
    set tire_data;
    
    /* Convert tire size to uppercase and remove any unwanted characters */
    tire_size = upcase(compress(tire_size, 'abcdefghijklmnopqrstuvwxyz~`!@#$%^&*()_+|}{[]\\:;<>,.?/'));
    
    /* Remove leading and trailing spaces */
    tire_size = strip(tire_size);
run;

/* Importance:
   Ensures that tire sizes are consistently formatted, preventing issues in matching or analysis.
*/
