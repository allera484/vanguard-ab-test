# vanguard-ab-test

# Data Cleaning

## df_final_demo
- Changed the name for the following columns: {'bal': 'balance', 'gendr': 'gender'}
- Dropped 'X' Gender Values
- Changed types to INT for ['clnt_age'], ['clnt_tenure_yr'], ['clnt_tenure_mnth']
- Dropped NA - ONLY 14 Values
- Change Balance format

## df_final_experimental_clients
- Changed the name for the following columns: {'Variation':'variation'}

## df_final_web_data_pt_1
- Dropped NA - Total 2095

## df_final_web_data_pt_2
- Dropped NA - Total 8669


  Project status(Active, On-Hold, Completed)
# Project objective

  Paragraph with introduction/ objective of project
# Methods

  List with methods, ex:
  - Filtering
  - Grouping
  - Visualization
# Technologies

  List with used technologies, ex:
  - Python
  - Pandas
  - MySQL
# Project Description

  Paragraph with a description of the dataset, sources, characteristics ,etc.

# Steps
  Add here any insights you had during the project

  Structure:
vanguard-ab-test/
├── config.yaml
├── README.md
├── requirements.txt
├── data/
│   └── raw/
│   │    ├── df_final_demo.txt
│   │    ├── df_final_experiment_clients.txt
│   │    ├── df_final_web_data_pt_1.txt
│   │    └── df_final_web_data_pt_2.txt
│   └── sql/
│        └── ab_test_schema.sql
├── notebook/
│   └── ab_import.ipynb
└── src/
    └── functions/
        └── ab_clean.py

# Conclusion
  Final conclusion

# Contact
  linkedin, github, medium, etc

