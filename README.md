# Workable dlt-dbt Package

### Overview
The Workable dlt-dbt package offers data models to help you transform and analyze Workable data. It's designed to integrate seamlessly with the dlt Workable pipeline, which extracts and loads Workable data into your data warehouse.

### Who is this for?
This package is perfect for dbt users who want to integrate Workable data into their analytics workflows without building models from scratch.


### Key Features
- **Staging Models:** Clean and prepare raw Workable data for downstream analysis.
- **Mart Models:** Pre-built dimension and fact tables for key Workable entities like events, jobs, etc.
- **Incremental Loading:** Supports incremental data processing to optimize performance.
- **Easy Integration:** Designed to work out-of-the-box with the dlt Workable pipeline.

### Setup Instructions

#### Prerequisites
- dbt Core installed in your environment.
- Access to a supported data warehouse: BigQuery, Snowflake, Redshift, Athena, or PostgreSQL.
- The dlt Workable pipeline is set up and running.

### Step 1: Set Up the dlt Workable Pipeline
1. **Install dlt:**
   ``` 
   pip install dlt
   ```
2. **Configure the Pipeline:**
   Follow the dlt [Workable pipeline documentation](https://dlthub.com/docs/dlt-ecosystem/verified-sources/workable) to set up your pipeline. Ensure you have your Workable API key, subdomain and destination credentials configured.

3. **Run the Pipeline:**
   Extract and load data from Workable into your data warehouse by running the pipelines.

### Step 2: Install and Configure the dbt Project

1. Install the Workable dbt package into your dbt environment.
2. Configure your 'dbt_project.yml' file with the appropriate connection details for your data warehouse.
3. Ensure the data from your dlt Workable pipeline is available in your warehouse.

This is how the tables in dbt packages look like:
```text
dbt_workable/
├── models/
│   ├── marts/
│   │   ├── dim__dlt_loads.sql
│   │   ├── dim_candidates.sql
│   │   ├── dim_events__members.sql
│   │   ├── dim_events.sql
│   │   ├── dim_jobs__locations.sql
│   │   ├── dim_jobs.sql
│   │   ├── dim_members.sql
│   │   ├── dim_stages.sql
│   ├── staging/
│   │   ├── stg__dlt_loads.sql
│   │   ├── stg_candidates.sql
│   │   ├── stg_events__members.sql
│   │   ├── stg_events.sql
│   │   ├── stg_jobs__locations.sql
│   │   ├── stg_jobs.sql
│   │   ├── stg_members.sql
│   │   ├── stg_stages.sql
│   ├── dlt_active_load_ids.sql
│   ├── dlt_processed_load_ids.sql
│   ├── sources.yml
├── dbt_project.yml
├── requirements.txt
```

### Step 3: Run dbt
Execute the dbt models to transform the raw Workable data into useful tables:

```sh
dbt build
```

### Customization
While this package provides a solid foundation, you can customize it to suit your specific needs:

- Modify the models to align with your business logic.
- Add relationships between tables by modifying your dlt pipeline schema.

> The dimensional modelling part of the package was created with a declarative code generator and suffers from 
> limitations inherent to modelling raw data directly. We advise you consider the raw data tables and adjust 
> the modelled layer as needed.

### Schema diagram
The dbt model above can be further customized according to the requirements. Using this package you'll get a basic template
for data model which can be further modified as required.

1. The schema of Workable data modelled above using dlt-dbt-generator:
    
   ![picture](https://storage.googleapis.com/dlt-blog-images/workable_dlt_dbt_v0.1.0.png)


> ⚠️ **Note:**
> 
> Please note that this is a starting template for your data model and is not the final product. It is advised to customize the data model as per your needs.

   Here's the link to the DB diagram: [link](https://dbdiagram.io/d/workable_dlt_dbt_v0-1-0-67b17208263d6cf9a04c1cab).

#### Optional: Advanced Usage (Generator and Licensing)

This package was created using the dlt-dbt-generator by dlt-plus. For more information about dlt-plus, refer to the 
[dlt-plus documentation](https://dlt-plus.netlify.app/docs/plus/intro/). To learn more about the dlt-dbt-generator, 
consult the [dlt-dbt-generator](https://dlthub.com/blog/dbt-gen) documentation.

> The dimensional modelling part of the package was created with a declarative code generator and suffers from 
> limitations inherent to modelling raw data directly. We advise you consider the raw data tables and adjust 
> the modelled layer as needed.
