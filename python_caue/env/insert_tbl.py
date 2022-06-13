import pandas as pd
from datetime import datetime
from google.cloud import bigquery

bqclient = bigquery.Client()  

data = {'Id': [1,2,3,4],
        'Name': ['Jai', 'Princi', 'Gaurav', 'Anuj'],
        'Qualification': ['Msc', 'MA', 'Msc', 'Msc']}
  

df = pd.DataFrame(data)
dt = datetime.now()
df.insert(3, "created_at", dt, True)
  

client = bigquery.Client()
table_id = 'cauemarinho-training.python_generate.raw_data'

job = bqclient.load_table_from_dataframe(
    df, table_id
)

job.result()