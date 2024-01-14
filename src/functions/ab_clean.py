import pandas as pd
from sqlalchemy import create_engine

def read_csv(file_path):
    ''' Reads a CSV file and returns a pandas DataFrame.
    Usage: This function only takes as parameters the path of the file.
    Return: Dataframe of the CSV.
    '''
    return pd.read_csv(file_path)

def connect_to_db(user, password, database_name):
    ''' Establishes a connection to the MySQL database and returns an engine object using SQLAlchemy with the provided password and database name.
    Usage: This function takes three parameters the user name, the password to MySQL and the name of the database your going to insert the data.
    Return: Engine object that is connected to the database.
    '''
    connection_string = f'mysql+pymysql://{user}:' + password + '@localhost/' + database_name
    return create_engine(connection_string)

def insert_to_table(data, engine, table_name):
    '''Inserts data into the specified table in the database using SQLAlchemy 'to_sql()' method.
    Usage: This function takes three parameters the data to be inserted, the engine that was created and the name of the table your going to insert the data.
    Return: The number of row of data inserted.
    '''
    data.to_sql(table_name, con=engine, if_exists='replace',index=False)

def filter_data(data, unique_client_ids):
    '''Filters data based on unique_client_ids (list/array) and returns the filtered DataFrame.
    Usage: This function takes two parameters the data to be analyze and the list of unique client_ids.
    Return: Dataframe that only contains the client_ids given.
    '''
    return data[data['client_id'].isin(unique_client_ids)]

def reset_index(data):
    '''Resets the index and renames the index column to 'id' in the DataFrame.
    Usage: This function only takes one paramether which is the dataset given.
    Return: Dataframe that contains a new column called id.
    '''
    data.reset_index(inplace=True)
    data.rename(columns={'index': 'id'}, inplace=True)