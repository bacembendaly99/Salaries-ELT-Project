import pandas as pd
import psycopg2
from sqlalchemy import create_engine

def load_data(file_path, db_details):
    """
    Load data into a PostgreSQL database from a CSV file.
    
    Parameters:
    file_path (str): The path to the CSV file containing the data.
    db_details (dict): A dictionary containing the database connection details.
    """
    # Read the data from CSV into a DataFrame
    data = pd.read_csv(file_path)

    # Create a SQLAlchemy engine
    engine = create_engine(f'postgresql://{db_details["user"]}:{db_details["password"]}@{db_details["host"]}:{db_details["port"]}/{db_details["dbname"]}')

    # Use the engine to load data into the specified table in the database
    data.to_sql(db_details["table_name"], engine, if_exists='replace', index=False)

    print(f"Data loaded successfully into {db_details['dbname']}.{db_details['table_name']}")

if __name__ == "__main__":
    # Define the path to your CSV file
    file_path = './data/ExtractedSalaries.csv'

    # Define your database connection details
    db_details = {
    "user": "postgres",
    "password": "1234",  # The password you set for your PostgreSQL Docker container
    "host": "localhost",
    "port": "5432",
    "dbname": "salaries_dbt_project",  # Or another name if you created a specific database
    "table_name": "salaries"  # The name you want to give to the table containing your dataset
}


    # Call the load_data function
    load_data(file_path, db_details)
