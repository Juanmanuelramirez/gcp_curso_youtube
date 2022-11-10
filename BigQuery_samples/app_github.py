# Para familiarizarse más con BigQuery, ahora emitirás una consulta 
# en el conjunto de datos públicos de GitHub . 
# Encontrarás los mensajes de confirmación más comunes en GitHub. 
# También usarás la consola web de BigQuery para obtener una vista previa 
# y ejecutar consultas ad-hoc.

# Para ver como se ven os datos abre el conjunto de datos Github
# En la la vista gráfica de BigQueary
# https://console.cloud.google.com/bigquery?p=bigquery-public-data&d=github_repos&t=commits&page=table

# Para ver cómo se ven los datos, abra el conjunto de datos 
# de GitHub en la IU web de BigQuery:
    
from google.cloud import bigquery

client = bigquery.Client()

query = """
    SELECT subject AS subject, COUNT(*) AS num_duplicates
    FROM bigquery-public-data.github_repos.commits
    GROUP BY subject
    ORDER BY num_duplicates
    DESC LIMIT 10
"""
results = client.query(query)

for row in results:
    subject = row['subject']
    num_duplicates = row['num_duplicates']
    print(f'{subject:<20} | {num_duplicates:>9,}')