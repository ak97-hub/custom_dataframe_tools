# Import the necessary libraries
import pandas as pd
import numpy as np
from cython.view cimport array

# Define a Cython function to split a DataFrame into chunks
cpdef list split_dataframe_by_column(df, str column_name):
    # Get the unique values from the specified column
    unique_values = df[column_name].unique()

    # Initialize a list to store the DataFrame chunks
    cdef list chunks = []

    # Iterate over unique values and split the DataFrame
    for value in unique_values:
        # Use a boolean mask to select rows with the current value
        mask = (df[column_name] == value)
        
        # Create a new DataFrame with the selected rows
        chunk = df[mask]
        
        # Append the chunk to the list of chunks
        chunks.append(chunk)
    
    return chunks

# Example usage:
if __name__ == "__main__":
    # Create a sample DataFrame
    data = {'ID': [1, 2, 3, 4, 5, 6],
            'Category': ['A', 'B', 'A', 'B', 'C', 'A']}
    df = pd.DataFrame(data)
    
    # Split the DataFrame by the 'Category' column
    result = split_dataframe_by_column(df, 'Category')
    
    # Print the resulting DataFrame chunks
    for chunk in result:
        print(chunk)

