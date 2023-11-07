import pandas as pd
import psycopg2
from sqlalchemy import create_engine

# PostgreSQL connection info
POSTGRES_ADDRESS = 'localhost' 
POSTGRES_PORT = '5432'
POSTGRES_USERNAME = 'postgres'  
POSTGRES_PASSWORD = '1234'  
POSTGRES_DBNAME = 'salaries_dbt_project'  

# Create a connection to the PostgreSQL database
engine = create_engine(f'postgresql://{POSTGRES_USERNAME}:{POSTGRES_PASSWORD}@{POSTGRES_ADDRESS}:{POSTGRES_PORT}/{POSTGRES_DBNAME}')

# SQL query to select all rows from the original table
sql_query = 'SELECT * FROM salaries'

# Read the data from PostgreSQL into a pandas DataFrame
df = pd.read_sql(sql_query, engine)

# Define the mappings from codes to meaningful labels
experience_level_mapping = {
    'EN': 'Entry-level / Junior',
    'MI': 'Mid-level / Intermediate',
    'SE': 'Senior-level / Expert',
    'EX': 'Executive-level / Director'
}

employment_type_mapping = {
    'PT': 'Part-time',
    'FT': 'Full-time',
    'CT': 'Contract',
    'FL': 'Freelance'
}

remote_ratio_mapping = {
    0: 'No remote work',
    50: 'Partially remote',
    100: 'Fully remote'
}

company_size_mapping = {
    'S': 'less than 50 employees',
    'M': '50 to 250 employees',
    'L': 'more than 250 employees'
}

# Use the `map` function to replace the codes in the DataFrame with meaningful labels
df['experience_level'] = df['experience_level'].map(experience_level_mapping)
df['employment_type'] = df['employment_type'].map(employment_type_mapping)
df['remote_ratio'] = df['remote_ratio'].map(remote_ratio_mapping)
df['company_size'] = df['company_size'].map(company_size_mapping)

# If company_location needs a similar mapping, you would add that here too

# Now write the transformed DataFrame back to a new table in PostgreSQL
df.to_sql('transformed_table_salaries', engine, if_exists='replace', index=False)

print("Transformation complete and new table created.")


