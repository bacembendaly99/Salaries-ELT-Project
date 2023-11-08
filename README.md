# Salaries-ETL

## About
Salaries-ETL is a comprehensive ELT (Extract, Load, Transform) pipeline that manages job salary data. The pipeline is designed to extract data from CSV files, load it into a Dockerized PostgreSQL database, and perform transformations using dbt (data build tool).

## Project Architecture
The project is structured into several key directories:

- `.vscode`: Contains configuration files for Visual Studio Code.
- `config`: Includes configuration scripts for database connections.
- `data`: Houses the raw CSV files containing salary data.
- `dbt_project`: Contains dbt models, seeds, snapshots, and tests for data transformation.
- `logs`: Stores logs for monitoring dbt operations.
- `notebooks`: Jupyter notebooks for data analysis and exploration.
- `scripts`: Automation scripts for running the ELT pipeline.
- `sql`: Initialization SQL scripts for setting up the database schema.
- `src`: Python source code for extraction, loading, and transformation tasks.
- `tests`: Test cases for ensuring the integrity of the transformations.

## Features
- **Data Extraction**: Scripted extraction of salary data from structured CSV files.
- **Data Loading**: Dockerized PostgreSQL database for data storage.
- **Data Transformation**: Utilization of dbt to model and transform the data efficiently.

## Technologies
- **Python**: Used for scripting extraction and load processes.
- **PostgreSQL**: Serves as the data storage workhorse.
- **Docker**: Ensures an isolated environment for the PostgreSQL database.
- **dbt**: Handles data modeling and transformations.
- **Jupyter Notebooks**: Used for data exploration and analysis.

## How to Use
Follow these steps to use the Salaries-ETL pipeline:

1. Ensure that Docker, PostgreSQL, and dbt are correctly installed on your system.
2. Clone the repository to your local environment.
3. Analyze the transformed data using Jupyter Notebooks in the `notebooks` directory.
3. Run the `run_etl.bat` script found in the `scripts` directory to initiate the ELT process.
4. Run dbt project using "dbt run" to simulate the transformation using dbt



## Contact
Should you encounter any issues or have any inquiries, feel free to file an issue on the project's GitHub issue tracker.
