@echo off
SETLOCAL

REM Navigate to the directory containing your scripts
cd /d C:\Users\benda\OneDrive\Desktop\Salaries-ETL-Project\

REM Run the extract, load, and transform scripts in order
python src\extract.py
python src\load.py
python src\transform.py

echo ETL Pipeline executed successfully.
ENDLOCAL