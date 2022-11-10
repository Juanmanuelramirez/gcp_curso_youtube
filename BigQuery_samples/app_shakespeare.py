# Puedes ver más detalles de la tabla Shakespeare 
# En la consola de BigQuery en el siguiente Link
# https://bigquery.cloud.google.com/table/bigquery-public-data:samples.shakespeare

from google.cloud import bigquery

client = bigquery.Client()

query = """
    SELECT corpus AS title, COUNT(word) AS unique_words
    FROM `bigquery-public-data.samples.shakespeare`
    GROUP BY title
    ORDER BY unique_words
    DESC LIMIT 10
"""
results = client.query(query)

for row in results:
    title = row['title']
    unique_words = row['unique_words']
    print(f'{title:<20} | {unique_words}')