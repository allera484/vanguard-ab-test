# vanguard-ab-test

  Project status(Active, On-Hold, Completed)

# Project objective

  We are starting a team project at Vanguard to decipher the findings from a recent digital experiment in the CX department. Our main goal as data analysts is to decipher the results of the A/B test that was run between March 15, 2017, and June 20, 2017. Renowned investment management company Vanguard aimed to improve its online customer experience with timely in-context reminders and a revamped User Interface (UI). Two groups participated in the experiment: the Test Group used the updated digital interface, while the Control Group used the conventional online procedure. Three primary datasets are included in our investigation: the Experiment Roster (df_final_experiment_clients), Digital Footprints (df_final_web_data), and Client Profiles (df_final_demo).In the upcoming weeks, our group's work will be carried out in an iterative manner that includes exploratory data analysis (EDA), key performance indicator (KPI) identification, hypothesis testing, cost-effectiveness assessment, and a comprehensive review of the experiment's design and duration. We use Tableau, Python, Pandas, Matplotlib, Seaborn, and Streamlit to produce thorough visuals and useful insights. By addressing both statistical significance and cost-effectiveness, this collaborative effort aims to provide a comprehensive understanding of how the new digital design affects user engagement and process completion rates. The result will be a polished and refined project presentation that captures the knowledge and insights of the team as a whole.

# Methods

  - ## Data Cleaning
      df_final_demo
      - Changed the name for the following columns: {'bal': 'balance', 'gendr': 'gender'}
      - Dropped 'X' Gender Values
      - Changed types to INT for ['clnt_age'], ['clnt_tenure_yr'], ['clnt_tenure_mnth']
      - Dropped NA - ONLY 14 Values
      - Change Balance format

      df_final_experimental_clients
      - Changed the name for the following columns: {'Variation':'variation'}

      df_final_web_data_pt_1
      - Dropped NA - Total 2095

      df_final_web_data_pt_2
      - Dropped NA - Total 8669

  - ## Data Import to SQL
      df_final_demo
      - Insert without any change

      df_final_experimental_clients
      - Verify if the [`client_id`] exist in the table already

      df_final_web_data_pt_1  & df_final_web_data_pt_2
      - Merge the clean data
      - Separate the data to be inserted into two different tables
      - Table that contains the data from the [`client_id`] that exist on the df_final_demo table
      - Table that contains the data of the [`client_id`] that doesn't on the df_final_demo table 

  - ## Answering the hypothesis:
      ### Hypothesis Age
      - 

      ### Hypothesis Tenure
      - **Hypothesis on Client Tenure & Hypothesis on Client Tenure-Related Completion Rate**:
        - Data Retrival:
          - Extract the relevant columns from 'df_final_demo', 'df_final_experiment_clients' and 'df_final_web_data' tables. Combine the datas from the tables to be utilize.
        - Data Visualization:
          - Create a boxplot to compare client tenure between control and test groups.
          - Create a lineplot to show the trend of client tenure against balance.
          - Create a barplot to visualize the completion rates by process step and client tenure.
          - Create a boxplot to display the completion times for different process steps and variations.
        - Calculate the Completion Time:
          - Convert 'date_time' column to datetime format
          - Calculate the completion time for each client by taking the difference between consecutive 'date_time' values.
        - Hypotehsis Testing:
          - For the first hypothesis:
            - Perform the t-test to asses whether there's a signifcant difference in the average client tenure between control and test groups. Analyze the p-value to determine whether to accept or reject the null hypothesis.
          - For the second hypothesis:
            - Perform the chi-squared test to examine the relationship between the client tenure and completion rates across different process step. Analyze the p-value to determine whether to accept or reject the null hypothesis.

      ### Hypothesis Gender
      - 

  - ## Visualizing on Tableau:
    - Utilize Tableau to replicate the graphs gotten on python to make them more interactual for the user.

# Technologies

  List of technologies and libraries used:
  - Technolgies
    - Jupither Notebook
    - Pyhton
    - MySQL
    - Tableau
  
  - Libraries:
    - pandas
    - SQLAlchemy
    - matplotlib
    - seaborn
    - PyYAML

# Project Description

  Three key datasets that shed light on the parameters of Vanguard's A/B testing trial are the center of our investigation. The foundation of customer profiles is the core dataset, df_final_demo, which offers a plethora of demographic data, including age, gender, and account details. This dataset provides context for comprehending the user personas involved in the digital experiment and captures the essence of Vanguard's diversified clientele. In addition, df_final_web_data records the complex digital traces that customers leave behind when navigating the online procedure. This dataset, which is divided into two sections, pt_1 and pt_2, records client interactions and actions and serves as a foundation for understanding user behavior. Finally, the experiment roster, df_final_experiment_clients, reveals the makeup of the Control and Test Groups, outlining clients' involvement in the old and new digital interfaces.

  These datasets were selected and organized to allow for a thorough investigation of the effects of the A/B test. The data includes client tenure, age and gender distribution, and specific steps taken during the online process. We want to perform a thorough exploratory data analysis (EDA) using Python tools such as Pandas, Matplotlib, and Seaborn in order to identify patterns, correlations, and possible outliers in these datasets. The team's cooperative efforts as we work through the complexities of the datasets and make sure that any problems with data cleaning are quickly resolved will determine the integrity and dependability of our results. These datasets will form the foundation of our insights as we explore the subtleties of client behavior and demographics, guiding the story toward a more profound comprehension of the A/B testing results.

# Steps

  Structure:
  ```
    vanguard-ab-test/
    ├── config.yaml
    ├── README.md
    ├── requirements.txt
    ├── data/
    │   ├── clean/
    │   ├── raw/
    │   └── sql/
    │        ├── Age_Analysis/
    │        └── Tenure_Analysis/
    ├── notebook/
    ├── presentation/
    │   └── Tableau/
    ├── resources/
    │   └── img/
    └── src/
        └── functions/
  ```

  ## Steps for Reproducing the Data
  1. **Original Data:**
    - Open the `data/raw` directory to view the original dataset.
  2. **Data Cleaning:**
    - To clean up the data, use the `VSR_CX_Vanguard.ipynb` notebook located in the `notebook` directory.
    - The `data/clean` directory will house the cleansed data.
  3. **Hypothesis Testing:**
    - You can use a SQL database or the cleaned data to address the assumptions.
    - SQL Database:
      - Run the `data/sql` directory's `ab_test_schema`.  
      - Utilizing the `ab_import.ipynb` file located in the `notebook` directory, import the cleaned data into the SQL database.
  4. **Query Testing:**
    - Using the sql datas in the `data/sql` file, test the hypothesis' queries.
  5. **Graphs and Hypothesis Testing:**
    - Create graphs, tables, and hypothesis tests with notebooks from the `notebook` directory.
  6. **Tableau Visualization:**
    - Refer to the `presentation/Tableau` file to examine graphical representations for every hypothesis in Tableau.

# Conclusion

  To sum up, a thorough examination of Vanguard's A/B testing project has revealed important information on the effects of a revised digital interface. In order to determine the efficacy of the new design, the project first investigated the demographics, behaviors, and KPIs of its clients. This was followed by hypothesis testing. The findings showed that although there is no statistically significant difference in client retention between users of the old and new processes, the duration of a client's stay did not significantly affect completion rates. The experiment's design was found to be effective, and the duration was thought to be sufficient for gathering useful data. With the help of Tableau, the project produced a number of eye-catching presentations that gave stakeholders an interactive, understandable account of the experiment's results. All things considered, this initiative gives Vanguard important information with which to make strategic choices about user experience and upcoming improvements to its digital platform.

# Contact
  linkedin, github, medium, etc
