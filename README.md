# vanguard-ab-test

  Project status(Active, On-Hold, Completed)
# Project objective

  'Paragraph with introduction/ objective of project'

  We are starting a team project at Vanguard to decipher the findings from a recent digital experiment in the CX department. Our main goal as data analysts is to decipher the results of the A/B test that was run between March 15, 2017, and June 20, 2017. Renowned investment management company Vanguard aimed to improve its online customer experience with timely in-context reminders and a revamped User Interface (UI). Two groups participated in the experiment: the Test Group used the updated digital interface, while the Control Group used the conventional online procedure. Three primary datasets are included in our investigation: the Experiment Roster (df_final_experiment_clients), Digital Footprints (df_final_web_data), and Client Profiles (df_final_demo).In the upcoming weeks, our group's work will be carried out in an iterative manner that includes exploratory data analysis (EDA), key performance indicator (KPI) identification, hypothesis testing, cost-effectiveness assessment, and a comprehensive review of the experiment's design and duration. We use Tableau, Python, Pandas, Matplotlib, Seaborn, and Streamlit to produce thorough visuals and useful insights. By addressing both statistical significance and cost-effectiveness, this collaborative effort aims to provide a comprehensive understanding of how the new digital design affects user engagement and process completion rates. The result will be a polished and refined project presentation that captures the knowledge and insights of the team as a whole.

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

  'Paragraph with a description of the dataset, sources, characteristics ,etc.'

  Three key datasets that shed light on the parameters of Vanguard's A/B testing trial are the center of our investigation. The foundation of customer profiles is the core dataset, df_final_demo, which offers a plethora of demographic data, including age, gender, and account details. This dataset provides context for comprehending the user personas involved in the digital experiment and captures the essence of Vanguard's diversified clientele. In addition, df_final_web_data records the complex digital traces that customers leave behind when navigating the online procedure. This dataset, which is divided into two sections, pt_1 and pt_2, records client interactions and actions and serves as a foundation for understanding user behavior. Finally, the experiment roster, df_final_experiment_clients, reveals the makeup of the Control and Test Groups, outlining clients' involvement in the old and new digital interfaces.

  These datasets were selected and organized to allow for a thorough investigation of the effects of the A/B test. The data includes client tenure, age and gender distribution, and specific steps taken during the online process. We want to perform a thorough exploratory data analysis (EDA) using Python tools such as Pandas, Matplotlib, and Seaborn in order to identify patterns, correlations, and possible outliers in these datasets. The team's cooperative efforts as we work through the complexities of the datasets and make sure that any problems with data cleaning are quickly resolved will determine the integrity and dependability of our results. These datasets will form the foundation of our insights as we explore the subtleties of client behavior and demographics, guiding the story toward a more profound comprehension of the A/B testing results.

# Steps

  'Add here any insights you had during the project'

  Structure: 
  ```
    vanguard-ab-test/
    ├── config.yaml
    ├── README.md
    ├── requirements.txt
    ├── data/
    │   └── clean/
    │   │    ├── clean_df_demo.csv
    │   │    ├── clean_df_experiment_clients.csv
    │   │    ├── clean_df_web_data_pt_1.csv
    │   │    └── clean_df_web_data_pt_2.csv
    │   └── raw/
    │   │    ├── df_final_demo.txt
    │   │    ├── df_final_experiment_clients.txt
    │   │    ├── df_final_web_data_pt_1.txt
    │   │    └── df_final_web_data_pt_2.txt
    │   └── sql/
    │        └── ab_test_schema.sql
    ├── notebook/
    │   ├── ab_import.ipynb
    │   └── VSR_CX_Vanguard.ipynb
    └── src/
        └── functions/
            └── ab_clean.py
        └── app/
            └── main.py
  ```

  Order to run and get the codes:
  I. Run the VSR_CX_Vanguard.ipynb to get the clean the raw data and create the clean csv data.
  II. Run the ab_test_schema.sql to create the tables on sql and be able to insert the data
  III. Run the ab_import.ipynb to insert the clean data and begin working on the analisis.

# Conclusion
  Final conclusion

# Contact
  linkedin, github, medium, etc
