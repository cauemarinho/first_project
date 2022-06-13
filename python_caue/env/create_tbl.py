from google.cloud import bigquery

bqclient = bigquery.Client()


# query_string = """
# SELECT * 
# FROM cauemarinho-training.python_generate.raw_data
# """

query_string="""
CREATE TABLE cauemarinho-training.python_generate.raw_data
(id int,
name string,
qualification string,
created_at DATETIME);
"""


dataframe = (
    bqclient.query(query_string)
    .result()
    .to_dataframe(create_bqstorage_client=True)
)
#print(dataframe.head())